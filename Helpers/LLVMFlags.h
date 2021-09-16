#ifndef LLVM_FLAGS_H
#define LLVM_FLAGS_H

// Auxiliary carry flag. This is used for binary coded decimal operations and
// is the 5th bit (where each binary decimal is 4 bits).
template <typename T>
inline static bool AuxCarryFlag(T lhs, T rhs, T res) {
  return ((res ^ lhs ^ rhs) & T(0x10));
}

// Auxiliary carry flag. This is used for binary coded decimal operations and
// is the 5th bit (where each binary decimal is 4 bits).
template <typename T>
inline static bool AuxCarryFlag(T lhs, T rhs, T carry, T res) {
  return ((res ^ lhs ^ carry ^ rhs) & T(0x10));
}

// Tests whether there is an even number of bits in the low order byte.
inline static bool ParityFlag(uint8_t r0) {
  return !__builtin_parity(static_cast<unsigned>(r0));
}

// Tests whether there is an even number of bits or not.
template <typename T>
inline static bool ParityFlag(T x) {
  return ParityFlag(static_cast<uint8_t>(x));
}

// Sign flag, tells us if a result is signed or unsigned.
template <typename T>
inline static bool SignFlag(T res) {
  return 0 > Signed(res);
}

// Zero flags, tells us whether or not a value is zero.
template <typename T>
inline static bool ZeroFlag(T res) {
  return T(0) == res;
}

// Calculate the carry flag for SHLD
template <typename T>
inline static uint8_t SHLDCarryFlag(T val, T count) {
  return UCmpEq(UAnd(UShr(val, USub(BitSizeOf(count), count)), 1), 1);
}

// Calculate the carry flag for SHRD
template <typename T>
inline static uint8_t SHRDCarryFlag(T val, T count) {
  return UCmpEq(UAnd(UShr(val, USub(count, 1)), 1), 1);
}

struct tag_add {};
struct tag_div {};
struct tag_mul {};

// Generic carry flag.
template <typename Tag>
struct Carry;

// Computes an carry flag when two numbers are added together.
template <>
struct Carry<tag_add> {
  template <typename T>
  inline static bool Flag(T lhs, T rhs, T res) {
    static_assert(std::is_unsigned<T>::value, "Invalid specialization of `Carry::Flag` for addition.");
    return res < lhs || res < rhs;
  }
};

// Generic overflow flag.
template <typename T>
struct Overflow;

// Computes an overflow flag when two numbers are added together.
template <>
struct Overflow<tag_add> {
  template <typename T>
  inline static bool Flag(T lhs, T rhs, T res) {
    static_assert(std::is_unsigned<T>::value, "Invalid specialization of `Overflow::Flag` for addition.");
    enum {
      kSignShift = sizeof(T) * 8 - 1
    };
    const T sign_lhs = lhs >> kSignShift;
    const T sign_rhs = rhs >> kSignShift;
    const T sign_res = res >> kSignShift;
    return 2 == (sign_lhs ^ sign_res) + (sign_rhs ^ sign_res);
  }
};

// Computes an overflow flag when one number is multiplied with another.

template <>
struct Overflow<tag_mul> {
  // Integer multiplication overflow check, where result is twice the width of the operands.
  template <typename T, typename R>
  inline static bool Flag(T, T, R res, typename std::enable_if<sizeof(T) < sizeof(R),int>::type=0) {
    return static_cast<R>(static_cast<T>(res)) != res;
  }

  // Signed integer multiplication overflow check, where the result is
  // truncated to the size of the operands.
  template <typename T>
  inline static bool Flag(T lhs, T rhs, T, typename std::enable_if<std::is_signed<T>::value,int>::type=0) {
    auto lhs_wide = SExt(lhs);
    auto rhs_wide = SExt(rhs);
    return Flag<T, decltype(lhs_wide)>(lhs, rhs, lhs_wide * rhs_wide);
  }
};

#endif