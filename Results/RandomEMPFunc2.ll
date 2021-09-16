 ./Lifter -h=VMProtectHelpers_64.bc -i=EMP.dll -f=0x13001334
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
[+] Opening: EMP.dll
[+] Helpers: VMProtectHelpers_64.bc
[*] COFF binary detected
[i] Parsing: .text
[i] Parsing: .EMP
[i] Parsing: .EMP1
[*] Discovered VmEnter(s):
  - 0x13001334
  - 0x1301d000
  - 0x1301d300
  - 0x1301d900
  - 0x1301dba0
  - 0x1301e800
  - 0x1301ea00
  - 0x1301f300
  - 0x1301fb00
  - 0x13020000
  - 0x130202b0
  - 0x13020700
  - 0x13020760
  - 0x130207c0
  - 0x130209c0
  - 0x13020da0
  - 0x13021340
  - 0x13021600
  - 0x13021c00
  - 0x13021c1d
  - 0x13021c3a
  - 0x13021c57
  - 0x13022122
  - 0x13022420
  - 0x13022950
  - 0x13022ac0
  - 0x13022ba0
  - 0x13022d90
  - 0x13022ea0
  - 0x13023100
  - 0x13023750
  - 0x130238a0
  - 0x130239a0
  - 0x130239b1
  - 0x130239dd
  - 0x13023aa0
  - 0x13023b30
  - 0x13023b44
  - 0x13023c00
  - 0x13024e00
  - 0x130253a0
  - 0x13025cc0
  - 0x13025ea0
  - 0x13026400
  - 0x130277b0
  - 0x13028100
  - 0x130281b0
  - 0x130282a0
  - 0x13028f00
  - 0x130292e2
  - 0x13029500
  - 0x1302a300
  - 0x1302ac00
  - 0x1302ad00
  - 0x1302b100
  - 0x13030800
  - 0x13030ac1
  - 0x13036ba0
  - 0x13037500
  - 0x13037587
  - 0x1303770a
  - 0x13037742
  - 0x13037783
  - 0x130377f3
  - 0x1303782a
  - 0x13037854
  - 0x1303788a
  - 0x130378d9
  - 0x1303791b
  - 0x1303796f
  - 0x1303799e
  - 0x130379d4
  - 0x13037a5a
  - 0x13037a97
  - 0x13037acd
  - 0x13037afd
  - 0x13037b3a
  - 0x13038c00
  - 0x1303a100
Handling virtual stub: 0x13001334
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x13001334
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 r13
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x13001334
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] STORE_SS_64
[VM] PUSH_IMM_64 0x13001339
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_IMM_64 0x10
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] STORE_SS_64
[VM] PUSH_IMM_64 0x1300133e
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_64 0x1300133f
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0x20
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x10
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VSP_64
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_64 0x13001343
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x1
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[10]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_32_LOW vmregs[18]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[10]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] POP_VMREG_32_LOW vmregs[23]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[23]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[17]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_IMM_64 0x1317c155
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[22]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x1315452d
[VM] PUSH_VMREG_64 vmregs[12]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x13154531
[VirtualBlock] 0x1317c159
[WORKLIST]: 1
[EXPLORED]: 1
[VIRBLOCK]: 0x13154531
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x13001343
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_64 0x1329e63f
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x131550d2
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[29]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x131550d6
[WORKLIST]: 1
[EXPLORED]: 2
[VIRBLOCK]: 0x1317c159
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0x130fe15c
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x130fe158
[WORKLIST]: 1
[EXPLORED]: 3
[VIRBLOCK]: 0x131550d6
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x1bfe1
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0x1315519b
[VM] JUMP_INC
[UNCONDITIONAL]
VmNop: 0x131550d6
[VirtualCall] 0x1315519f => 0x1301d000
[WORKLIST]: 0
[EXPLORED]: 4
[VIRBLOCK]: 0x130fe158
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x5ccfb
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x130fe093
[VM] JUMP_DEC
[UNCONDITIONAL]
VmNop: 0x130fe158
[VirtualBlock] 0x130fe08f
[WORKLIST]: 0
[EXPLORED]: 5
[VIRBLOCK]: 0x130fe08f
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0x13001343
[VM] PUSH_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_32_LOW vmregs[14]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[14]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x30
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[23]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x38
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0x20
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VSP_64
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_64 0x13001200
[VM] PUSH_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r10
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r11
[VM] POP_REG_64 flags
[VM] POP_REG_64 r15
[VM] POP_REG_64 r9
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rax
[VM] POP_REG_64 r14
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r13
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r12
[VM] POP_REG_64 r8
[VM] POP_REG_64 rdi
[VM] EXIT
[EXIT]
VmExit: 0x130fe08f
[BLOCKS] 6
0x13001334 => 0x13154531 0x1317C159
0x130FE08F =>
0x130FE158 => 0x130FE08F
0x13154531 => 0x131550D6
0x131550D6 =>
0x1317C159 => 0x130FE158
[FunctionCall] 0x1301d000 (<not an import>)
[FunctionJump] 0x13001200
[VirtualStub] 0x1329e63f
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x13001334(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !alias.scope !11, !noalias !16
  %2 = add i64 %1, -8
  %3 = load i64, i64* %rsi, align 8, !alias.scope !55, !noalias !56
  %4 = load i64, i64* %rcx, align 8, !alias.scope !57, !noalias !58
  %5 = load i64, i64* %rdx, align 8, !alias.scope !59, !noalias !60
  %6 = load i64, i64* %r8, align 8, !alias.scope !61, !noalias !62
  %7 = load i64, i64* %rbx, align 8, !alias.scope !63, !noalias !64
  %8 = load i64, i64* %rdi, align 8, !alias.scope !65, !noalias !66
  %9 = add i64 %1, 8
  %10 = inttoptr i64 %9 to i64*
  store i64 %7, i64* %10, align 1, !noalias !67
  %11 = add i64 %1, 16
  %12 = inttoptr i64 %11 to i64*
  store i64 %3, i64* %12, align 1, !noalias !67
  %13 = inttoptr i64 %2 to i64*
  store i64 %8, i64* %13, align 1, !noalias !67
  %14 = add i64 %1, -48
  %15 = trunc i64 %5 to i32
  %16 = icmp eq i32 %15, 1
  %17 = and i64 %5, 4294967295
  br i1 %16, label %19, label %18

18:                                               ; preds = %0
  store i64 %17, i64* %rdx, align 8, !tbaa !4, !alias.scope !68, !noalias !71
  br label %21

19:                                               ; preds = %0
  %20 = inttoptr i64 %14 to i64*
  store i64 321513023, i64* %20, align 1, !noalias !91
  store i64 %14, i64* %rsp, align 8, !tbaa !4, !alias.scope !96, !noalias !97
  store i64 %6, i64* %rdi, align 8, !tbaa !4, !alias.scope !99, !noalias !102
  store i64 %4, i64* %rsi, align 8, !tbaa !4, !alias.scope !122, !noalias !123
  store i64 %17, i64* %rbx, align 8, !tbaa !4, !alias.scope !124, !noalias !125
  br label %21

21:                                               ; preds = %19, %18
  %22 = phi i64 [ 318771712, %18 ], [ 318885888, %19 ]
  ret i64 %22
}


Handling virtual stub: 0x1329e63f
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x1329e63f
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 flags
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 rcx
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0x13001343
[VM] PUSH_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_32_LOW vmregs[14]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[14]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x30
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[23]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x38
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] LOAD_SS_64
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0x20
[VM] PUSH_VSP_64
[VM] PUSH_IMM_64 0x8
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VSP_64
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_64 0x13001200
[VM] PUSH_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r10
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r11
[VM] POP_REG_64 flags
[VM] POP_REG_64 r15
[VM] POP_REG_64 r9
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rax
[VM] POP_REG_64 r14
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r13
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r12
[VM] POP_REG_64 r8
[VM] POP_REG_64 rdi
[VM] EXIT
[EXIT]
VmExit: 0x1329e63f
[BLOCKS] 1
0x1329E63F =>
[FunctionJump] 0x13001200
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x1329e63f(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !tbaa !4, !alias.scope !126, !noalias !131
  %2 = load i64, i64* %rdi, align 8, !alias.scope !169, !noalias !170
  %3 = load i64, i64* %rbx, align 8, !alias.scope !171, !noalias !172
  %4 = load i64, i64* %rsi, align 8, !alias.scope !173, !noalias !174
  %5 = and i64 %3, 4294967295
  %6 = add i64 %1, 48
  %7 = inttoptr i64 %6 to i64*
  %8 = load i64, i64* %7, align 1, !noalias !175
  %9 = add i64 %1, 56
  %10 = inttoptr i64 %9 to i64*
  %11 = load i64, i64* %10, align 1, !noalias !175
  %12 = add i64 %1, 32
  %13 = inttoptr i64 %12 to i64*
  %14 = load i64, i64* %13, align 1, !noalias !175
  %15 = add i64 %1, 40
  store i64 %4, i64* %rcx, align 8, !tbaa !4, !alias.scope !176, !noalias !177
  store i64 %5, i64* %rdx, align 8, !tbaa !4, !alias.scope !178, !noalias !179
  store i64 %11, i64* %rsi, align 8, !tbaa !4, !alias.scope !173, !noalias !174
  store i64 %8, i64* %rbx, align 8, !tbaa !4, !alias.scope !171, !noalias !172
  store i64 %2, i64* %r8, align 8, !tbaa !4, !alias.scope !180, !noalias !181
  store i64 %14, i64* %rdi, align 8, !tbaa !4, !alias.scope !169, !noalias !170
  store i64 %15, i64* %rsp, align 8, !tbaa !4, !alias.scope !126, !noalias !131
  ret i64 318771712
}