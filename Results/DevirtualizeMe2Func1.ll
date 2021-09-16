./Lifter -h=VMProtectHelpers_64.bc -i=devirtualizeme64_vmp_3.0.9_v2.exe -f=0x140001d20
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
[+] Opening: devirtualizeme64_vmp_3.0.9_v2.exe
[+] Helpers: VMProtectHelpers_64.bc
[*] COFF binary detected
[i] Parsing: .text
[i] Parsing: .vmp0
[*] Discovered VmEnter(s):
  - 0x140001d20
  - 0x140001e60
Handling virtual stub: 0x140001d20
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x140001d20
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 r11
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0x140001d20
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0x140001d23
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0x448
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x10
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VSP_64
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_32 0x104
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] STORE_SS_32
[VM] PUSH_IMM_64 0x20
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0x1400fbbea
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x14000f000
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] LOAD_DS_64
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] POP_REG_64 r11
[VM] POP_REG_64 rdi
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r9
[VM] POP_REG_64 flags
[VM] POP_REG_64 r14
[VM] POP_REG_64 r12
[VM] POP_REG_64 rax
[VM] POP_REG_64 r8
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r15
[VM] POP_REG_64 r13
[VM] POP_REG_64 rcx
[VM] POP_REG_64 rbx
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r10
[VM] EXIT
[EXIT]
VmExit: 0x140001d20
[BLOCKS] 1
0x140001D20 =>
[FunctionCall] 0x14000f000 (ADVAPI32.dll::GetUserNameW)
[VirtualStub] 0x1400fbbea
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x140001d20(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !alias.scope !22, !noalias !27
  %2 = add i64 %1, -1104
  %3 = add i64 %1, 8
  %4 = inttoptr i64 %3 to i32*
  store i32 260, i32* %4, align 1, !noalias !65
  %5 = add i64 %1, -1064
  %6 = inttoptr i64 %2 to i64*
  store i64 5369740266, i64* %6, align 1, !noalias !65
  %7 = load i64, i64* inttoptr (i64 5368770560 to i64*), align 4096, !noalias !65
  store i64 %1, i64* %rax, align 8, !tbaa !4, !alias.scope !66, !noalias !67
  store i64 %5, i64* %rcx, align 8, !tbaa !4, !alias.scope !68, !noalias !69
  store i64 %3, i64* %rdx, align 8, !tbaa !4, !alias.scope !70, !noalias !71
  store i64 %2, i64* %rsp, align 8, !tbaa !4, !alias.scope !22, !noalias !27
  ret i64 %7
}


Handling virtual stub: 0x1400fbbea
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1400fbbea
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 r11
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_VMREG_32_LOW vmregs[15]
[VM] PUSH_VMREG_32_LOW vmregs[15]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_32_LOW vmregs[15]
[VM] PUSH_VMREG_32_LOW vmregs[15]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[18]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_32_LOW vmregs[21]
[VM] PUSH_IMM_64 0x1400bbb37
[VM] PUSH_IMM_64 0x14009c8da
[VM] PUSH_VSP_64
[VM] PUSH_IMM_16 0x3
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[12]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x14009c8de
[VirtualBlock] 0x1400bbb3b
[WORKLIST]: 1
[EXPLORED]: 1
[VIRBLOCK]: 0x14009c8de
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_16 0x0
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x2
[VM] ADD_64
[VM] PUSH_IMM_64 0xbe7b44621595a631
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_IMM_64 0x20
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[4]
[VM] LOAD_SS_16
[VM] POP_VMREG_32_LOW vmregs[12]
[VM] PUSH_IMM_16 0x42
[VM] PUSH_VMREG_16_LOWLOW vmregs[12]
[VM] PUSH_VMREG_16_LOWLOW vmregs[12]
[VM] NOR_16
[VM] POP_VMREG_64 vmregs[23]
[VM] ADD_16
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_VSP_64
[VM] LOAD_SS_16
[VM] NOR_16
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_16_LOWLOW vmregs[12]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_IMM_16 0x8
[VM] PUSH_VMREG_16_LOWLOW vmregs[12]
[VM] PUSH_VMREG_16_LOWLOW vmregs[12]
[VM] NOR_16
[VM] POP_VMREG_64 vmregs[6]
[VM] ADD_16
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VSP_64
[VM] LOAD_SS_16
[VM] NOR_16
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_16_LOWLOW vmregs[0]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_32_HIGH vmregs[12]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x450
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[23]
[VM] LOAD_SS_32
[VM] POP_VMREG_32_LOW vmregs[12]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[12]
[VM] PUSH_IMM_64 0x1400d25db
[VM] PUSH_IMM_64 0x1400f5a60
[VM] PUSH_VSP_64
[VM] PUSH_IMM_16 0x3
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0xffffffffffffffbe
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[16]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x1400d25df
[VirtualBlock] 0x1400f5a64
[WORKLIST]: 2
[EXPLORED]: 2
[VIRBLOCK]: 0x1400bbb3b
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[20]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0x14000f960
[VM] PUSH_VMREG_64 vmregs[20]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0xfff73a07
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0x1400bbc3e
[VM] JUMP_INC
[UNCONDITIONAL]
VmNop: 0x1400bbb3b
[VirtualBlock] 0x1400bbc42
[WORKLIST]: 2
[EXPLORED]: 3
[VIRBLOCK]: 0x1400d25df
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[20]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x1
[VM] PUSH_VMREG_32_LOW vmregs[7]
[VM] PUSH_VMREG_32_LOW vmregs[7]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[17]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_32_LOW vmregs[15]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0x1400a2e0e
[VM] PUSH_IMM_64 0x1400cf602
[VM] PUSH_VSP_64
[VM] PUSH_IMM_16 0x3
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0xffffffffffffffbe
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[17]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x1400a2e12
[VirtualBlock] 0x1400cf606
[WORKLIST]: 3
[EXPLORED]: 4
[VIRBLOCK]: 0x1400f5a64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x1
[VM] PUSH_VMREG_32_LOW vmregs[5]
[VM] PUSH_VMREG_32_LOW vmregs[5]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[19]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_32_LOW vmregs[15]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0x14001b605
[VM] PUSH_IMM_64 0x1400a749f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_16 0x3
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0xffffffffffffffbe
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x14001b609
[VirtualBlock] 0x1400a74a3
[WORKLIST]: 4
[EXPLORED]: 5
[VIRBLOCK]: 0x1400bbc42
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0x140018640
[VM] PUSH_IMM_32 0x40
[VM] POP_VMREG_32_LOW vmregs[14]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[14]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] LOAD_DS_64
[VM] PUSH_IMM_64 0x14000f828
[VM] PUSH_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x10
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] LOAD_DS_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_IMM_64 0x1400fbbfe
[VM] PUSH_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x14000f290
[VM] PUSH_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] LOAD_DS_64
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] POP_REG_64 r11
[VM] POP_REG_64 rdi
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r9
[VM] POP_REG_64 flags
[VM] POP_REG_64 r14
[VM] POP_REG_64 r12
[VM] POP_REG_64 rax
[VM] POP_REG_64 r8
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r15
[VM] POP_REG_64 r13
[VM] POP_REG_64 rcx
[VM] POP_REG_64 rbx
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r10
[VM] EXIT
[EXIT]
VmExit: 0x1400bbc42
[WORKLIST]: 3
[EXPLORED]: 6
[VIRBLOCK]: 0x1400a2e12
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0x573bf757ee651c7a
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x573bf756519a626b
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x1400a2f07
[VM] JUMP_INC
[UNCONDITIONAL]
VmNop: 0x1400a2e12
[VirtualBlock] 0x1400a2f0b
[WORKLIST]: 3
[EXPLORED]: 7
[VIRBLOCK]: 0x1400cf606
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x22
[VM] PUSH_IMM_64 0x5af584b5351e61
[VM] POP_VMREG_64 vmregs[5]
[VM] ADD_64
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_32_LOW vmregs[18]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[18]
[VM] POP_VMREG_32_LOW vmregs[8]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0x13635f9399277772
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0xecc655e96c1695d5
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x1400cf75b
[VM] JUMP_INC
[UNCONDITIONAL]
VmNop: 0x1400cf606
[VirtualBlock] 0x1400cf75f
[WORKLIST]: 3
[EXPLORED]: 8
[VIRBLOCK]: 0x14001b609
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0xe402fe2602ceaeb2
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0x1400a2f07
[VM] PUSH_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] JUMP_INC
[UNKNOWN]
[!] Possible constant address: 0x14000f290
[VirtualBlock] 0x1400a2f0b
[WORKLIST]: 3
[EXPLORED]: 9
[VIRBLOCK]: 0x1400a74a3
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[15]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_32_LOW vmregs[13]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[13]
[VM] POP_VMREG_32_LOW vmregs[5]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x22
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_IMM_64 0xfffffffe400710ae
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x1400a75d6
[VM] JUMP_INC
[UNCONDITIONAL]
VmNop: 0x1400a74a3
[VirtualBlock] 0x1400a75da
[WORKLIST]: 3
[EXPLORED]: 10
[VIRBLOCK]: 0x1400a2f0b
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x14000f8c0
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[20]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[21]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x230
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_IMM_16 0x8
[VM] PUSH_VMREG_64 vmregs[1]
[VM] POP_VMREG_32_LOW vmregs[20]
[VM] POP_VMREG_32_LOW vmregs[22]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] POP_VMREG_16_LOWLOW vmregs[7]
[VM] PUSH_VSP_64
[VM] LOAD_SS_16
[VM] SHL_32
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_16 0x8
[VM] PUSH_VMREG_16_LOWLOW vmregs[20]
[VM] PUSH_VMREG_16_LOWLOW vmregs[20]
[VM] SHL_32
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_16_LOWLOW vmregs[22]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] LOAD_SS_16
[VM] PUSH_IMM_16 0x8
[VM] PUSH_VMREG_64 vmregs[1]
[VM] POP_VMREG_32_LOW vmregs[7]
[VM] POP_VMREG_16_LOWLOW vmregs[20]
[VM] PUSH_VSP_64
[VM] LOAD_SS_16
[VM] SHL_32
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_16 0x8
[VM] PUSH_VMREG_16_LOWLOW vmregs[20]
[VM] PUSH_VMREG_16_LOWLOW vmregs[20]
[VM] SHL_32
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_16_LOWLOW vmregs[2]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] LOAD_SS_16
[VM] POP_VMREG_32_LOW vmregs[20]
[VM] POP_VMREG_32_LOW vmregs[2]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_32_LOW vmregs[2]
[VM] PUSH_IMM_32 0x104
[VM] POP_VMREG_32_LOW vmregs[18]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[18]
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_IMM_64 0x1400fbbf4
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0x140002154
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] POP_REG_64 r11
[VM] POP_REG_64 rdi
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r9
[VM] POP_REG_64 flags
[VM] POP_REG_64 r14
[VM] POP_REG_64 r12
[VM] POP_REG_64 rax
[VM] POP_REG_64 r8
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r15
[VM] POP_REG_64 r13
[VM] POP_REG_64 rcx
[VM] POP_REG_64 rbx
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r10
[VM] EXIT
[EXIT]
VmExit: 0x1400a2f0b
[WORKLIST]: 2
[EXPLORED]: 11
[VIRBLOCK]: 0x1400cf75f
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_16 0x0
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_IMM_64 0x2
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_IMM_64 0xb
[VM] PUSH_VMREG_64 vmregs[5]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[9]
[VM] LOAD_DS_16
[VM] POP_VMREG_32_LOW vmregs[15]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[15]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x1400cf75b
[VM] PUSH_IMM_64 0x1400a2e0e
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] MUL_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_16 0x1
[VM] PUSH_VMREG_64 vmregs[4]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0xfffffffffffffffe
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0x1
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0xffffffffffffffef
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0x10
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[4]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_16 0x3
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] JUMP_INC
[UNKNOWN]
[!] Possible constant address: 0x14000f290
[VirtualBlock] 0x1400a2e12
[VirtualBlock] 0x1400cf75f
[WORKLIST]: 2
[EXPLORED]: 11
[VIRBLOCK]: 0x1400a75da
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_16 0x0
[VM] PUSH_VMREG_64 vmregs[1]
[VM] LOAD_DS_16
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0x2
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_32_LOW vmregs[3]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] PUSH_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_32 0xfffffffc
[VM] PUSH_VMREG_32_LOW vmregs[1]
[VM] PUSH_VMREG_32_LOW vmregs[1]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[0]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_32_LOW vmregs[1]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[1]
[VM] POP_VMREG_32_HIGH vmregs[3]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x4ed20f7c
[VM] PUSH_VMREG_64 vmregs[0]
[VM] IMUL_64
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] PUSH_VMREG_64 vmregs[19]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0xfffffffffffffffe
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0x1
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0xffffffffffffffef
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x10
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[17]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x1400a75d6
[VM] PUSH_IMM_64 0x14001b605
[VM] PUSH_VSP_64
[VM] PUSH_IMM_16 0x3
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[10]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] JUMP_INC
[UNKNOWN]
[!] Possible constant address: 0x14000f290
[!] Possible constant address: 0x14000f290
[VirtualBlock] 0x14001b609
[VirtualBlock] 0x1400a75da
[ProveAgain] 0x14001b609
[WORKLIST]: 2
[EXPLORED]: 10
[VIRBLOCK]: 0x1400cf75f
[!] Possible constant address: 0x14000f290
[!] Possible constant address: 0x14000f290
[VirtualBlock] 0x1400a2e12
[VirtualBlock] 0x1400cf75f
[WORKLIST]: 3
[EXPLORED]: 11
[VIRBLOCK]: 0x14001b609
[!] Possible constant address: 0x14000f290
[!] Possible constant address: 0x14000f290
[VirtualBlock] 0x1400a2f0b
[WORKLIST]: 3
[EXPLORED]: 12
[VIRBLOCK]: 0x1400a75da
[!] Possible constant address: 0x14000f290
[!] Possible constant address: 0x14000f290
[VirtualBlock] 0x14001b609
[VirtualBlock] 0x1400a75da
[BLOCKS] 13
0x14001B609 => 0x1400A2F0B
0x14009C8DE => 0x1400D25DF 0x1400F5A64
0x1400A2E12 => 0x1400A2F0B
0x1400A2F0B =>
0x1400A74A3 => 0x1400A75DA
0x1400A75DA => 0x14001B609 0x1400A75DA
0x1400BBB3B => 0x1400BBC42
0x1400BBC42 =>
0x1400CF606 => 0x1400CF75F
0x1400CF75F => 0x1400A2E12 0x1400CF75F
0x1400D25DF => 0x1400A2E12 0x1400CF606
0x1400F5A64 => 0x14001B609 0x1400A74A3
0x1400FBBEA => 0x14009C8DE 0x1400BBB3B
[FunctionCall] 0x14000f290 (USER32.dll::MessageBoxW)
[FunctionCall] 0x140002154 (<not an import>)
[VirtualStub] 0x1400fbbf4
[VirtualStub] 0x1400fbbfe
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1400fbbea(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !tbaa !4, !alias.scope !73, !noalias !78
  %2 = add i64 %1, -8
  %3 = load i64, i64* %r10, align 8, !alias.scope !117, !noalias !118
  %4 = load i64, i64* %rax, align 8, !alias.scope !119, !noalias !120
  %5 = load i64, i64* %r11, align 8, !alias.scope !121, !noalias !122
  %6 = trunc i64 %4 to i32
  %7 = icmp eq i32 %6, 0
  %8 = inttoptr i64 %2 to i64*
  br i1 %7, label %69, label %9

9:                                                ; preds = %0
  %10 = add i64 %1, 32
  %11 = inttoptr i64 %10 to i16*
  %12 = load i16, i16* %11, align 1, !noalias !123
  %13 = sub i16 65, %12
  %14 = add i64 %1, 1104
  %15 = inttoptr i64 %14 to i32*
  %16 = load i32, i32* %15, align 1, !noalias !123
  %17 = zext i32 %16 to i64
  %18 = icmp ult i16 %13, -9, !souper !128
  %19 = icmp ugt i32 %16, 1, !souper !128
  br i1 %18, label %39, label %20

20:                                               ; preds = %9
  br i1 %19, label %21, label %61

21:                                               ; preds = %20
  %22 = add nuw nsw i64 %17, 4294967295
  %23 = and i64 %22, 4294967295
  %24 = add i64 %1, 34
  br label %25

25:                                               ; preds = %25, %21
  %26 = phi i64 [ -4721104596308220367, %21 ], [ %36, %25 ]
  %27 = phi i64 [ %24, %21 ], [ %31, %25 ]
  %28 = phi i64 [ %23, %21 ], [ %37, %25 ]
  %29 = inttoptr i64 %27 to i16*
  %30 = load i16, i16* %29, align 1, !noalias !129
  %31 = add i64 %27, 2
  %32 = zext i16 %30 to i64
  %33 = add nsw i64 %26, 3
  %34 = and i64 %33, 3
  %35 = add nuw nsw i64 %34, %32
  %36 = mul nuw nsw i64 %35, 1322389372
  %37 = add nsw i64 %28, -1
  %38 = icmp eq i64 %28, 1, !souper !128
  br i1 %38, label %61, label %25

39:                                               ; preds = %9
  br i1 %19, label %40, label %61

40:                                               ; preds = %39
  %41 = add i64 %1, 34
  %42 = add nuw nsw i64 %17, 4294967295
  %43 = and i64 %42, 4294967295
  br label %44

44:                                               ; preds = %44, %40
  %45 = phi i64 [ %41, %40 ], [ %48, %44 ]
  %46 = phi i64 [ -4721104596308220367, %40 ], [ %58, %44 ]
  %47 = phi i64 [ %43, %40 ], [ %59, %44 ]
  %48 = add i64 %45, 2
  %49 = add nsw i64 %46, 1397065396949317490
  %50 = or i64 %49, 11
  %51 = inttoptr i64 %45 to i16*
  %52 = load i16, i16* %51, align 1, !noalias !134
  %53 = zext i16 %52 to i64
  %54 = sub i64 %50, %53
  %55 = zext i64 %54 to i128
  %56 = mul nuw nsw i128 %55, 25602698228604513
  %57 = lshr i128 %56, 65
  %58 = trunc i128 %57 to i64
  %59 = add nsw i64 %47, -1
  %60 = icmp eq i64 %47, 1, !souper !128
  br i1 %60, label %61, label %44

61:                                               ; preds = %44, %25, %39, %20
  %62 = phi i64 [ -2016770243899248974, %20 ], [ 6285889661959478394, %39 ], [ 6285889661959478394, %44 ], [ -2016770243899248974, %25 ]
  %63 = phi i64 [ %3, %20 ], [ %3, %39 ], [ 25602698228604513, %44 ], [ %3, %25 ]
  %64 = phi i64 [ -4721104596308220367, %20 ], [ -4721104596308220367, %39 ], [ %58, %44 ], [ %36, %25 ]
  %65 = phi i64 [ %5, %20 ], [ %5, %39 ], [ 1397065396949317490, %44 ], [ %5, %25 ]
  %66 = xor i64 %64, %62
  %67 = add i64 %1, 560
  %68 = call i64 @llvm.bswap.i64(i64 %66) #15
  store i64 5369740276, i64* %8, align 1, !noalias !139
  store i64 %65, i64* %r11, align 8, !tbaa !4, !alias.scope !160, !noalias !161
  store i64 %68, i64* %r9, align 8, !tbaa !4, !alias.scope !163, !noalias !164
  store i64 %62, i64* %rax, align 8, !tbaa !4, !alias.scope !165, !noalias !166
  store i64 5368772800, i64* %r8, align 8, !tbaa !4, !alias.scope !167, !noalias !168
  store i64 %67, i64* %rcx, align 8, !tbaa !4, !alias.scope !169, !noalias !170
  store i64 260, i64* %rdx, align 8, !tbaa !4, !alias.scope !171, !noalias !172
  store i64 %63, i64* %r10, align 8, !tbaa !4, !alias.scope !173, !noalias !174
  br label %75

69:                                               ; preds = %0
  %70 = load i64, i64* inttoptr (i64 5368809024 to i64*), align 64, !noalias !175
  %71 = add i64 %70, 16
  %72 = inttoptr i64 %71 to i64*
  %73 = load i64, i64* %72, align 1, !noalias !175
  store i64 5369740286, i64* %8, align 1, !noalias !175
  %74 = load i64, i64* inttoptr (i64 5368771216 to i64*), align 16, !noalias !175
  store i64 64, i64* %r9, align 8, !tbaa !4, !alias.scope !196, !noalias !197
  store i64 5368772648, i64* %r8, align 8, !tbaa !4, !alias.scope !199, !noalias !200
  store i64 %73, i64* %rcx, align 8, !tbaa !4, !alias.scope !201, !noalias !202
  store i64 5368772960, i64* %rdx, align 8, !tbaa !4, !alias.scope !203, !noalias !204
  br label %75

75:                                               ; preds = %61, %69
  %76 = phi i64 [ %74, %69 ], [ 5368717652, %61 ]
  store i64 %2, i64* %rsp, align 8, !tbaa !4, !alias.scope !205, !noalias !206
  ret i64 %76
}


Handling virtual stub: 0x1400fbbf4
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1400fbbf4
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 r11
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x230
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x1400bbc3e
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] JUMP_INC
[UNCONDITIONAL]
[VirtualBlock] 0x1400bbc42
[WORKLIST]: 0
[EXPLORED]: 1
[VIRBLOCK]: 0x1400bbc42
[EXIT]
VmExit: 0x1400bbc42
[BLOCKS] 2
0x1400BBC42 =>
0x1400FBBF4 => 0x1400BBC42
[FunctionCall] 0x14000f290 (USER32.dll::MessageBoxW)
[VirtualStub] 0x1400fbbfe
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1400fbbf4(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !tbaa !4, !alias.scope !207, !noalias !212
  %2 = add i64 %1, -8
  %3 = add i64 %1, 560
  %4 = load i64, i64* inttoptr (i64 5368809024 to i64*), align 64, !noalias !252
  %5 = add i64 %4, 16
  %6 = inttoptr i64 %5 to i64*
  %7 = load i64, i64* %6, align 1, !noalias !252
  %8 = inttoptr i64 %2 to i64*
  store i64 5369740286, i64* %8, align 1, !noalias !252
  %9 = load i64, i64* inttoptr (i64 5368771216 to i64*), align 16, !noalias !252
  store i64 64, i64* %r9, align 8, !tbaa !4, !alias.scope !273, !noalias !274
  store i64 5368772648, i64* %r8, align 8, !tbaa !4, !alias.scope !276, !noalias !277
  store i64 %7, i64* %rcx, align 8, !tbaa !4, !alias.scope !278, !noalias !279
  store i64 %3, i64* %rdx, align 8, !tbaa !4, !alias.scope !280, !noalias !281
  store i64 %2, i64* %rsp, align 8, !tbaa !4, !alias.scope !282, !noalias !283
  ret i64 %9
}


Handling virtual stub: 0x1400fbbfe
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1400fbbfe
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 r11
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x140001d2a
[VM] PUSH_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_IMM_64 0x448
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VSP_64
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] POP_REG_64 r11
[VM] POP_REG_64 rdi
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r9
[VM] POP_REG_64 flags
[VM] POP_REG_64 r14
[VM] POP_REG_64 r12
[VM] POP_REG_64 rax
[VM] POP_REG_64 r8
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r15
[VM] POP_REG_64 r13
[VM] POP_REG_64 rcx
[VM] POP_REG_64 rbx
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r10
[VM] EXIT
[EXIT]
VmExit: 0x1400fbbfe
[BLOCKS] 1
0x1400FBBFE =>
[FunctionReturn] ret
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1400fbbfe(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !alias.scope !284, !noalias !289
  %2 = add i64 %1, 1096
  %3 = inttoptr i64 %2 to i64*
  %4 = load i64, i64* %3, align 1, !noalias !327
  %5 = add i64 %1, 1104
  store i64 %5, i64* %rsp, align 8, !tbaa !4, !alias.scope !284, !noalias !289
  ret i64 %4
}