// C/C++ includes

#include <cmath>
#include <cstring>
#include <stdint.h>
#include <stdio.h>
#include <type_traits>

// Intrinsics includes

#include <cpuid.h>
#include <x86intrin.h>

// Remill includes (in order)

#include "remill/Arch/Runtime/Intrinsics.h"
#include "remill/Arch/Runtime/Operators.h"
#include "remill/Arch/Runtime/Types.h"

// Arithmetic and logic flags includes

#include "LLVMFlags.h"

// Useful intrinsics @ https://clang.llvm.org/docs/LanguageExtensions.html

// The semantics are exported to the lifter with the SEM_ prefix

#define DEFINE_SEMANTIC(name) extern "C" constexpr auto SEM_##name [[gnu::used]]
#if ADDRESS_SIZE_BITS == 64
#define DEFINE_SEMANTIC_32(name) DEFINE_SEMANTIC(UNDEF_##name)
#define DEFINE_SEMANTIC_64(name) DEFINE_SEMANTIC(name)
#else
#define DEFINE_SEMANTIC_32(name) DEFINE_SEMANTIC(name)
#define DEFINE_SEMANTIC_64(name) DEFINE_SEMANTIC(UNDEF_##name)
#endif
#define TYPE_BITSIZE(type) sizeof(type) * 8;

// Structure to represent a VMProtect virtual register

IF_64BIT(struct VirtualRegister final {
  union {
    alignas(1) struct {
      uint8_t b0;
      uint8_t b1;
      uint8_t b2;
      uint8_t b3;
      uint8_t b4;
      uint8_t b5;
      uint8_t b6;
      uint8_t b7;
    } byte;
    alignas(2) struct {
      uint16_t w0;
      uint16_t w1;
      uint16_t w2;
      uint16_t w3;
    } word;
    alignas(4) struct {
      uint32_t d0;
      uint32_t d1;
    } dword;
    alignas(8) uint64_t qword;
  } __attribute__((packed));
} __attribute__((packed));)

IF_32BIT(struct VirtualRegister final {
  union {
    alignas(1) struct {
      uint8_t b0;
      uint8_t b1;
      uint8_t b2;
      uint8_t b3;
    } byte;
    alignas(2) struct {
      uint16_t w0;
      uint16_t w1;
    } word;
    alignas(4) uint32_t dword;
  } __attribute__((packed));
} __attribute__((packed));)

static_assert(sizeof(VirtualRegister) * 8 == ADDRESS_SIZE_BITS,
              "VirtualRegister size has to be equal to address size");

extern "C" uint8_t RAM[0];
extern "C" uint8_t GS[0];
extern "C" uint8_t FS[0];

// Define NoAlias pointers

using rptr = size_t &__restrict__;

// Structure to represent a virtual context

IF_64BIT(struct VirtualContext final {
  VirtualRegister rax;
  VirtualRegister rbx;
  VirtualRegister rcx;
  VirtualRegister rdx;
  VirtualRegister rsi;
  VirtualRegister rdi;
  VirtualRegister rbp;
  VirtualRegister rsp;
  VirtualRegister r8;
  VirtualRegister r9;
  VirtualRegister r10;
  VirtualRegister r11;
  VirtualRegister r12;
  VirtualRegister r13;
  VirtualRegister r14;
  VirtualRegister r15;
} __attribute__((packed));)

IF_32BIT(struct VirtualContext final {
  VirtualRegister eax;
  VirtualRegister ebx;
  VirtualRegister ecx;
  VirtualRegister edx;
  VirtualRegister esi;
  VirtualRegister edi;
  VirtualRegister ebp;
  VirtualRegister esp;
} __attribute__((packed));)

// Undefine function, it must return 'undef' at runtime

extern "C" size_t __undef;

template <typename T> __attribute__((always_inline)) T UNDEF() { return (T)__undef; }

// Stack push/pop semantic

template <typename T> __attribute__((always_inline)) void STACK_PUSH(size_t &vsp, T value) {
  // 1. Update the stack pointer
  vsp -= sizeof(T);
  // 2. Store the value
  std::memcpy(&RAM[vsp], &value, sizeof(T));
}

template <typename T> __attribute__((always_inline)) T STACK_POP(size_t &vsp) {
  // 1. Fetch the value
  T value = 0;
  std::memcpy(&value, &RAM[vsp], sizeof(T));
  // 2. Undefine the stack slot
  T undef = UNDEF<T>();
  std::memcpy(&RAM[vsp], &undef, sizeof(T));
  // 3. Update the stack pointer
  vsp += sizeof(T);
  // 4. Return the value
  return value;
}

// Immediate and symbolic push/pop semantic

template <typename T> __attribute__((always_inline)) void PUSH_IMM(size_t &vsp, T value) {
  // 1. Push the immediate
  STACK_PUSH<T>(vsp, value);
}

DEFINE_SEMANTIC_64(PUSH_IMM_64) = PUSH_IMM<uint64_t>;
DEFINE_SEMANTIC(PUSH_IMM_32) = PUSH_IMM<uint32_t>;
DEFINE_SEMANTIC(PUSH_IMM_16) = PUSH_IMM<uint16_t>;

// Stack pointer push/pop semantic

IF_64BIT(template <size_t Size>
__attribute__((always_inline)) void PUSH_VSP(size_t &vsp) {
  // 1. Push the stack pointer
  if constexpr (Size == 64) {
    STACK_PUSH<uint64_t>(vsp, vsp);
  } else if constexpr (Size == 32) {
    STACK_PUSH<uint32_t>(vsp, vsp & 0xFFFFFFFF);
  } else if constexpr (Size == 16) {
    STACK_PUSH<uint16_t>(vsp, vsp & 0xFFFF);
  }
})

IF_32BIT(template <size_t Size>
__attribute__((always_inline)) void PUSH_VSP(size_t &vsp) {
  // 1. Push the stack pointer
  if constexpr (Size == 32) {
    STACK_PUSH<uint32_t>(vsp, vsp);
  } else if constexpr (Size == 16) {
    STACK_PUSH<uint16_t>(vsp, vsp & 0xFFFF);
  }
})

DEFINE_SEMANTIC_64(PUSH_VSP_64) = PUSH_VSP<64>;
DEFINE_SEMANTIC(PUSH_VSP_32) = PUSH_VSP<32>;
DEFINE_SEMANTIC(PUSH_VSP_16) = PUSH_VSP<16>;

IF_64BIT(template <size_t Size>
__attribute__((always_inline)) void POP_VSP(size_t &vsp) {
  // 1. Push the stack pointer
  if constexpr (Size == 64) {
    vsp = STACK_POP<uint64_t>(vsp);
  } else if constexpr (Size == 32) {
    uint32_t value = STACK_POP<uint32_t>(vsp);
    vsp = ((vsp & 0xFFFFFFFF00000000) | value);
  } else if constexpr (Size == 16) {
    uint16_t value = STACK_POP<uint16_t>(vsp);
    vsp = ((vsp & 0xFFFFFFFFFFFF0000) | value);
  }
})

IF_32BIT(template <size_t Size>
__attribute__((always_inline)) void POP_VSP(size_t &vsp) {
  // 1. Push the stack pointer
  if constexpr (Size == 32) {
    vsp = STACK_POP<uint32_t>(vsp);
  } else if constexpr (Size == 16) {
    uint16_t value = STACK_POP<uint16_t>(vsp);
    vsp = ((vsp & 0xFFFF0000) | value);
  }
})

DEFINE_SEMANTIC_64(POP_VSP_64) = POP_VSP<64>;
DEFINE_SEMANTIC(POP_VSP_32) = POP_VSP<32>;
DEFINE_SEMANTIC(POP_VSP_16) = POP_VSP<16>;

// Flags pop semantic

__attribute__((always_inline)) void POP_FLAGS(size_t &vsp, size_t &flags) {
  // 1. Pop the flags
  flags = STACK_POP<size_t>(vsp);
}

DEFINE_SEMANTIC(POP_FLAGS) = POP_FLAGS;

// Stack load/store semantic

template <typename T> __attribute__((always_inline)) void LOAD(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Pop the address
  size_t address = STACK_POP<size_t>(vsp);
  // 3. Load the value
  T value = 0;
  std::memcpy(&value, &RAM[address], sizeof(T));
  // 4. Save the result
  if (isByte) {
    STACK_PUSH<uint16_t>(vsp, ZExt(value));
  } else {
    STACK_PUSH<T>(vsp, value);
  }
}

DEFINE_SEMANTIC_64(LOAD_SS_64) = LOAD<uint64_t>;
DEFINE_SEMANTIC(LOAD_SS_32) = LOAD<uint32_t>;
DEFINE_SEMANTIC(LOAD_SS_16) = LOAD<uint16_t>;
DEFINE_SEMANTIC(LOAD_SS_8) = LOAD<uint8_t>;

DEFINE_SEMANTIC_64(LOAD_DS_64) = LOAD<uint64_t>;
DEFINE_SEMANTIC(LOAD_DS_32) = LOAD<uint32_t>;
DEFINE_SEMANTIC(LOAD_DS_16) = LOAD<uint16_t>;
DEFINE_SEMANTIC(LOAD_DS_8) = LOAD<uint8_t>;

template <typename T> __attribute__((always_inline)) void LOAD_GS(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Pop the address
  size_t address = STACK_POP<size_t>(vsp);
  // 3. Load the value
  T value = 0;
  std::memcpy(&value, &GS[address], sizeof(T));
  // 4. Save the result
  if (isByte) {
    STACK_PUSH<uint16_t>(vsp, ZExt(value));
  } else {
    STACK_PUSH<T>(vsp, value);
  }
}

DEFINE_SEMANTIC_64(LOAD_GS_64) = LOAD_GS<uint64_t>;
DEFINE_SEMANTIC(LOAD_GS_32) = LOAD_GS<uint32_t>;
DEFINE_SEMANTIC(LOAD_GS_16) = LOAD_GS<uint16_t>;
DEFINE_SEMANTIC(LOAD_GS_8) = LOAD_GS<uint8_t>;

template <typename T> __attribute__((always_inline)) void LOAD_FS(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Pop the address
  size_t address = STACK_POP<size_t>(vsp);
  // 3. Load the value
  T value = 0;
  std::memcpy(&value, &FS[address], sizeof(T));
  // 4. Save the result
  if (isByte) {
    STACK_PUSH<uint16_t>(vsp, ZExt(value));
  } else {
    STACK_PUSH<T>(vsp, value);
  }
}

DEFINE_SEMANTIC_64(LOAD_FS_64) = LOAD_FS<uint64_t>;
DEFINE_SEMANTIC(LOAD_FS_32) = LOAD_FS<uint32_t>;
DEFINE_SEMANTIC(LOAD_FS_16) = LOAD_FS<uint16_t>;
DEFINE_SEMANTIC(LOAD_FS_8) = LOAD_FS<uint8_t>;

template <typename T> __attribute__((always_inline)) void STORE(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Pop the address
  size_t address = STACK_POP<size_t>(vsp);
  // 3. Pop the value
  T value;
  if (isByte) {
    value = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    value = STACK_POP<T>(vsp);
  }
  // 4. Store the value
  std::memcpy(&RAM[address], &value, sizeof(T));
}

DEFINE_SEMANTIC_64(STORE_SS_64) = STORE<uint64_t>;
DEFINE_SEMANTIC(STORE_SS_32) = STORE<uint32_t>;
DEFINE_SEMANTIC(STORE_SS_16) = STORE<uint16_t>;
DEFINE_SEMANTIC(STORE_SS_8) = STORE<uint8_t>;

DEFINE_SEMANTIC_64(STORE_DS_64) = STORE<uint64_t>;
DEFINE_SEMANTIC(STORE_DS_32) = STORE<uint32_t>;
DEFINE_SEMANTIC(STORE_DS_16) = STORE<uint16_t>;
DEFINE_SEMANTIC(STORE_DS_8) = STORE<uint8_t>;

// Virtual register push/pop semantic

IF_64BIT(
template <size_t Size, size_t Offset>
__attribute__((always_inline)) void PUSH_VMREG(size_t &vsp, VirtualRegister vmreg) {
  // 1. Update the stack pointer
  vsp -= ((Size != 8) ? (Size / 8) : ((Size / 8) * 2));
  // 2. Select the proper element of the virtual register
  if constexpr (Size == 64) {
    std::memcpy(&RAM[vsp], &vmreg.qword, sizeof(uint64_t));
  } else if constexpr (Size == 32) {
    if constexpr (Offset == 0) {
      std::memcpy(&RAM[vsp], &vmreg.dword.d0, sizeof(uint32_t));
    } else if constexpr (Offset == 1) {
      std::memcpy(&RAM[vsp], &vmreg.dword.d1, sizeof(uint32_t));
    }
  } else if constexpr (Size == 16) {
    if constexpr (Offset == 0) {
      std::memcpy(&RAM[vsp], &vmreg.word.w0, sizeof(uint16_t));
    } else if constexpr (Offset == 1) {
      std::memcpy(&RAM[vsp], &vmreg.word.w1, sizeof(uint16_t));
    } else if constexpr (Offset == 2) {
      std::memcpy(&RAM[vsp], &vmreg.word.w2, sizeof(uint16_t));
    } else if constexpr (Offset == 3) {
      std::memcpy(&RAM[vsp], &vmreg.word.w3, sizeof(uint16_t));
    }
  } else if constexpr (Size == 8) {
    if constexpr (Offset == 0) {
      uint16_t byte = ZExt(vmreg.byte.b0);
      std::memcpy(&RAM[vsp], &byte, sizeof(uint16_t));
    } else if constexpr (Offset == 1) {
      uint16_t byte = ZExt(vmreg.byte.b1);
      std::memcpy(&RAM[vsp], &byte, sizeof(uint16_t));
    }
    // NOTE: there might be other offsets here, but they were not observed
  }
}
)

IF_32BIT(
template <size_t Size, size_t Offset>
__attribute__((always_inline)) void PUSH_VMREG(size_t &vsp, VirtualRegister vmreg) {
  // 1. Update the stack pointer
  vsp -= ((Size != 8) ? (Size / 8) : ((Size / 8) * 2));
  // 2. Select the proper element of the virtual register
  if constexpr (Size == 32) {
    if constexpr (Offset == 0) {
      std::memcpy(&RAM[vsp], &vmreg.dword, sizeof(uint32_t));
    }
  } else if constexpr (Size == 16) {
    if constexpr (Offset == 0) {
      std::memcpy(&RAM[vsp], &vmreg.word.w0, sizeof(uint16_t));
    } else if constexpr (Offset == 1) {
      std::memcpy(&RAM[vsp], &vmreg.word.w1, sizeof(uint16_t));
    }
  } else if constexpr (Size == 8) {
    if constexpr (Offset == 0) {
      uint16_t byte = ZExt(vmreg.byte.b0);
      std::memcpy(&RAM[vsp], &byte, sizeof(uint16_t));
    } else if constexpr (Offset == 1) {
      uint16_t byte = ZExt(vmreg.byte.b1);
      std::memcpy(&RAM[vsp], &byte, sizeof(uint16_t));
    }
    // NOTE: there might be other offsets here, but they were not observed
  }
}
)

DEFINE_SEMANTIC(PUSH_VMREG_8_LOW) = PUSH_VMREG<8, 0>;
DEFINE_SEMANTIC(PUSH_VMREG_8_HIGH) = PUSH_VMREG<8, 1>;
DEFINE_SEMANTIC(PUSH_VMREG_16_LOWLOW) = PUSH_VMREG<16, 0>;
DEFINE_SEMANTIC(PUSH_VMREG_16_LOWHIGH) = PUSH_VMREG<16, 1>;
DEFINE_SEMANTIC_64(PUSH_VMREG_16_HIGHLOW) = PUSH_VMREG<16, 2>;
DEFINE_SEMANTIC_64(PUSH_VMREG_16_HIGHHIGH) = PUSH_VMREG<16, 3>;
DEFINE_SEMANTIC_64(PUSH_VMREG_32_LOW) = PUSH_VMREG<32, 0>;
DEFINE_SEMANTIC_32(PUSH_VMREG_32) = PUSH_VMREG<32, 0>;
DEFINE_SEMANTIC_64(PUSH_VMREG_32_HIGH) = PUSH_VMREG<32, 1>;
DEFINE_SEMANTIC_64(PUSH_VMREG_64) = PUSH_VMREG<64, 0>;

IF_64BIT(
template <size_t Size, size_t Offset>
__attribute__((always_inline)) void POP_VMREG(size_t &vsp, VirtualRegister &vmreg) {
  // 1. Fetch and store the value on the virtual register
  if constexpr (Size == 64) {
    uint64_t value = 0;
    std::memcpy(&value, &RAM[vsp], sizeof(uint64_t));
    vmreg.qword = value;
  } else if constexpr (Size == 32) {
    if constexpr (Offset == 0) {
      uint32_t value = 0;
      std::memcpy(&value, &RAM[vsp], sizeof(uint32_t));
      vmreg.qword = ((vmreg.qword & 0xFFFFFFFF00000000) | value);
    } else if constexpr (Offset == 1) {
      uint32_t value = 0;
      std::memcpy(&value, &RAM[vsp], sizeof(uint32_t));
      vmreg.qword = ((vmreg.qword & 0x00000000FFFFFFFF) | UShl(ZExt(value), 32));
    }
  } else if constexpr (Size == 16) {
    if constexpr (Offset == 0) {
      uint16_t value = 0;
      std::memcpy(&value, &RAM[vsp], sizeof(uint16_t));
      vmreg.qword = ((vmreg.qword & 0xFFFFFFFFFFFF0000) | value);
    } else if constexpr (Offset == 1) {
      uint16_t value = 0;
      std::memcpy(&value, &RAM[vsp], sizeof(uint16_t));
      vmreg.qword = ((vmreg.qword & 0xFFFFFFFF0000FFFF) | UShl(ZExtTo<uint64_t>(value), 16));
    } else if constexpr (Offset == 2) {
      uint16_t value = 0;
      std::memcpy(&value, &RAM[vsp], sizeof(uint16_t));
      vmreg.qword = ((vmreg.qword & 0xFFFF0000FFFFFFFF) | UShl(ZExtTo<uint64_t>(value), 32));
    } else if constexpr (Offset == 3) {
      uint16_t value = 0;
      std::memcpy(&value, &RAM[vsp], sizeof(uint16_t));
      vmreg.qword = ((vmreg.qword & 0x0000FFFFFFFFFFFF) | UShl(ZExtTo<uint64_t>(value), 48));
    }
  } else if constexpr (Size == 8) {
    if constexpr (Offset == 0) {
      uint16_t byte = 0;
      std::memcpy(&byte, &RAM[vsp], sizeof(uint16_t));
      vmreg.byte.b0 = Trunc(byte);
    } else if constexpr (Offset == 1) {
      uint16_t byte = 0;
      std::memcpy(&byte, &RAM[vsp], sizeof(uint16_t));
      vmreg.byte.b1 = Trunc(byte);
    }
    // NOTE: there might be other offsets here, but they were not observed
  }
  // 4. Clear the value on the stack
  if constexpr (Size == 64) {
    uint64_t undef = UNDEF<uint64_t>();
    std::memcpy(&RAM[vsp], &undef, sizeof(uint64_t));
  } else if constexpr (Size == 32) {
    uint32_t undef = UNDEF<uint32_t>();
    std::memcpy(&RAM[vsp], &undef, sizeof(uint32_t));
  } else if constexpr (Size == 16) {
    uint16_t undef = UNDEF<uint16_t>();
    std::memcpy(&RAM[vsp], &undef, sizeof(uint16_t));
  } else if constexpr (Size == 8) {
    uint16_t undef = UNDEF<uint16_t>();
    std::memcpy(&RAM[vsp], &undef, sizeof(uint16_t));
  }
  // 5. Update the stack pointer
  vsp += ((Size != 8) ? (Size / 8) : ((Size / 8) * 2));
}
)

IF_32BIT(
template <size_t Size, size_t Offset>
__attribute__((always_inline)) void POP_VMREG(size_t &vsp, VirtualRegister &vmreg) {
  // 1. Fetch and store the value on the virtual register
  if constexpr (Size == 32) {
    if constexpr (Offset == 0) {
      uint32_t value = 0;
      std::memcpy(&value, &RAM[vsp], sizeof(uint32_t));
      vmreg.dword = value;
    }
  } else if constexpr (Size == 16) {
    if constexpr (Offset == 0) {
      uint16_t value = 0;
      std::memcpy(&value, &RAM[vsp], sizeof(uint16_t));
      vmreg.dword = ((vmreg.dword & 0xFFFF0000) | value);
    } else if constexpr (Offset == 1) {
      uint16_t value = 0;
      std::memcpy(&value, &RAM[vsp], sizeof(uint16_t));
      vmreg.dword = ((vmreg.dword & 0x0000FFFF) | UShl(ZExtTo<uint64_t>(value), 16));
    }
  } else if constexpr (Size == 8) {
    if constexpr (Offset == 0) {
      uint16_t byte = 0;
      std::memcpy(&byte, &RAM[vsp], sizeof(uint16_t));
      vmreg.byte.b0 = Trunc(byte);
    } else if constexpr (Offset == 1) {
      uint16_t byte = 0;
      std::memcpy(&byte, &RAM[vsp], sizeof(uint16_t));
      vmreg.byte.b1 = Trunc(byte);
    }
    // NOTE: there might be other offsets here, but they were not observed
  }
  // 4. Clear the value on the stack
  if constexpr (Size == 32) {
    uint32_t undef = UNDEF<uint32_t>();
    std::memcpy(&RAM[vsp], &undef, sizeof(uint32_t));
  } else if constexpr (Size == 16) {
    uint16_t undef = UNDEF<uint16_t>();
    std::memcpy(&RAM[vsp], &undef, sizeof(uint16_t));
  } else if constexpr (Size == 8) {
    uint16_t undef = UNDEF<uint16_t>();
    std::memcpy(&RAM[vsp], &undef, sizeof(uint16_t));
  }
  // 5. Update the stack pointer
  vsp += ((Size != 8) ? (Size / 8) : ((Size / 8) * 2));
}
)

DEFINE_SEMANTIC(POP_VMREG_8_LOW) = POP_VMREG<8, 0>;
DEFINE_SEMANTIC(POP_VMREG_8_HIGH) = POP_VMREG<8, 1>;
DEFINE_SEMANTIC(POP_VMREG_16_LOWLOW) = POP_VMREG<16, 0>;
DEFINE_SEMANTIC(POP_VMREG_16_LOWHIGH) = POP_VMREG<16, 1>;
DEFINE_SEMANTIC_64(POP_VMREG_16_HIGHLOW) = POP_VMREG<16, 2>;
DEFINE_SEMANTIC_64(POP_VMREG_16_HIGHHIGH) = POP_VMREG<16, 3>;
DEFINE_SEMANTIC_64(POP_VMREG_32_LOW) = POP_VMREG<32, 0>;
DEFINE_SEMANTIC_32(POP_VMREG_32) = POP_VMREG<32, 0>;
DEFINE_SEMANTIC_64(POP_VMREG_32_HIGH) = POP_VMREG<32, 1>;
DEFINE_SEMANTIC_64(POP_VMREG_64) = POP_VMREG<64, 0>;

// Real register push/pop semantic

__attribute__((always_inline)) void PUSH_REG(size_t &vsp, size_t reg) {
  // 1. Push the register
  STACK_PUSH<size_t>(vsp, reg);
}

DEFINE_SEMANTIC_64(PUSH_REG_64) = PUSH_REG;
DEFINE_SEMANTIC_32(PUSH_REG_32) = PUSH_REG;

__attribute__((always_inline)) void POP_REG(size_t &vsp, size_t &reg) {
  // 1. Pop the register
  reg = STACK_POP<size_t>(vsp);
}

DEFINE_SEMANTIC_64(POP_REG_64) = POP_REG;
DEFINE_SEMANTIC_32(POP_REG_32) = POP_REG;

__attribute__((always_inline)) void POP_VOID(size_t &vsp) {
  // 1. Pop the register into the void
  STACK_POP<size_t>(vsp);
}

DEFINE_SEMANTIC_64(POP_VOID_64) = POP_VOID;
DEFINE_SEMANTIC_32(POP_VOID_32) = POP_VOID;

// Passing slots push/pop semantics

IF_64BIT(__attribute__((always_inline)) void MOVE_VMREG_SLOT(VirtualRegister &vmreg, size_t &slot) {
  vmreg.qword = slot;
})

IF_32BIT(__attribute__((always_inline)) void MOVE_VMREG_SLOT(VirtualRegister &vmreg, size_t &slot) {
  vmreg.dword = slot;
})

DEFINE_SEMANTIC_64(MOVE_VMREG_SLOT) = MOVE_VMREG_SLOT;
DEFINE_SEMANTIC_32(MOVE_VMREG_SLOT) = MOVE_VMREG_SLOT;

__attribute__((always_inline)) void POP_SLOT(size_t &vsp, size_t &slot) {
  slot = STACK_POP<size_t>(vsp);
}

DEFINE_SEMANTIC_64(POP_SLOT) = POP_SLOT;
DEFINE_SEMANTIC_32(POP_SLOT) = POP_SLOT;

// CPUID semantinc

__attribute__((always_inline)) void CPUID(size_t &vsp) {
  // 1. Fetch the operand
  auto ieax = STACK_POP<uint32_t>(vsp);
  // 2. Call the 'cpuid' intrinsic
  uint32_t oeax = 0;
  uint32_t oebx = 0;
  uint32_t oecx = 0;
  uint32_t oedx = 0;
  __cpuid(ieax, oeax, oebx, oecx, oedx);
  // 3. Push the 4 affected registers
  STACK_PUSH<uint32_t>(vsp, oeax);
  STACK_PUSH<uint32_t>(vsp, oebx);
  STACK_PUSH<uint32_t>(vsp, oecx);
  STACK_PUSH<uint32_t>(vsp, oedx);
}

DEFINE_SEMANTIC(CPUID) = CPUID;

// RDTSC semantic

__attribute__((always_inline)) void RDTSC(size_t &vsp) {
  // 1. Call the 'rdtsc' instrinsic
  uint64_t rdtsc = __rdtsc();
  // 2. Split the values
  uint64_t mask = 0xFFFFFFFF;
  uint32_t eax = UAnd(rdtsc, mask);
  uint32_t edx = UAnd(UShr(rdtsc, 32), mask);
  // 3. Push the 2 affected registers
  STACK_PUSH<uint32_t>(vsp, eax);
  STACK_PUSH<uint32_t>(vsp, edx);
}

DEFINE_SEMANTIC(RDTSC) = RDTSC;

// Arithmetic and logical flags semantic

__attribute__((always_inline)) void UPDATE_EFLAGS(size_t &flags, bool cf, bool pf, bool af, bool zf, bool sf, bool of) {
  // flags = 0; // NOTE: vmprotect doesn't actually use the x86 eflags between vmhandlers, the only
  // edge case might be pushf
  // 1. Update the flags
  flags |= ((flags & ~(0x001)) | ((size_t)cf << 0));
  flags |= ((flags & ~(0x004)) | ((size_t)pf << 2));
  flags |= ((flags & ~(0x010)) | ((size_t)af << 4));
  flags |= ((flags & ~(0x040)) | ((size_t)zf << 6));
  flags |= ((flags & ~(0x080)) | ((size_t)sf << 7));
  flags |= ((flags & ~(0x800)) | ((size_t)of << 11));
}

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool AF(T lhs, T rhs, T res) {
  return AuxCarryFlag(lhs, rhs, res);
}

template <typename T> __attribute__((always_inline)) __attribute__((const)) bool PF(T res) {
  return ParityFlag(res);
}

template <typename T> __attribute__((always_inline)) __attribute__((const)) bool ZF(T res) {
  return ZeroFlag(res);
}

template <typename T> __attribute__((always_inline)) __attribute__((const)) bool SF(T res) {
  return SignFlag(res);
}

// ADD semantic

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool CF_ADD(T lhs, T rhs, T res) {
  return Carry<tag_add>::Flag(lhs, rhs, res);
}

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool OF_ADD(T lhs, T rhs, T res) {
  return Overflow<tag_add>::Flag(lhs, rhs, res);
}

template <typename T>
__attribute__((always_inline)) void ADD_FLAGS(size_t &flags, T lhs, T rhs, T res) {
  // 1. Calculate the flags
  bool cf = CF_ADD(lhs, rhs, res);
  bool pf = PF(res);
  bool af = AF(lhs, rhs, res);
  bool zf = ZF(res);
  bool sf = SF(res);
  bool of = OF_ADD(lhs, rhs, res);
  // 2. Update the flags
  UPDATE_EFLAGS(flags, cf, pf, af, zf, sf, of);
}

template <typename T> __attribute__((always_inline)) void ADD(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Initialize the operands
  T op1 = 0;
  T op2 = 0;
  // 3. Fetch the operands
  if (isByte) {
    op1 = Trunc(STACK_POP<uint16_t>(vsp));
    op2 = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    op1 = STACK_POP<T>(vsp);
    op2 = STACK_POP<T>(vsp);
  }
  // 4. Calculate the add
  T res = UAdd(op1, op2);
  // 5. Calculate the flags
  size_t flags = 0;
  ADD_FLAGS(flags, op1, op2, res);
  // 6. Save the result
  if (isByte) {
    STACK_PUSH<uint16_t>(vsp, ZExt(res));
  } else {
    STACK_PUSH<T>(vsp, res);
  }
  // 7. Save the flags
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(ADD_64) = ADD<uint64_t>;
DEFINE_SEMANTIC(ADD_32) = ADD<uint32_t>;
DEFINE_SEMANTIC(ADD_16) = ADD<uint16_t>;
DEFINE_SEMANTIC(ADD_8) = ADD<uint8_t>;

// DIV semantic

__attribute__((always_inline)) void DIV_FLAGS(size_t &flags) {
  // 1. Calculate the flags
  bool cf = UNDEF<uint8_t>();
  bool pf = UNDEF<uint8_t>();
  bool af = UNDEF<uint8_t>();
  bool zf = UNDEF<uint8_t>();
  bool sf = UNDEF<uint8_t>();
  bool of = UNDEF<uint8_t>();
  // 2. Update the flags
  UPDATE_EFLAGS(flags, cf, pf, af, zf, sf, of);
}

template <typename T> __attribute__((always_inline)) void DIV(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Initialize the operands
  T op1 = 0;
  T op2 = 0;
  T op3 = 0;
  // 3. Fetch the operands
  if (isByte) {
    op1 = Trunc(STACK_POP<uint16_t>(vsp));
    op2 = Trunc(STACK_POP<uint16_t>(vsp));
    op3 = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    op1 = STACK_POP<T>(vsp);
    op2 = STACK_POP<T>(vsp);
    op3 = STACK_POP<T>(vsp);
  }
  // 4. Calculate the division
  auto lhs_lo = ZExt(op1);
  auto lhs_hi = ZExt(op2);
  auto rhs = ZExt(op3);
  auto shift = ZExt(BitSizeOf(op3));
  auto lhs = UOr(UShl(lhs_hi, shift), lhs_lo);
  auto quot = UDiv(lhs, rhs);
  auto rem = URem(lhs, rhs);
  auto quot_trunc = Trunc(quot);
  auto rem_trunc = Trunc(rem);
  size_t flags = 0;
  // 4.1. Calculate the final values
  auto rem_final = quot_trunc;
  auto quot_final = rem_trunc;
  // 4.2. Calculate the flags
  DIV_FLAGS(flags);
  // 4.3. Push the calculated values
  STACK_PUSH<T>(vsp, rem_final);
  STACK_PUSH<T>(vsp, quot_final);
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(DIV_64) = DIV<uint64_t>;
DEFINE_SEMANTIC(DIV_32) = DIV<uint32_t>;
DEFINE_SEMANTIC(DIV_16) = DIV<uint16_t>;
DEFINE_SEMANTIC(DIV_8) = DIV<uint8_t>;

// IDIV semantic

__attribute__((always_inline)) void IDIV_FLAGS(size_t &flags) {
  // 1. Calculate the flags
  DIV_FLAGS(flags);
}

template <typename T> __attribute__((always_inline)) void IDIV(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Initialize the operands
  T op1 = 0;
  T op2 = 0;
  T op3 = 0;
  // 3. Fetch the operands
  if (isByte) {
    op1 = Trunc(STACK_POP<uint16_t>(vsp));
    op2 = Trunc(STACK_POP<uint16_t>(vsp));
    op3 = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    op1 = STACK_POP<T>(vsp);
    op2 = STACK_POP<T>(vsp);
    op3 = STACK_POP<T>(vsp);
  }
  // 4. Calculate the division
  auto lhs_lo = ZExt(op1);
  auto lhs_hi = ZExt(op2);
  auto rhs = SExt(op3);
  auto shift = ZExt(BitSizeOf(op3));
  auto lhs = Signed(UOr(UShl(lhs_hi, shift), lhs_lo));
  auto quot = SDiv(lhs, rhs);
  auto rem = SRem(lhs, rhs);
  auto quot_trunc = Trunc(quot);
  auto rem_trunc = Trunc(rem);
  size_t flags = 0;
  // 4.1. Calculate the final values
  auto rem_final = Unsigned(quot_trunc);
  auto quot_final = Unsigned(rem_trunc);
  // 4.2. Calculate the flags
  IDIV_FLAGS(flags);
  // 4.3. We are going to push undefined values
  STACK_PUSH<T>(vsp, rem_final);
  STACK_PUSH<T>(vsp, quot_final);
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(IDIV_64) = IDIV<uint64_t>;
DEFINE_SEMANTIC(IDIV_32) = IDIV<uint32_t>;
DEFINE_SEMANTIC(IDIV_16) = IDIV<uint16_t>;
DEFINE_SEMANTIC(IDIV_8) = IDIV<uint8_t>;

// MUL semantic

template <typename T, typename R>
__attribute__((always_inline)) __attribute__((const)) bool CF_MUL(T lhs, T rhs, R res) {
  return Overflow<tag_mul>::Flag(lhs, rhs, res);
}

template <typename T> __attribute__((always_inline)) __attribute__((const)) bool SF_MUL(T lo_res) {
  return std::is_signed<T>::value ? SignFlag(lo_res) : UNDEF<uint8_t>();
}

template <typename T, typename R>
__attribute__((always_inline)) void MUL_FLAGS(size_t &flags, T lhs, T rhs, R res, T lo_res) {
  // 1. Calculate the flags
  bool cf = CF_MUL(lhs, rhs, res);
  bool pf = UNDEF<uint8_t>();
  bool af = UNDEF<uint8_t>();
  bool zf = UNDEF<uint8_t>();
  bool sf = SF_MUL(lo_res);
  bool of = CF_MUL(lhs, rhs, res);
  // 2. Update the flags
  UPDATE_EFLAGS(flags, cf, pf, af, zf, sf, of);
}

template <typename T> __attribute__((always_inline)) void MUL(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Initialize the operands
  T op1 = 0;
  T op2 = 0;
  // 3. Fetch the operands
  if (isByte) {
    op1 = Trunc(STACK_POP<uint16_t>(vsp));
    op2 = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    op1 = STACK_POP<T>(vsp);
    op2 = STACK_POP<T>(vsp);
  }
  // 4. Force the operands to be unsigned
  auto lhs = Unsigned(op1);
  auto rhs = Unsigned(op2);
  // 5. Calculate the product
  auto lhs_wide = ZExt(lhs);
  auto rhs_wide = ZExt(rhs);
  auto res = UMul(lhs_wide, rhs_wide);
  auto shift = ZExt(BitSizeOf(lhs));
  auto lo_res = Trunc(res);
  auto hi_res = Trunc(UShr(res, shift));
  // 6. Calculate the flags
  size_t flags = 0;
  MUL_FLAGS(flags, lhs, rhs, res, lo_res);
  // 7. Save the result
  STACK_PUSH<T>(vsp, lo_res);
  STACK_PUSH<T>(vsp, hi_res);
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(MUL_64) = MUL<uint64_t>;
DEFINE_SEMANTIC(MUL_32) = MUL<uint32_t>;
DEFINE_SEMANTIC(MUL_16) = MUL<uint16_t>;
DEFINE_SEMANTIC(MUL_8) = MUL<uint8_t>;

// IMUL semantic

template <typename T, typename R>
__attribute__((always_inline)) void IMUL_FLAGS(size_t &flags, T lhs, T rhs, R res, T lo_res) {
  // 1. Calculate the flags
  MUL_FLAGS(flags, lhs, rhs, res, lo_res);
}

template <typename T> __attribute__((always_inline)) void IMUL(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Initialize the operands
  T op1 = 0;
  T op2 = 0;
  // 3. Fetch the operands
  if (isByte) {
    op1 = Trunc(STACK_POP<uint16_t>(vsp));
    op2 = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    op1 = STACK_POP<T>(vsp);
    op2 = STACK_POP<T>(vsp);
  }
  // 4. Force the operands to be signed
  auto lhs = Signed(op1);
  auto rhs = Signed(op2);
  // 5. Calculate the product
  auto lhs_wide = SExt(lhs);
  auto rhs_wide = SExt(rhs);
  auto res = SMul(lhs_wide, rhs_wide);
  auto shift = ZExt(BitSizeOf(rhs));
  auto lo_res = Trunc(res);
  auto hi_res = Trunc(UShr(Unsigned(res), shift));
  // 6. Calculate the flags
  size_t flags = 0;
  IMUL_FLAGS(flags, lhs, rhs, res, lo_res);
  // 7. Save the result
  STACK_PUSH<T>(vsp, lo_res);
  STACK_PUSH<T>(vsp, hi_res);
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(IMUL_64) = IMUL<uint64_t>;
DEFINE_SEMANTIC(IMUL_32) = IMUL<uint32_t>;
DEFINE_SEMANTIC(IMUL_16) = IMUL<uint16_t>;
DEFINE_SEMANTIC(IMUL_8) = IMUL<uint8_t>;

// NOR semantic

template <typename T>
__attribute__((always_inline)) void NOR_FLAGS(size_t &flags, T lhs, T rhs, T res) {
  // 1. Calculate the flags
  bool cf = false;
  bool pf = PF(res);
  bool af = false;
  bool zf = ZF(res);
  bool sf = SF(res);
  bool of = false;
  // 2. Update the flags
  UPDATE_EFLAGS(flags, cf, pf, af, zf, sf, of);
}

template <typename T> __attribute__((always_inline)) void NOR(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Initialize the operands
  T op1 = 0;
  T op2 = 0;
  // 3. Fetch the operands
  if (isByte) {
    op1 = Trunc(STACK_POP<uint16_t>(vsp));
    op2 = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    op1 = STACK_POP<T>(vsp);
    op2 = STACK_POP<T>(vsp);
  }
  // 4. Calculate the nor
  T res = UNot(UOr(op1, op2));
  // 5. Calculate the flags
  size_t flags = 0;
  NOR_FLAGS(flags, op1, op2, res);
  // 6. Save the result
  if (isByte) {
    STACK_PUSH<uint16_t>(vsp, ZExt(res));
  } else {
    STACK_PUSH<T>(vsp, res);
  }
  // 7. Save the flags
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(NOR_64) = NOR<uint64_t>;
DEFINE_SEMANTIC(NOR_32) = NOR<uint32_t>;
DEFINE_SEMANTIC(NOR_16) = NOR<uint16_t>;
DEFINE_SEMANTIC(NOR_8) = NOR<uint8_t>;

// NAND semantic

template <typename T>
__attribute__((always_inline)) void NAND_FLAGS(size_t &flags, T lhs, T rhs, T res) {
  // 1. Calculate the flags
  NOR_FLAGS(flags, lhs, rhs, res);
}

template <typename T> __attribute__((always_inline)) void NAND(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Initialize the operands
  T op1 = 0;
  T op2 = 0;
  // 3. Fetch the operands
  if (isByte) {
    op1 = Trunc(STACK_POP<uint16_t>(vsp));
    op2 = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    op1 = STACK_POP<T>(vsp);
    op2 = STACK_POP<T>(vsp);
  }
  // 4. Calculate the nand
  T res = UNot(UAnd(op1, op2));
  // 5. Calculate the flags
  size_t flags = 0;
  NAND_FLAGS(flags, op1, op2, res);
  // 6. Save the result
  if (isByte) {
    STACK_PUSH<uint16_t>(vsp, ZExt(res));
  } else {
    STACK_PUSH<T>(vsp, res);
  }
  // 7. Save the flags
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(NAND_64) = NAND<uint64_t>;
DEFINE_SEMANTIC(NAND_32) = NAND<uint32_t>;
DEFINE_SEMANTIC(NAND_16) = NAND<uint16_t>;
DEFINE_SEMANTIC(NAND_8) = NAND<uint8_t>;

// SHL semantic

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool OF_SHL(T val, T res) {
  return BXor(SignFlag(val), SignFlag(res));
}

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool CF_SHL(T op1, T op2, T res) {
  T long_mask = 0x3F;
  T short_mask = 0x1F;
  auto op_size = BitSizeOf(op1);
  auto shift_mask = Select(UCmpEq(op_size, 64), long_mask, short_mask);
  auto masked_shift = UAnd(op2, shift_mask);
  if (UCmpEq(masked_shift, 1)) {
    return SF(op1);
  } else if (UCmpLt(masked_shift, op_size)) {
    return SF(res);
  }
  return UNDEF<uint8_t>();
}

template <typename T> __attribute__((always_inline)) void SHL(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Initialize the operands
  T op1 = 0;
  T op2 = 0;
  // 3. Fetch the operands
  if (isByte) {
    op1 = Trunc(STACK_POP<uint16_t>(vsp));
    op2 = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    op1 = STACK_POP<T>(vsp);
    op2 = STACK_POP<uint16_t>(vsp);
  }
  // 4. Calculate the shift
  auto res = op1 << op2;
  // 5. Calculate the flags
  size_t flags = 0;
  bool cf = CF_SHL<T>(op1, op2, res);
  bool pf = PF(res);
  bool af = UNDEF<uint8_t>();
  bool zf = ZF(res);
  bool sf = SF(res);
  bool of = OF_SHL<T>(op1, res);
  // Update the flags
  UPDATE_EFLAGS(flags, cf, pf, af, zf, sf, of);
  // 6. Save the result
  if (isByte) {
    STACK_PUSH<uint16_t>(vsp, ZExt(res));
  } else {
    STACK_PUSH<T>(vsp, res);
  }
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(SHL_64) = SHL<uint64_t>;
DEFINE_SEMANTIC(SHL_32) = SHL<uint32_t>;
DEFINE_SEMANTIC(SHL_16) = SHL<uint16_t>;
DEFINE_SEMANTIC(SHL_8) = SHL<uint8_t>;

// SHR semantic

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool CF_SHR(T op1, T op2, T res) {
  T long_mask = 0x3F;
  T short_mask = 0x1F;
  auto op_size = BitSizeOf(op1);
  auto shift_mask = Select(UCmpEq(op_size, 64), long_mask, short_mask);
  auto masked_shift = UAnd(op2, shift_mask);
  if (UCmpEq(masked_shift, 1)) {
    return UCmpEq(UAnd(op1, 1), 1);
  } else if (UCmpLt(masked_shift, op_size)) {
    return UCmpEq(UAnd(res, 1), 1);
  }
  return UNDEF<uint8_t>();
}

template <typename T> __attribute__((always_inline)) __attribute__((const)) bool OF_SHR(T val) {
  return SF(val);
}

template <typename T> __attribute__((always_inline)) void SHR(size_t &vsp) {
  // 1. Check if it's 'byte' size
  bool isByte = (sizeof(T) == 1);
  // 2. Initialize the operands
  T op1 = 0;
  T op2 = 0;
  // 3. Fetch the operands
  if (isByte) {
    op1 = Trunc(STACK_POP<uint16_t>(vsp));
    op2 = Trunc(STACK_POP<uint16_t>(vsp));
  } else {
    op1 = STACK_POP<T>(vsp);
    op2 = STACK_POP<uint16_t>(vsp);
  }
  // 4. Calculate shift
  auto res = op1 >> op2;
  // 5. Calculate the flags
  size_t flags = 0;
  bool cf = CF_SHR<T>(op1, op2, res);
  bool pf = PF(res);
  bool af = UNDEF<uint8_t>();
  bool zf = ZF(res);
  bool sf = false;
  bool of = OF_SHR(op1);
  UPDATE_EFLAGS(flags, cf, pf, af, zf, sf, of);
  // 6. Save the result
  if (isByte) {
    STACK_PUSH<uint16_t>(vsp, ZExt(res));
  } else {
    STACK_PUSH<T>(vsp, res);
  }
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(SHR_64) = SHR<uint64_t>;
DEFINE_SEMANTIC(SHR_32) = SHR<uint32_t>;
DEFINE_SEMANTIC(SHR_16) = SHR<uint16_t>;
DEFINE_SEMANTIC(SHR_8) = SHR<uint8_t>;

// SHLD semantic

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool CF_SHLD(T val, T masked_shift) {
  return SHLDCarryFlag(val, masked_shift);
}

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool OF_SHLD(T val, T res) {
  return BXor(SignFlag(val), SignFlag(res));
}

template <typename T> __attribute__((always_inline)) void SHLD(size_t &vsp) {
  // 1. Fetch the operands
  T val1 = STACK_POP<T>(vsp);
  T val2 = STACK_POP<T>(vsp);
  T shift = STACK_POP<uint16_t>(vsp);
  // 2. Calculate the shift left
  T long_mask = 0x3F;
  T short_mask = 0x1F;
  auto op_size = BitSizeOf(val1);
  auto shift_mask = Select(UCmpEq(op_size, 64), long_mask, short_mask);
  auto masked_shift = UAnd(shift, shift_mask);
  // Execute the real shift
  auto left = UShl(val1, masked_shift);
  auto right = UShr(val2, USub(op_size, masked_shift));
  auto res = UOr(left, right);
  // Calculate the flags
  size_t flags = 0;
  bool cf = CF_SHLD(val1, masked_shift);
  bool pf = PF(res);
  bool af = UNDEF<uint8_t>();
  bool zf = ZF(res);
  bool sf = SF(res);
  bool of = OF_SHLD(val1, res);
  // Update the flags
  UPDATE_EFLAGS(flags, cf, pf, af, zf, sf, of);
  // Save the result
  STACK_PUSH<T>(vsp, res);
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(SHLD_64) = SHLD<uint64_t>;
DEFINE_SEMANTIC(SHLD_32) = SHLD<uint32_t>;
DEFINE_SEMANTIC(SHLD_16) = SHLD<uint16_t>;
DEFINE_SEMANTIC(SHLD_8) = SHLD<uint8_t>;

// SHRD semantic

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool CF_SHRD(T val, T masked_shift) {
  return SHRDCarryFlag(val, masked_shift);
}

template <typename T>
__attribute__((always_inline)) __attribute__((const)) bool OF_SHRD(T val, T res) {
  return BXor(SignFlag(val), SignFlag(res));
}

template <typename T> __attribute__((always_inline)) void SHRD(size_t &vsp) {
  // 1. Fetch the operands
  T val1 = STACK_POP<T>(vsp);
  T val2 = STACK_POP<T>(vsp);
  T shift = STACK_POP<uint16_t>(vsp);
  // 2. Calculate the shift right
  T long_mask = 0x3F;
  T short_mask = 0x1F;
  auto op_size = BitSizeOf(val1);
  auto shift_mask = Select(UCmpEq(op_size, 64), long_mask, short_mask);
  auto masked_shift = UAnd(shift, shift_mask);
  // Execute the real shift
  auto left = UShl(val2, USub(op_size, masked_shift));
  auto right = UShr(val1, masked_shift);
  auto res = UOr(left, right);
  // Calculate the flags
  size_t flags = 0;
  bool cf = CF_SHRD(val1, masked_shift);
  bool pf = PF(res);
  bool af = UNDEF<uint8_t>();
  bool zf = ZF(res);
  bool sf = SF(res);
  bool of = OF_SHRD(val1, res);
  // Update the flags
  UPDATE_EFLAGS(flags, cf, pf, af, zf, sf, of);
  // Save the result
  STACK_PUSH<T>(vsp, res);
  STACK_PUSH<size_t>(vsp, flags);
}

DEFINE_SEMANTIC_64(SHRD_64) = SHRD<uint64_t>;
DEFINE_SEMANTIC(SHRD_32) = SHRD<uint32_t>;
DEFINE_SEMANTIC(SHRD_16) = SHRD<uint16_t>;
DEFINE_SEMANTIC(SHRD_8) = SHRD<uint8_t>;

// JUMP semantic
__attribute__((always_inline)) void JUMP(size_t &vsp, size_t &vip) { vip = STACK_POP<size_t>(vsp); }

__attribute__((always_inline)) void JUMP_DEC(size_t &vsp, size_t &vip) { vip = STACK_POP<size_t>(vsp) - 4; }

__attribute__((always_inline)) void JUMP_INC(size_t &vsp, size_t &vip) { vip = STACK_POP<size_t>(vsp) + 4; }

DEFINE_SEMANTIC(JUMP_INC) = JUMP_INC;
DEFINE_SEMANTIC(JUMP_DEC) = JUMP_DEC;
DEFINE_SEMANTIC(JUMP) = JUMP;
DEFINE_SEMANTIC(EXIT) = JUMP;

// Stub functions to lift a VMProtect stack machine

extern "C" void HelperUnsupportedStub(VirtualContext &ctx);

IF_64BIT(extern "C" void HelperUnsupported(
  rptr rax, rptr rbx, rptr rcx,
  rptr rdx, rptr rsi, rptr rdi,
  rptr rbp, rptr rsp, rptr r8,
  rptr r9, rptr r10, rptr r11,
  rptr r12, rptr r13, rptr r14,
  rptr r15) {
  VirtualContext ctx;
  ctx.rax.qword = rax;
  ctx.rbx.qword = rbx;
  ctx.rcx.qword = rcx;
  ctx.rdx.qword = rdx;
  ctx.rsi.qword = rsi;
  ctx.rdi.qword = rdi;
  ctx.rbp.qword = rbp;
  ctx.rsp.qword = rsp;
  ctx.r8.qword  = r8;
  ctx.r9.qword  = r9;
  ctx.r10.qword = r10;
  ctx.r11.qword = r11;
  ctx.r12.qword = r12;
  ctx.r13.qword = r13;
  ctx.r14.qword = r14;
  ctx.r15.qword = r15;
  HelperUnsupportedStub(ctx);
  rax = ctx.rax.qword;
  rbx = ctx.rbx.qword;
  rcx = ctx.rcx.qword;
  rdx = ctx.rdx.qword;
  rsi = ctx.rsi.qword;
  rdi = ctx.rdi.qword;
  rbp = ctx.rbp.qword;
  rsp = ctx.rsp.qword;
  r8  = ctx.r8.qword;
  r9  = ctx.r9.qword;
  r10 = ctx.r10.qword;
  r11 = ctx.r11.qword;
  r12 = ctx.r12.qword;
  r13 = ctx.r13.qword;
  r14 = ctx.r14.qword;
  r15 = ctx.r15.qword;
})

IF_64BIT(extern "C" size_t HelperStub(
             rptr rax, rptr rbx, rptr rcx,
             rptr rdx, rptr rsi, rptr rdi,
             rptr rbp, rptr rsp, rptr r8,
             rptr r9, rptr r10, rptr r11,
             rptr r12, rptr r13, rptr r14,
             rptr r15, rptr flags,
             size_t KEY_STUB, size_t RET_ADDR, size_t REL_ADDR, rptr vsp,
             rptr vip, VirtualRegister *__restrict__ vmregs,
             size_t *__restrict__ slots);)

IF_64BIT(__attribute__((always_inline)) extern "C" size_t HelperStubEmpty(
    rptr rax, rptr rbx, rptr rcx,
    rptr rdx, rptr rsi, rptr rdi,
    rptr rbp, rptr rsp, rptr r8,
    rptr r9, rptr r10, rptr r11,
    rptr r12, rptr r13, rptr r14,
    rptr r15, rptr flags,
    size_t KEY_STUB, size_t RET_ADDR, size_t REL_ADDR, rptr vsp,
    rptr vip, VirtualRegister *__restrict__ vmregs,
    size_t *__restrict__ slots) { return vip; })

IF_64BIT(extern "C" __attribute__((always_inline)) size_t HelperFunction(
    rptr rax, rptr rbx, rptr rcx,
    rptr rdx, rptr rsi, rptr rdi,
    rptr rbp, rptr rsp, rptr r8,
    rptr r9, rptr r10, rptr r11,
    rptr r12, rptr r13, rptr r14,
    rptr r15, rptr flags, size_t KEY_STUB,
    size_t RET_ADDR, size_t REL_ADDR) {
  // 1. Allocate the temporary virtual registers
  VirtualRegister vmregs[30] = {0};
  // 2. Allocate the temporary passing slots
  size_t slots[30] = {0};
  // 3. Initialize the stack and program pointer
  size_t vip = 0;
  // 4. Zero out the REL_ADDR
  REL_ADDR = 0;
  // 5. Execute the stack machine code
  vip = HelperStub(rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp, r8, r9, r10, r11, r12, r13, r14, r15,
    flags, KEY_STUB, RET_ADDR, REL_ADDR, rsp, vip, vmregs, slots);
  // 6. Reset the flags
  flags = UNDEF<size_t>();
  // 7. Return the PC
  return vip;
})

IF_64BIT(extern "C" size_t HelperSlicePC(size_t rax, size_t rbx, size_t rcx, size_t rdx, size_t rsi,
                                         size_t rdi, size_t rbp, size_t rsp, size_t r8, size_t r9,
                                         size_t r10, size_t r11, size_t r12, size_t r13, size_t r14,
                                         size_t r15, size_t flags, size_t KEY_STUB,
                                         size_t RET_ADDR, size_t REL_ADDR) {
  // 1. Allocate the temporary virtual registers
  VirtualRegister vmregs[30] = {0};
  // 2. Allocate the temporary passing slots
  size_t slots[30] = {0};
  // 3. Initialize the stack pointer, the program counter and REL_ADDR value
  size_t vsp = rsp;
  size_t vip = 0;
  // 4. Zero out the REL_ADDR
  REL_ADDR = 0;
  // 5. Execute the stack machine code
  vip = HelperStub(rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp, r8, r9, r10, r11, r12, r13, r14, r15,
    flags, KEY_STUB, RET_ADDR, REL_ADDR, vsp, vip, vmregs, slots);
  // 6. Reset the flags
  flags = UNDEF<size_t>();
  // 7. Return the sliced program counter
  return vip;
})

IF_32BIT(extern "C" void HelperUnsupported(
  rptr eax, rptr ebx, rptr ecx,
  rptr edx, rptr esi, rptr edi,
  rptr ebp, rptr esp) {
  VirtualContext ctx;
  ctx.eax.dword = eax;
  ctx.ebx.dword = ebx;
  ctx.ecx.dword = ecx;
  ctx.edx.dword = edx;
  ctx.esi.dword = esi;
  ctx.edi.dword = edi;
  ctx.ebp.dword = ebp;
  ctx.esp.dword = esp;
  HelperUnsupportedStub(ctx);
  eax = ctx.eax.dword;
  ebx = ctx.ebx.dword;
  ecx = ctx.ecx.dword;
  edx = ctx.edx.dword;
  esi = ctx.esi.dword;
  edi = ctx.edi.dword;
  ebp = ctx.ebp.dword;
  esp = ctx.esp.dword;
})

IF_32BIT(extern "C" size_t HelperStub(rptr eax, rptr ebx,
                                      rptr ecx, rptr edx,
                                      rptr esi, rptr edi,
                                      rptr ebp, rptr esp,
                                      rptr eip, rptr flags,
                                      size_t KEY_STUB, size_t RET_ADDR, size_t REL_ADDR,
                                      rptr vsp, rptr vip,
                                      VirtualRegister *__restrict__ vmregs);)

IF_32BIT(__attribute__((always_inline)) extern "C" size_t HelperStubEmpty(
    rptr eax, rptr ebx, rptr ecx,
    rptr edx, rptr esi, rptr edi,
    rptr ebp, rptr esp, rptr eip,
    rptr flags, size_t KEY_STUB, size_t RET_ADDR, size_t REL_ADDR,
    rptr vsp, rptr vip,
    VirtualRegister *__restrict__ vmregs) { return vip; })

IF_32BIT(extern "C" __attribute__((always_inline)) size_t HelperFunction(
    rptr eax, rptr ebx, rptr ecx,
    rptr edx, rptr esi, rptr edi,
    rptr ebp, rptr esp, rptr eip,
    rptr flags, size_t KEY_STUB, size_t RET_ADDR, size_t REL_ADDR) {
  // 1. Allocate the temporary virtual registers
  VirtualRegister vmregs[30] = {0};
  // 2. Initialize the stack and pointer
  size_t vsp = esp;
  size_t vip = 0;
  // 3. Zero out the REL_ADDR
  REL_ADDR = 0;
  // 4. Execute the stack machine code
  vip = HelperStub(eax, ebx, ecx, edx, esi, edi, ebp, esp, eip, flags, KEY_STUB, RET_ADDR, REL_ADDR,
                   vsp, vip, vmregs);
  // 5. Save the value of the stack pointer
  esp = vsp;
  // 6. Reset the flags
  flags = UNDEF<size_t>();
  // 7. Return the PC
  return vip;
})

IF_32BIT(extern "C" size_t HelperSlicePC(size_t eax, size_t ebx, size_t ecx, size_t edx, size_t esi,
                                         size_t edi, size_t ebp, size_t esp, size_t eip,
                                         size_t flags, size_t KEY_STUB, size_t RET_ADDR,
                                         size_t REL_ADDR) {
  // 1. Allocate the temporary virtual registers
  VirtualRegister vmregs[30] = {0};
  // 2. Initialize the stack pointer, the program counter and REL_ADDR value
  size_t vsp = esp;
  size_t vip = 0;
  // 3. Zero out the REL_ADDR
  REL_ADDR = 0;
  // 4. Execute the stack machine code
  vip = HelperStub(eax, ebx, ecx, edx, esi, edi, ebp, esp, eip, flags, KEY_STUB, RET_ADDR, REL_ADDR,
                   vsp, vip, vmregs);
  // 5. Reset the flags
  flags = UNDEF<size_t>();
  // 6. Return the sliced program counter
  return vip;
})

// Helper function to keep the PC value

extern "C" __attribute__((const)) __attribute__((noduplicate)) __attribute__((nomerge)) size_t HelperKeepPC(size_t ret0, size_t ret1);

// Dummy function to retain the pointers

extern "C" void retainPointers() {
  RAM[0] = HelperKeepPC(0, 1);
  GS[0] = 0;
  FS[0] = 0;
}

// NOT ACTUALLY WORKING
static_assert(std::is_same_v<decltype(HelperStub), decltype(HelperStubEmpty)>, "");