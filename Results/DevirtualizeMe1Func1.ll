./Lifter -h=VMProtectHelpers_64.ll -i=devirtualizeme64_vmp_3.0.9_v1.exe -f=0x140001d10
[!] Adding command line argument: -earlycse-mssa-optimization-cap=1000000
[!] Adding command line argument: -dse-memoryssa-defs-per-block-limit=1000000
[!] Adding command line argument: -dse-memoryssa-partial-store-limit=1000000
[!] Adding command line argument: -dse-memoryssa-path-check-limit=1000000
[!] Adding command line argument: -dse-memoryssa-scanlimit=1000000
[!] Adding command line argument: -dse-memoryssa-walklimit=1000000
[!] Adding command line argument: -dse-memoryssa-otherbb-cost=2
[!] Adding command line argument: -memssa-check-limit=1000000
[!] Adding command line argument: -memdep-block-number-limit=1000000
[!] Adding command line argument: -memdep-block-scan-limit=1000000
[!] Adding command line argument: -gvn-max-block-speculations=1000000
[!] Adding command line argument: -gvn-max-num-deps=1000000
[!] Adding command line argument: -gvn-hoist-max-chain-length=-1
[!] Adding command line argument: -gvn-hoist-max-depth=-1
[!] Adding command line argument: -gvn-hoist-max-bbs=-1
[!] Adding command line argument: -unroll-threshold=1000000
[+] Opening: devirtualizeme.exe
[+] Helpers: VMProtectHelpers_64.ll
[*] COFF binary detected
[i] Parsing: .text
[i] Parsing: .vmp0
[*] Discovered VmEnter(s):
  - 0x140001d10
Handling virtual stub: 0x140001d10
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x140001d10
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 rbp
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0x140001d10
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_IMM_64 0x228
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x10
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VSP_64
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x140001d17
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0x1400fd443
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0x14000f038
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] LOAD_DS_64
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r12
[VM] POP_REG_64 rbx
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r10
[VM] POP_REG_64 r11
[VM] POP_REG_64 flags
[VM] POP_REG_64 r9
[VM] POP_REG_64 rax
[VM] POP_REG_64 r15
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r8
[VM] POP_REG_64 r13
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r14
[VM] EXIT
[EXIT]
VmExit: 0x140001d10
[BLOCKS] 1
0x140001D10 =>
[FunctionCall] 0x14000f038 (KERNEL32.dll::GetTickCount64)
[VirtualStub] 0x1400fd443
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x140001d10(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !alias.scope !22, !noalias !27
  %2 = add i64 %1, -560
  %3 = inttoptr i64 %2 to i64*
  store i64 5369746499, i64* %3, align 1, !noalias !65
  %4 = load i64, i64* inttoptr (i64 5368770616 to i64*), align 8, !noalias !65
  store i64 %2, i64* %rsp, align 8, !tbaa !4, !alias.scope !22, !noalias !27
  ret i64 %4
}


Handling virtual stub: 0x1400fd443
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1400fd443
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 rbp
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x140001d17
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x14000f8c0
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x62a7199b1c3f1f8d
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0xd76c935d402f667d
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] MUL_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_IMM_32 0x981bf73d
[VM] POP_VMREG_32_LOW vmregs[10]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VMREG_64 vmregs[17]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_32_HIGH vmregs[10]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] IMUL_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x2021a262e340600
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_32 0x100
[VM] POP_VMREG_32_LOW vmregs[14]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[14]
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] PUSH_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0xfffffffffffffffe
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] PUSH_IMM_64 0x1fd50
[VM] PUSH_VMREG_64 vmregs[17]
[VM] IMUL_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x1
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0xffffffffffffffef
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0x10
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] NOR_64
[VM] PUSH_IMM_64 0x8c9d055990cbb9f8
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[0]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x20
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x39891ca5a62f0fd0
[VM] POP_VMREG_64 vmregs[0]
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0x1
[VM] PUSH_VMREG_64 vmregs[3]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0xfffffffffffffffe
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0x1
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x1400fd44d
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0x140001fdc
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r12
[VM] POP_REG_64 rbx
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r10
[VM] POP_REG_64 r11
[VM] POP_REG_64 flags
[VM] POP_REG_64 r9
[VM] POP_REG_64 rax
[VM] POP_REG_64 r15
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r8
[VM] POP_REG_64 r13
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r14
[VM] EXIT
[EXIT]
VmExit: 0x1400fd443
[BLOCKS] 1
0x1400FD443 =>
[FunctionCall] 0x140001fdc (<not an import>)
[VirtualStub] 0x1400fd44d
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1400fd443(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !tbaa !4, !alias.scope !66, !noalias !71
  %2 = add i64 %1, -8
  %3 = load i64, i64* %rax, align 8, !alias.scope !109, !noalias !110
  %4 = add i64 %3, 7108678690812141453
  %5 = zext i64 %4 to i128
  %6 = mul nuw i128 %5, 15522944044357346941
  %7 = lshr i128 %6, 95
  %8 = trunc i128 %7 to i64
  %9 = mul i64 %8, -2551969597
  %10 = add i64 %3, 7108678690812141454
  %11 = add i64 %10, %9
  %12 = mul i64 %11, 130384
  %13 = add i64 %12, 288230376151450976
  %14 = and i64 %13, 144706889315517952
  %15 = add i64 %1, 32
  %16 = xor i64 %14, 8314483454816568839
  %17 = or i64 %16, -8784830337641304024
  %18 = and i64 %16, 144680345777733632
  %19 = xor i64 %18, -5253981136489236952
  %20 = and i64 %19, %17
  %21 = or i64 %20, 1
  %22 = inttoptr i64 %2 to i64*
  store i64 5369746509, i64* %22, align 1, !noalias !111
  store i64 %21, i64* %r9, align 8, !tbaa !4, !alias.scope !112, !noalias !113
  store i64 4145876429754535888, i64* %rax, align 8, !tbaa !4, !alias.scope !109, !noalias !110
  store i64 5368772800, i64* %r8, align 8, !tbaa !4, !alias.scope !114, !noalias !115
  store i64 256, i64* %rdx, align 8, !tbaa !4, !alias.scope !116, !noalias !117
  store i64 %15, i64* %rcx, align 8, !tbaa !4, !alias.scope !118, !noalias !119
  store i64 %2, i64* %rsp, align 8, !tbaa !4, !alias.scope !66, !noalias !71
  ret i64 5368717276
}


Handling virtual stub: 0x1400fd44d
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1400fd44d
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 rbp
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x140001d17
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_IMM_64 0x14000f828
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_IMM_64 0x140018640
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[16]
[VM] LOAD_DS_64
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x20
[VM] ADD_64
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x10
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_32 0x40
[VM] POP_VMREG_32_LOW vmregs[1]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[1]
[VM] LOAD_DS_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x1400fd457
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0x14000f288
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] LOAD_DS_64
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r12
[VM] POP_REG_64 rbx
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r10
[VM] POP_REG_64 r11
[VM] POP_REG_64 flags
[VM] POP_REG_64 r9
[VM] POP_REG_64 rax
[VM] POP_REG_64 r15
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r8
[VM] POP_REG_64 r13
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r14
[VM] EXIT
[EXIT]
VmExit: 0x1400fd44d
[BLOCKS] 1
0x1400FD44D =>
[FunctionCall] 0x14000f288 (USER32.dll::MessageBoxW)
[VirtualStub] 0x1400fd457
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1400fd44d(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !tbaa !4, !alias.scope !120, !noalias !125
  %2 = add i64 %1, -8
  %3 = load i64, i64* inttoptr (i64 5368809024 to i64*), align 64, !noalias !163
  %4 = add i64 %1, 32
  %5 = add i64 %3, 16
  %6 = inttoptr i64 %5 to i64*
  %7 = load i64, i64* %6, align 1, !noalias !163
  %8 = inttoptr i64 %2 to i64*
  store i64 5369746519, i64* %8, align 1, !noalias !163
  %9 = load i64, i64* inttoptr (i64 5368771208 to i64*), align 8, !noalias !163
  store i64 64, i64* %r9, align 8, !tbaa !4, !alias.scope !164, !noalias !165
  store i64 5368772648, i64* %r8, align 8, !tbaa !4, !alias.scope !166, !noalias !167
  store i64 %4, i64* %rdx, align 8, !tbaa !4, !alias.scope !168, !noalias !169
  store i64 %7, i64* %rcx, align 8, !tbaa !4, !alias.scope !170, !noalias !171
  store i64 %2, i64* %rsp, align 8, !tbaa !4, !alias.scope !120, !noalias !125
  ret i64 %9
}


Handling virtual stub: 0x1400fd457
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1400fd457
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 rbp
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x140001d17
[VM] PUSH_VMREG_64 vmregs[10]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_IMM_64 0x228
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VSP_64
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r12
[VM] POP_REG_64 rbx
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r10
[VM] POP_REG_64 r11
[VM] POP_REG_64 flags
[VM] POP_REG_64 r9
[VM] POP_REG_64 rax
[VM] POP_REG_64 r15
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r8
[VM] POP_REG_64 r13
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r14
[VM] EXIT
[EXIT]
VmExit: 0x1400fd457
[BLOCKS] 1
0x1400FD457 =>
[FunctionReturn] ret
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1400fd457(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !alias.scope !172, !noalias !177
  %2 = add i64 %1, 552
  %3 = inttoptr i64 %2 to i64*
  %4 = load i64, i64* %3, align 1, !noalias !215
  %5 = add i64 %1, 560
  store i64 %5, i64* %rsp, align 8, !tbaa !4, !alias.scope !172, !noalias !177
  ret i64 %4
}