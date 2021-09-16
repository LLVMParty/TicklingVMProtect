./Lifter -h=VMProtectHelpers_64.bc -i=devirtualizeme64_vmp_3.0.9_v2.exe -f=0x140001e60
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
Handling virtual stub: 0x140001e60
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x140001e60
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 flags
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x140001e60
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_64 0x140001e62
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0x230
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x10
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VSP_64
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_64 0x140001e69
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VMREG_32_LOW vmregs[1]
[VM] PUSH_VMREG_32_LOW vmregs[1]
[VM] PUSH_VMREG_32_LOW vmregs[17]
[VM] PUSH_VMREG_32_LOW vmregs[17]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_32_LOW vmregs[17]
[VM] PUSH_VMREG_32_LOW vmregs[17]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[11]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_32_LOW vmregs[17]
[VM] PUSH_VMREG_32_LOW vmregs[17]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[16]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_32_LOW vmregs[17]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[17]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_32_LOW vmregs[1]
[VM] PUSH_VMREG_32_LOW vmregs[1]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[13]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_32_LOW vmregs[1]
[VM] PUSH_VMREG_32_LOW vmregs[1]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[18]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_32_LOW vmregs[1]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[1]
[VM] PUSH_IMM_64 0x1400fbc12
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] POP_REG_64 flags
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r15
[VM] POP_REG_64 r10
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r14
[VM] POP_REG_64 rax
[VM] POP_REG_64 r13
[VM] POP_REG_64 r8
[VM] POP_REG_64 rsi
[VM] POP_REG_64 rdi
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r11
[VM] POP_REG_64 r12
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r9
[VM] EXIT
[EXIT]
VmExit: 0x140001e60
[BLOCKS] 1
0x140001E60 =>
[UnsupportedInstruction] 0x1400fbc12
[VirtualStub] 0x1400fbc14
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x140001e60(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !tbaa !4, !alias.scope !22, !noalias !27
  %2 = add i64 %1, -8
  %3 = load i64, i64* %rbx, align 8, !alias.scope !65, !noalias !66
  %4 = inttoptr i64 %2 to i64*
  store i64 %3, i64* %4, align 1, !noalias !67
  %5 = add i64 %1, -568
  store i64 0, i64* %rcx, align 8, !tbaa !4, !alias.scope !68, !noalias !69
  store i64 0, i64* %rax, align 8, !tbaa !4, !alias.scope !70, !noalias !71
  store i64 %5, i64* %rsp, align 8, !tbaa !4, !alias.scope !22, !noalias !27
  ret i64 5369740306
}


Handling virtual stub: 0x1400fbc14
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1400fbc14
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 flags
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x140001e69
[VM] PUSH_VMREG_64 vmregs[19]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_IMM_32 0x1
[VM] PUSH_VMREG_32_LOW vmregs[13]
[VM] PUSH_VMREG_32_LOW vmregs[13]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[18]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_32_LOW vmregs[18]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x1400e9166
[VM] PUSH_IMM_64 0x140086a53
[VM] PUSH_VSP_64
[VM] PUSH_IMM_16 0x3
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x140086a4f
[VirtualBlock] 0x1400e9162
[WORKLIST]: 1
[EXPLORED]: 1
[VIRBLOCK]: 0x140086a4f
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x140001e69
[VM] PUSH_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[3]
[VM] PUSH_IMM_16 0x20
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] LOAD_SS_64
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[14]
[VM] PUSH_IMM_16 0x20
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] LOAD_SS_64
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x1
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] SHL_64
[VM] POP_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[10]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x1
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x50f2bbdabf157ab5
[VM] POP_VMREG_64 vmregs[6]
[VM] SHL_64
[VM] POP_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_16 0xb
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] SHRD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[2]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[22]
[VM] PUSH_IMM_16 0x20
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] LOAD_SS_64
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0x1
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] SHL_64
[VM] POP_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_16 0xd
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] SHRD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_IMM_64 0x140042dea
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_16 0x7
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] SHRD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[15]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x140042de6
[WORKLIST]: 1
[EXPLORED]: 2
[VIRBLOCK]: 0x1400e9162
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x140001e69
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0xa
[VM] PUSH_VMREG_32_LOW vmregs[10]
[VM] PUSH_VMREG_32_LOW vmregs[10]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[16]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_32_LOW vmregs[18]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0x14004328f
[VM] PUSH_IMM_64 0x140073e13
[VM] PUSH_VSP_64
[VM] PUSH_IMM_16 0x3
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0xffffffffffffff7f
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0xfffffffffffff7ff
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[17]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[23]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x14004328b
[VirtualBlock] 0x140073e0f
[WORKLIST]: 2
[EXPLORED]: 3
[VIRBLOCK]: 0x140042de6
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0x140001e69
[VM] PUSH_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0x14000f9b0
[VM] PUSH_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_32 0x104
[VM] POP_VMREG_32_LOW vmregs[1]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[1]
[VM] PUSH_IMM_64 0x20
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x1400fbc1e
[VM] PUSH_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x140002154
[VM] PUSH_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] POP_REG_64 flags
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r15
[VM] POP_REG_64 r10
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r14
[VM] POP_REG_64 rax
[VM] POP_REG_64 r13
[VM] POP_REG_64 r8
[VM] POP_REG_64 rsi
[VM] POP_REG_64 rdi
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r11
[VM] POP_REG_64 r12
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r9
[VM] EXIT
[EXIT]
VmExit: 0x140042de6
[WORKLIST]: 1
[EXPLORED]: 4
[VIRBLOCK]: 0x14004328b
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0x140001e69
[VM] PUSH_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[4]
[VM] PUSH_IMM_16 0x20
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x50f2bbdabf157ab5
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] LOAD_SS_64
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x1
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] SHL_64
[VM] POP_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[20]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[23]
[VM] PUSH_IMM_16 0x20
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] LOAD_SS_64
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0x1
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] SHL_64
[VM] POP_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_16 0x7
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] SHRD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] NOR_64
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[15]
[VM] PUSH_IMM_16 0x20
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] LOAD_SS_64
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0x1
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] SHL_64
[VM] POP_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_16 0xd
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] SHRD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_IMM_16 0x33
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] SHLD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0xaf0d4424ff112ba9
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x140042dea
[VM] JUMP_DEC
[UNCONDITIONAL]
VmNop: 0x14004328b
[VirtualBlock] 0x140042de6
[WORKLIST]: 1
[EXPLORED]: 5
[VIRBLOCK]: 0x140073e0f
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x140001e69
[VM] PUSH_VMREG_64 vmregs[5]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[14]
[VM] PUSH_IMM_16 0x20
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] PUSH_IMM_64 0x50f2bbdabf157ab5
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[7]
[VM] LOAD_SS_64
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x1
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[19]
[VM] PUSH_IMM_16 0x20
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] LOAD_SS_64
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x1
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] SHL_64
[VM] POP_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[8]
[VM] SHL_64
[VM] POP_VMREG_64 vmregs[3]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[11]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[11]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_16 0x35
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] SHLD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[10]
[VM] PUSH_IMM_16 0x20
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x4
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] LOAD_SS_64
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x1
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] SHL_64
[VM] POP_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_16 0x1f
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] SHRD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x140042dea
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_16 0x29
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] SHLD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0xffffffffffffff2b
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0xd4
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x140042de6
[BLOCKS] 6
0x140042DE6 =>
0x14004328B => 0x140042DE6
0x140073E0F => 0x140042DE6
0x140086A4F => 0x140042DE6
0x1400E9162 => 0x14004328B 0x140073E0F
0x1400FBC14 => 0x140086A4F 0x1400E9162
[FunctionCall] 0x140002154 (<not an import>)
[VirtualStub] 0x1400fbc1e
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1400fbc14(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !tbaa !4, !alias.scope !72, !noalias !77
  %2 = add i64 %1, -8
  %3 = load i64, i64* %rbx, align 8, !alias.scope !116, !noalias !117
  %4 = load i64, i64* %rax, align 8, !alias.scope !118, !noalias !119
  %5 = load i64, i64* %rcx, align 8, !alias.scope !120, !noalias !121
  %6 = load i64, i64* %rdx, align 8, !alias.scope !122, !noalias !123
  %7 = trunc i64 %4 to i32
  %8 = icmp eq i32 %7, 1
  %9 = and i64 %3, 4294967295
  %10 = and i64 %5, 4294967295
  %11 = shl nuw nsw i64 %10, 1
  %12 = and i64 %11, 4294967296
  %13 = shl nuw nsw i64 %9, 1
  %14 = and i64 %13, 4294967296
  %15 = and i64 %6, 4294967295
  %16 = shl nuw nsw i64 %15, 1
  %17 = and i64 %16, 4294967296
  %18 = sub nsw i64 %15, %17
  br i1 %8, label %37, label %19

19:                                               ; preds = %0
  %20 = icmp sgt i32 %7, 9, !souper !124
  br i1 %20, label %29, label %21

21:                                               ; preds = %19
  %22 = sub nsw i64 %14, %9
  %23 = add nsw i64 %22, 5832931015581334197
  %24 = sub nsw i64 %12, %10
  %25 = call i64 @llvm.fshl.i64(i64 %23, i64 %23, i64 57) #15
  %26 = add i64 %24, %25
  %27 = call i64 @llvm.fshl.i64(i64 %26, i64 %26, i64 51) #15
  %28 = xor i64 %27, %18
  br label %45

29:                                               ; preds = %19
  %30 = sub nsw i64 %10, %12
  %31 = sub nsw i64 %9, %14
  %32 = xor i64 %31, 5832931015581334197
  %33 = call i64 @llvm.fshl.i64(i64 %32, i64 %32, i64 53) #15
  %34 = add i64 %30, %33
  %35 = call i64 @llvm.fshl.i64(i64 %34, i64 %34, i64 33) #15
  %36 = sub i64 %35, %18
  br label %45

37:                                               ; preds = %0
  %38 = sub nsw i64 %12, %10
  %39 = sub nsw i64 %9, %14
  %40 = add nsw i64 %39, 5832931015581334197
  %41 = call i64 @llvm.fshl.i64(i64 %40, i64 %40, i64 53) #15
  %42 = add i64 %41, %38
  %43 = call i64 @llvm.fshl.i64(i64 %42, i64 %42, i64 51) #15
  %44 = add i64 %43, %18
  br label %45

45:                                               ; preds = %29, %21, %37
  %46 = phi i64 [ 57, %37 ], [ 41, %29 ], [ 51, %21 ]
  %47 = phi i64 [ %44, %37 ], [ %36, %29 ], [ %28, %21 ]
  %48 = phi i64 [ 5832931015581334197, %37 ], [ 5832931015581334197, %29 ], [ %3, %21 ]
  %49 = call i64 @llvm.fshl.i64(i64 %47, i64 %47, i64 %46) #15
  %50 = add i64 %1, 32
  %51 = inttoptr i64 %2 to i64*
  store i64 5369740318, i64* %51, align 1, !noalias !125
  store i64 260, i64* %rdx, align 8, !tbaa !4, !alias.scope !146, !noalias !147
  store i64 %50, i64* %rcx, align 8, !tbaa !4, !alias.scope !149, !noalias !150
  store i64 %18, i64* %rax, align 8, !tbaa !4, !alias.scope !151, !noalias !152
  store i64 5368773040, i64* %r8, align 8, !tbaa !4, !alias.scope !153, !noalias !154
  store i64 %48, i64* %rbx, align 8, !tbaa !4, !alias.scope !155, !noalias !156
  store i64 %49, i64* %r9, align 8, !tbaa !4, !alias.scope !157, !noalias !158
  store i64 %2, i64* %rsp, align 8, !tbaa !4, !alias.scope !159, !noalias !160
  ret i64 5368717652
}


Handling virtual stub: 0x1400fbc1e
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1400fbc1e
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 flags
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0x140001e69
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_IMM_64 0x140018640
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0x14000f828
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[1]
[VM] LOAD_DS_64
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x20
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_IMM_64 0x10
[VM] ADD_64
[VM] PUSH_IMM_32 0x40
[VM] POP_VMREG_32_LOW vmregs[6]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[6]
[VM] POP_VMREG_64 vmregs[22]
[VM] LOAD_DS_64
[VM] POP_VMREG_64 vmregs[2]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x1400fbc28
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x14000f290
[VM] PUSH_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] LOAD_DS_64
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] POP_REG_64 flags
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r15
[VM] POP_REG_64 r10
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r14
[VM] POP_REG_64 rax
[VM] POP_REG_64 r13
[VM] POP_REG_64 r8
[VM] POP_REG_64 rsi
[VM] POP_REG_64 rdi
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r11
[VM] POP_REG_64 r12
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r9
[VM] EXIT
[EXIT]
VmExit: 0x1400fbc1e
[BLOCKS] 1
0x1400FBC1E =>
[FunctionCall] 0x14000f290 (USER32.dll::MessageBoxW)
[VirtualStub] 0x1400fbc28
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1400fbc1e(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !alias.scope !161, !noalias !166
  %2 = add i64 %1, -8
  %3 = load i64, i64* inttoptr (i64 5368809024 to i64*), align 64, !noalias !204
  %4 = add i64 %3, 16
  %5 = inttoptr i64 %4 to i64*
  %6 = load i64, i64* %5, align 1, !noalias !204
  %7 = add i64 %1, 32
  %8 = inttoptr i64 %2 to i64*
  store i64 5369740328, i64* %8, align 1, !noalias !204
  %9 = load i64, i64* inttoptr (i64 5368771216 to i64*), align 16, !noalias !204
  store i64 %7, i64* %rdx, align 8, !tbaa !4, !alias.scope !205, !noalias !206
  store i64 %6, i64* %rcx, align 8, !tbaa !4, !alias.scope !207, !noalias !208
  store i64 5368772648, i64* %r8, align 8, !tbaa !4, !alias.scope !209, !noalias !210
  store i64 64, i64* %r9, align 8, !tbaa !4, !alias.scope !211, !noalias !212
  store i64 %2, i64* %rsp, align 8, !tbaa !4, !alias.scope !161, !noalias !166
  ret i64 %9
}


Handling virtual stub: 0x1400fbc28
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1400fbc28
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 flags
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0x140001e69
[VM] PUSH_VMREG_64 vmregs[2]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_IMM_64 0x230
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VSP_64
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] POP_REG_64 flags
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r15
[VM] POP_REG_64 r10
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r14
[VM] POP_REG_64 rax
[VM] POP_REG_64 r13
[VM] POP_REG_64 r8
[VM] POP_REG_64 rsi
[VM] POP_REG_64 rdi
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r11
[VM] POP_REG_64 r12
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r9
[VM] EXIT
[EXIT]
VmExit: 0x1400fbc28
[BLOCKS] 1
0x1400FBC28 =>
[FunctionReturn] ret
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1400fbc28(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !alias.scope !213, !noalias !218
  %2 = add i64 %1, 560
  %3 = inttoptr i64 %2 to i64*
  %4 = load i64, i64* %3, align 1, !noalias !256
  %5 = add i64 %1, 568
  store i64 %4, i64* %rbx, align 8, !tbaa !4, !alias.scope !257, !noalias !258
  %6 = inttoptr i64 %5 to i64*
  %7 = load i64, i64* %6, align 1, !noalias !256
  %8 = add i64 %1, 576
  store i64 %8, i64* %rsp, align 8, !tbaa !4, !alias.scope !213, !noalias !218
  ret i64 %7
}