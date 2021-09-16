 ./Lifter -h=VMProtectHelpers_64.bc -i=EMP.dll -f=0x130209c0
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
Handling virtual stub: 0x130209c0
[WORKLIST]: 0
[EXPLORED]: 0
[VIRBLOCK]: 0x130209c0
[VM] PUSH_IMM_64 KEY_STUB
[VM] PUSH_IMM_64 RET_ADDR
[VM] PUSH_REG_64 rdi
[VM] PUSH_REG_64 rdx
[VM] PUSH_REG_64 r14
[VM] PUSH_REG_64 r9
[VM] PUSH_REG_64 rbp
[VM] PUSH_REG_64 rcx
[VM] PUSH_REG_64 rsi
[VM] PUSH_REG_64 r10
[VM] PUSH_REG_64 r8
[VM] PUSH_REG_64 r11
[VM] PUSH_REG_64 r15
[VM] PUSH_REG_64 r13
[VM] PUSH_REG_64 r12
[VM] PUSH_REG_64 rbx
[VM] PUSH_REG_64 rax
[VM] PUSH_REG_64 flags
[VM] PUSH_IMM_64 REL_ADDR
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[21]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[26]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[27]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[28]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[29]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[6]
[VM] PUSH_VMREG_32_LOW vmregs[6]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[7]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_32_LOW vmregs[22]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0x815
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[10]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x130f6dc6
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[8]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_IMM_64 0x130f6eac
[VM] PUSH_VMREG_64 vmregs[7]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[3]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x130f6dc2
[VirtualBlock] 0x130f6ea8
[WORKLIST]: 1
[EXPLORED]: 1
[VIRBLOCK]: 0x130f6dc2
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x1318bcab
[VM] PUSH_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1318bca7
[WORKLIST]: 1
[EXPLORED]: 2
[VIRBLOCK]: 0x130f6ea8
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0x131905f4
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x131905f0
[WORKLIST]: 1
[EXPLORED]: 3
[VIRBLOCK]: 0x1318bca7
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[16]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_32 0x7ffe0030
[VM] POP_VMREG_32_LOW vmregs[18]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[18]
[VM] PUSH_IMM_32 0x7ffe0000
[VM] POP_VMREG_32_LOW vmregs[8]
[VM] PUSH_VMREG_32_LOW vmregs[8]
[VM] PUSH_VMREG_32_LOW vmregs[15]
[VM] PUSH_VMREG_32_LOW vmregs[15]
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[23]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_32_LOW vmregs[20]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x815
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[3]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[8]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0xfffffffffffffffe
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0x1318b932
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[3]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0x1318ba18
[VM] PUSH_VMREG_64 vmregs[23]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1318b92e
[VirtualBlock] 0x1318ba14
[WORKLIST]: 2
[EXPLORED]: 4
[VIRBLOCK]: 0x131905f0
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[0]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[15]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[20]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] POP_REG_64 rbp
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rsi
[VM] POP_REG_64 rax
[VM] POP_REG_64 r12
[VM] POP_REG_64 r14
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r13
[VM] POP_REG_64 r10
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r8
[VM] POP_REG_64 r11
[VM] POP_REG_64 rcx
[VM] POP_REG_64 flags
[VM] POP_REG_64 r15
[VM] POP_REG_64 r9
[VM] EXIT
[EXIT]
VmExit: 0x131905f0
[WORKLIST]: 1
[EXPLORED]: 5
[VIRBLOCK]: 0x1318b92e
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x1317a9f8
[VM] PUSH_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1317a9f4
[WORKLIST]: 1
[EXPLORED]: 6
[VIRBLOCK]: 0x1318ba14
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0x1319b237
[VM] PUSH_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1319b233
[WORKLIST]: 1
[EXPLORED]: 7
[VIRBLOCK]: 0x1317a9f4
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x7ffe0330
[VM] POP_VMREG_32_LOW vmregs[6]
[VM] PUSH_VMREG_32_LOW vmregs[9]
[VM] PUSH_VMREG_32_LOW vmregs[6]
[VM] PUSH_VMREG_32_LOW vmregs[6]
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[12]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_32_LOW vmregs[0]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0x815
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[6]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x1317a6a9
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[19]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_IMM_64 0x1317a78f
[VM] PUSH_VMREG_64 vmregs[18]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[15]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1317a6a5
[VirtualBlock] 0x1317a78b
[WORKLIST]: 2
[EXPLORED]: 8
[VIRBLOCK]: 0x1319b233
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_VMREG_32_LOW vmregs[6]
[VM] PUSH_VMREG_32_LOW vmregs[4]
[VM] PUSH_VMREG_32_LOW vmregs[4]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[7]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_32_LOW vmregs[13]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0xfffffffffffffffe
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x1319af1f
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_IMM_64 0x1319b005
[VM] PUSH_VMREG_64 vmregs[7]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[21]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1319af1b
[VirtualBlock] 0x1319b001
[WORKLIST]: 3
[EXPLORED]: 9
[VIRBLOCK]: 0x1317a6a5
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x13005000
[VM] PUSH_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x13005004
[WORKLIST]: 3
[EXPLORED]: 10
[VIRBLOCK]: 0x1317a78b
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x13182150
[VM] PUSH_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1318214c
[WORKLIST]: 3
[EXPLORED]: 11
[VIRBLOCK]: 0x1319af1b
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0x1317a9f8
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1317a9f4
[ProveAgain] 0x13005004
[ProveAgain] 0x1317a6a5
[ProveAgain] 0x1317a78b
[ProveAgain] 0x1317a9f4
[ProveAgain] 0x1318214c
[WORKLIST]: 3
[EXPLORED]: 9
[VIRBLOCK]: 0x1319b001
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x13005000
[VM] PUSH_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x13005004
[WORKLIST]: 3
[EXPLORED]: 10
[VIRBLOCK]: 0x13005004
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[3]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[24]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0x1
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rbx
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r9
[VM] POP_REG_64 r8
[VM] POP_REG_64 r12
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r14
[VM] POP_REG_64 r15
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r10
[VM] POP_REG_64 r11
[VM] POP_REG_64 rax
[VM] POP_REG_64 rcx
[VM] POP_REG_64 flags
[VM] POP_REG_64 r13
[VM] EXIT
[EXIT]
VmExit: 0x13005004
[WORKLIST]: 2
[EXPLORED]: 11
[VIRBLOCK]: 0x1318214c
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x7ffe0008
[VM] POP_VMREG_32_LOW vmregs[17]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[17]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] LOAD_DS_32
[VM] POP_VMREG_32_LOW vmregs[3]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[3]
[VM] PUSH_VMREG_32_LOW vmregs[21]
[VM] PUSH_VMREG_32_LOW vmregs[21]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[7]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_32_LOW vmregs[1]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x815
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_32_HIGH vmregs[3]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[15]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x13181df4
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[16]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0x13181eda
[VM] PUSH_VMREG_64 vmregs[15]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[19]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x13181df0
[VirtualBlock] 0x13181ed6
[WORKLIST]: 3
[EXPLORED]: 12
[VIRBLOCK]: 0x1317a9f4
[VirtualBlock] 0x1317a6a5
[VirtualBlock] 0x1317a78b
[WORKLIST]: 3
[EXPLORED]: 13
[VIRBLOCK]: 0x13181df0
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0x131151f0
[VM] PUSH_VMREG_64 vmregs[11]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x131151ec
[WORKLIST]: 3
[EXPLORED]: 14
[VIRBLOCK]: 0x13181ed6
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0x1313424d
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x13134249
[WORKLIST]: 3
[EXPLORED]: 15
[VIRBLOCK]: 0x1317a6a5
[VirtualBlock] 0x13005004
[WORKLIST]: 3
[EXPLORED]: 16
[VIRBLOCK]: 0x1317a78b
[VirtualBlock] 0x1318214c
[WORKLIST]: 3
[EXPLORED]: 17
[VIRBLOCK]: 0x131151ec
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x7ffe0018
[VM] POP_VMREG_32_LOW vmregs[19]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[19]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] LOAD_DS_32
[VM] POP_VMREG_32_LOW vmregs[3]
[VM] PUSH_VMREG_32_LOW vmregs[3]
[VM] PUSH_VMREG_32_LOW vmregs[5]
[VM] PUSH_VMREG_32_LOW vmregs[5]
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[4]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_32_LOW vmregs[4]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0x815
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[3]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[16]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x13114e91
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[7]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0x13114f77
[VM] PUSH_VMREG_64 vmregs[18]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x13114e8d
[VirtualBlock] 0x13114f73
[WORKLIST]: 4
[EXPLORED]: 18
[VIRBLOCK]: 0x13134249
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[24]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x1
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] POP_REG_64 rbp
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rsi
[VM] POP_REG_64 rax
[VM] POP_REG_64 r12
[VM] POP_REG_64 r14
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r13
[VM] POP_REG_64 r10
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r8
[VM] POP_REG_64 r11
[VM] POP_REG_64 rcx
[VM] POP_REG_64 flags
[VM] POP_REG_64 r15
[VM] POP_REG_64 r9
[VM] EXIT
[EXIT]
VmExit: 0x13134249
[WORKLIST]: 1
[EXPLORED]: 19
[VIRBLOCK]: 0x13114e8d
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x13139ac4
[VM] PUSH_VMREG_64 vmregs[21]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x13139ac8
[WORKLIST]: 1
[EXPLORED]: 20
[VIRBLOCK]: 0x13114f73
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x13126e21
[VM] PUSH_VMREG_64 vmregs[18]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x13126e1d
[WORKLIST]: 1
[EXPLORED]: 21
[VIRBLOCK]: 0x13139ac8
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x7ffe0020
[VM] POP_VMREG_32_LOW vmregs[4]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[4]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] LOAD_DS_32
[VM] POP_VMREG_32_LOW vmregs[10]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[10]
[VM] PUSH_VMREG_32_LOW vmregs[15]
[VM] PUSH_VMREG_32_LOW vmregs[15]
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[11]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_32_LOW vmregs[6]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x815
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_32_HIGH vmregs[10]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[17]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x13139e20
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[7]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0x13139d3a
[VM] PUSH_VMREG_64 vmregs[11]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x13139d3e
[VirtualBlock] 0x13139e24
[WORKLIST]: 2
[EXPLORED]: 22
[VIRBLOCK]: 0x13126e1d
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[23]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[24]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_64 0x1
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] POP_REG_64 r14
[VM] POP_REG_64 r15
[VM] POP_REG_64 r11
[VM] POP_REG_64 rbx
[VM] POP_REG_64 flags
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r9
[VM] POP_REG_64 r10
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rbp
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r12
[VM] POP_REG_64 r13
[VM] POP_REG_64 r8
[VM] POP_REG_64 rax
[VM] POP_REG_64 rsi
[VM] EXIT
[EXIT]
VmExit: 0x13126e1d
[WORKLIST]: 1
[EXPLORED]: 23
[VIRBLOCK]: 0x13139d3e
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_IMM_64 0x13133564
[VM] PUSH_VMREG_64 vmregs[16]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x13133560
[WORKLIST]: 1
[EXPLORED]: 24
[VIRBLOCK]: 0x13139e24
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0x1310db5a
[VM] PUSH_VMREG_64 vmregs[19]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x1310db5e
[WORKLIST]: 1
[EXPLORED]: 25
[VIRBLOCK]: 0x13133560
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[24]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_64 0x1
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] POP_REG_64 r14
[VM] POP_REG_64 r15
[VM] POP_REG_64 r11
[VM] POP_REG_64 rbx
[VM] POP_REG_64 flags
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r9
[VM] POP_REG_64 r10
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rbp
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r12
[VM] POP_REG_64 r13
[VM] POP_REG_64 r8
[VM] POP_REG_64 rax
[VM] POP_REG_64 rsi
[VM] EXIT
[EXIT]
VmExit: 0x13133560
[WORKLIST]: 0
[EXPLORED]: 26
[VIRBLOCK]: 0x1310db5e
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x7ffe000c
[VM] POP_VMREG_32_LOW vmregs[3]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[3]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] LOAD_DS_32
[VM] POP_VMREG_32_LOW vmregs[10]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[10]
[VM] PUSH_VMREG_32_LOW vmregs[13]
[VM] PUSH_VMREG_32_LOW vmregs[13]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[11]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_32_LOW vmregs[11]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0x815
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0x815
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[0]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_32_HIGH vmregs[10]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_IMM_64 0x1310deb6
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[8]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0x1310ddd0
[VM] PUSH_VMREG_64 vmregs[0]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x1310ddd4
[VirtualBlock] 0x1310deba
[WORKLIST]: 1
[EXPLORED]: 27
[VIRBLOCK]: 0x1310ddd4
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0x13171014
[VM] PUSH_VMREG_64 vmregs[2]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x13171018
[WORKLIST]: 1
[EXPLORED]: 28
[VIRBLOCK]: 0x1310deba
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[19]
[VM] PUSH_IMM_64 0x1318721b
[VM] PUSH_VMREG_64 vmregs[17]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x13187217
[WORKLIST]: 1
[EXPLORED]: 29
[VIRBLOCK]: 0x13171018
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[13]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[24]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x1
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] POP_REG_64 rax
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r15
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r10
[VM] POP_REG_64 flags
[VM] POP_REG_64 r14
[VM] POP_REG_64 r8
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r13
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r12
[VM] POP_REG_64 r11
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r9
[VM] POP_REG_64 rbx
[VM] EXIT
[EXIT]
VmExit: 0x13171018
[WORKLIST]: 0
[EXPLORED]: 30
[VIRBLOCK]: 0x13187217
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x7ffe0024
[VM] POP_VMREG_32_LOW vmregs[1]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[1]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] LOAD_DS_32
[VM] POP_VMREG_32_LOW vmregs[11]
[VM] PUSH_VMREG_32_LOW vmregs[11]
[VM] PUSH_VMREG_32_LOW vmregs[7]
[VM] PUSH_VMREG_32_LOW vmregs[7]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[6]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_32_LOW vmregs[6]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_IMM_64 0x815
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[11]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[20]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x13186ebc
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[20]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_IMM_64 0x13186fa2
[VM] PUSH_VMREG_64 vmregs[13]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x13186eb8
[VirtualBlock] 0x13186f9e
[WORKLIST]: 1
[EXPLORED]: 31
[VIRBLOCK]: 0x13186eb8
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_IMM_64 0x131304bb
[VM] PUSH_VMREG_64 vmregs[8]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x131304b7
[WORKLIST]: 1
[EXPLORED]: 32
[VIRBLOCK]: 0x13186f9e
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0x1311f990
[VM] PUSH_VMREG_64 vmregs[14]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1311f98c
[WORKLIST]: 1
[EXPLORED]: 33
[VIRBLOCK]: 0x131304b7
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[10]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x7ffe0014
[VM] POP_VMREG_32_LOW vmregs[14]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[14]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] LOAD_DS_32
[VM] POP_VMREG_32_LOW vmregs[1]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[1]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] NOR_32
[VM] POP_VMREG_64 vmregs[4]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_32_LOW vmregs[3]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x815
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[12]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[16]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_32_HIGH vmregs[1]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x1313015c
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[3]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_IMM_64 0x13130242
[VM] PUSH_VMREG_64 vmregs[4]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[23]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x13130158
[VirtualBlock] 0x1313023e
[WORKLIST]: 2
[EXPLORED]: 34
[VIRBLOCK]: 0x1311f98c
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[11]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[15]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[24]
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[3]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_IMM_64 0x1
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[6]
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
VmExit: 0x1311f98c
[WORKLIST]: 1
[EXPLORED]: 35
[VIRBLOCK]: 0x13130158
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x1315173c
[VM] PUSH_VMREG_64 vmregs[2]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x13151740
[WORKLIST]: 1
[EXPLORED]: 36
[VIRBLOCK]: 0x1313023e
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[2]
[VM] PUSH_IMM_64 0x13180735
[VM] PUSH_VMREG_64 vmregs[12]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x13180731
[WORKLIST]: 1
[EXPLORED]: 37
[VIRBLOCK]: 0x13151740
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[0]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[24]
[VM] PUSH_IMM_32 0x7ffe0330
[VM] POP_VMREG_32_LOW vmregs[17]
[VM] PUSH_IMM_32 0x0
[VM] POP_VMREG_32_HIGH vmregs[17]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] LOAD_DS_32
[VM] POP_VMREG_32_LOW vmregs[14]
[VM] PUSH_IMM_32 0x0
[VM] PUSH_VMREG_32_LOW vmregs[14]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] PUSH_VMREG_32_LOW vmregs[20]
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[8]
[VM] ADD_32
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_VSP_64
[VM] LOAD_SS_32
[VM] NAND_32
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_32_LOW vmregs[8]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_IMM_64 0xfffffffffffff7ea
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[4]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_32_HIGH vmregs[14]
[VM] PUSH_IMM_16 0x6
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_IMM_64 0xffffffffffffffbf
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[18]
[VM] SHR_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0xffffffffffffffff
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_IMM_64 0x13151a98
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[9]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[9]
[VM] PUSH_IMM_64 0x131519b2
[VM] PUSH_VMREG_64 vmregs[4]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VSP_64
[VM] LOAD_SS_64
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[9]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x131519b6
[VirtualBlock] 0x13151a9c
[WORKLIST]: 2
[EXPLORED]: 38
[VIRBLOCK]: 0x13180731
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[22]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[20]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[24]
[VM] POP_VMREG_64 vmregs[18]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[17]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_IMM_64 0x1
[VM] POP_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] POP_REG_64 rbp
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rsi
[VM] POP_REG_64 rax
[VM] POP_REG_64 r12
[VM] POP_REG_64 r14
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r13
[VM] POP_REG_64 r10
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r8
[VM] POP_REG_64 r11
[VM] POP_REG_64 rcx
[VM] POP_REG_64 flags
[VM] POP_REG_64 r15
[VM] POP_REG_64 r9
[VM] EXIT
[EXIT]
VmExit: 0x13180731
[WORKLIST]: 1
[EXPLORED]: 39
[VIRBLOCK]: 0x131519b6
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[16]
[VM] PUSH_IMM_64 0x1311d4ed
[VM] PUSH_VMREG_64 vmregs[22]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[21]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] JUMP_DEC
[UNKNOWN]
[VirtualBlock] 0x1311d4e9
[WORKLIST]: 1
[EXPLORED]: 40
[VIRBLOCK]: 0x13151a9c
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[14]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[15]
[VM] PUSH_IMM_64 0x1311ddb8
[VM] PUSH_VMREG_64 vmregs[0]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[19]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[16]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] JUMP_INC
[UNKNOWN]
[VirtualBlock] 0x1311ddbc
[WORKLIST]: 1
[EXPLORED]: 41
[VIRBLOCK]: 0x1311d4e9
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[11]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[13]
[VM] POP_VMREG_64 vmregs[6]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[7]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[24]
[VM] POP_VMREG_64 vmregs[4]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[1]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[13]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[21]
[VM] PUSH_IMM_64 0x1
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[11]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[15]
[VM] PUSH_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] POP_REG_64 rbp
[VM] POP_REG_64 rdx
[VM] POP_REG_64 rsi
[VM] POP_REG_64 rax
[VM] POP_REG_64 r12
[VM] POP_REG_64 r14
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r13
[VM] POP_REG_64 r10
[VM] POP_REG_64 rbx
[VM] POP_REG_64 r8
[VM] POP_REG_64 r11
[VM] POP_REG_64 rcx
[VM] POP_REG_64 flags
[VM] POP_REG_64 r15
[VM] POP_REG_64 r9
[VM] EXIT
[EXIT]
VmExit: 0x1311d4e9
[WORKLIST]: 0
[EXPLORED]: 42
[VIRBLOCK]: 0x1311ddbc
[VM] POP_VMREG_64 vmregs[16]
[VM] POP_VMREG_64 vmregs[1]
[VM] POP_VMREG_64 vmregs[10]
[VM] POP_VMREG_64 vmregs[21]
[VM] POP_VMREG_64 vmregs[15]
[VM] POP_VMREG_64 vmregs[9]
[VM] POP_VMREG_64 vmregs[3]
[VM] POP_VMREG_64 vmregs[12]
[VM] POP_VMREG_64 vmregs[8]
[VM] POP_VMREG_64 vmregs[17]
[VM] POP_VMREG_64 vmregs[18]
[VM] POP_VMREG_64 vmregs[22]
[VM] POP_VMREG_64 vmregs[5]
[VM] POP_VMREG_64 vmregs[2]
[VM] POP_VMREG_64 vmregs[20]
[VM] POP_VMREG_64 vmregs[0]
[VM] POP_VMREG_64 vmregs[4]
[VM] POP_VMREG_64 vmregs[7]
[VM] POP_VMREG_64 vmregs[13]
[VM] PUSH_IMM_64 0x0
[VM] PUSH_VMREG_64 vmregs[16]
[VM] ADD_64
[VM] POP_VMREG_64 vmregs[19]
[VM] POP_VMREG_64 vmregs[24]
[VM] POP_VMREG_64 vmregs[14]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] POP_VMREG_64 vmregs[7]
[VM] PUSH_VSP_64
[VM] POP_VMREG_64 vmregs[25]
[VM] PUSH_VMREG_64 vmregs[7]
[VM] PUSH_VMREG_64 vmregs[8]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[6]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] NAND_64
[VM] POP_VMREG_64 vmregs[13]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] PUSH_VMREG_64 vmregs[2]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[13]
[VM] NOR_64
[VM] POP_VMREG_64 vmregs[23]
[VM] POP_VMREG_64 vmregs[5]
[VM] PUSH_VMREG_64 vmregs[3]
[VM] PUSH_VMREG_64 vmregs[22]
[VM] PUSH_VMREG_64 vmregs[1]
[VM] PUSH_VMREG_64 vmregs[14]
[VM] PUSH_VMREG_64 vmregs[20]
[VM] PUSH_VMREG_64 vmregs[4]
[VM] PUSH_VMREG_64 vmregs[0]
[VM] PUSH_VMREG_64 vmregs[10]
[VM] PUSH_VMREG_64 vmregs[23]
[VM] PUSH_VMREG_64 vmregs[12]
[VM] PUSH_VMREG_64 vmregs[17]
[VM] PUSH_VMREG_64 vmregs[9]
[VM] PUSH_VMREG_64 vmregs[18]
[VM] PUSH_VMREG_64 vmregs[5]
[VM] POP_REG_64 rax
[VM] POP_REG_64 rsi
[VM] POP_REG_64 r15
[VM] POP_REG_64 rbp
[VM] POP_REG_64 r10
[VM] POP_REG_64 flags
[VM] POP_REG_64 r14
[VM] POP_REG_64 r8
[VM] POP_REG_64 rdx
[VM] POP_REG_64 r13
[VM] POP_REG_64 rcx
[VM] POP_REG_64 r12
[VM] POP_REG_64 r11
[VM] POP_REG_64 rdi
[VM] POP_REG_64 r9
[VM] POP_REG_64 rbx
[VM] EXIT
[EXIT]
VmExit: 0x1311ddbc
[BLOCKS] 43
0x13005004 =>
0x130209C0 => 0x130F6DC2 0x130F6EA8
0x130F6DC2 => 0x1318BCA7
0x130F6EA8 => 0x131905F0
0x1310DB5E => 0x1310DDD4 0x1310DEBA
0x1310DDD4 => 0x13171018
0x1310DEBA => 0x13187217
0x13114E8D => 0x13139AC8
0x13114F73 => 0x13126E1D
0x131151EC => 0x13114E8D 0x13114F73
0x1311D4E9 =>
0x1311DDBC =>
0x1311F98C =>
0x13126E1D =>
0x13130158 => 0x13151740
0x1313023E => 0x13180731
0x131304B7 => 0x13130158 0x1313023E
0x13133560 =>
0x13134249 =>
0x13139AC8 => 0x13139D3E 0x13139E24
0x13139D3E => 0x13133560
0x13139E24 => 0x1310DB5E
0x13151740 => 0x131519B6 0x13151A9C
0x131519B6 => 0x1311D4E9
0x13151A9C => 0x1311DDBC
0x13171018 =>
0x1317A6A5 => 0x13005004
0x1317A78B => 0x1318214C
0x1317A9F4 => 0x1317A6A5 0x1317A78B
0x13180731 =>
0x13181DF0 => 0x131151EC
0x13181ED6 => 0x13134249
0x1318214C => 0x13181DF0 0x13181ED6
0x13186EB8 => 0x131304B7
0x13186F9E => 0x1311F98C
0x13187217 => 0x13186EB8 0x13186F9E
0x1318B92E => 0x1317A9F4
0x1318BA14 => 0x1319B233
0x1318BCA7 => 0x1318B92E 0x1318BA14
0x131905F0 =>
0x1319AF1B => 0x1317A9F4
0x1319B001 => 0x13005004
0x1319B233 => 0x1319AF1B 0x1319B001
[FunctionReturn] ret
[FunctionReturn] ret
[FunctionReturn] ret
[FunctionReturn] ret
[FunctionReturn] ret
[FunctionReturn] ret
[FunctionReturn] ret
[FunctionReturn] ret
[FunctionReturn] ret
[FunctionReturn] ret
; Function Attrs: alwaysinline mustprogress nounwind ssp uwtable
define dso_local i64 @F_0x130209c0(i64* noalias nonnull align 8 dereferenceable(8) %rax, i64* noalias nonnull align 8 dereferenceable(8) %rbx, i64* noalias nonnull align 8 dereferenceable(8) %rcx, i64* noalias nonnull align 8 dereferenceable(8) %rdx, i64* noalias nonnull align 8 dereferenceable(8) %rsi, i64* noalias nonnull align 8 dereferenceable(8) %rdi, i64* noalias nonnull align 8 dereferenceable(8) %rbp, i64* noalias nonnull align 8 dereferenceable(8) %rsp, i64* noalias nonnull align 8 dereferenceable(8) %r8, i64* noalias nonnull align 8 dereferenceable(8) %r9, i64* noalias nonnull align 8 dereferenceable(8) %r10, i64* noalias nonnull align 8 dereferenceable(8) %r11, i64* noalias nonnull align 8 dereferenceable(8) %r12, i64* noalias nonnull align 8 dereferenceable(8) %r13, i64* noalias nonnull align 8 dereferenceable(8) %r14, i64* noalias nonnull align 8 dereferenceable(8) %r15, i64* noalias nonnull align 8 dereferenceable(8) %flags, i64 %KEY_STUB, i64 %RET_ADDR, i64 %REL_ADDR) #2 {
  %1 = load i64, i64* %rsp, align 8, !tbaa !4, !alias.scope !22, !noalias !27
  %2 = load i64, i64* %rax, align 8, !alias.scope !66, !noalias !67
  %3 = trunc i64 %2 to i32
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %33, label %5

5:                                                ; preds = %0
  %6 = icmp ult i32 %3, 2147352576, !souper !68
  br i1 %6, label %11, label %7

7:                                                ; preds = %5
  %8 = icmp ult i32 %3, 2147352624
  %9 = icmp eq i32 %3, 2147353392
  %10 = or i1 %8, %9
  br i1 %10, label %33, label %11

11:                                               ; preds = %5, %7
  %12 = load i32, i32* inttoptr (i64 2147352584 to i32*), align 8, !noalias !69
  %13 = icmp eq i32 %12, %3, !souper !68
  br i1 %13, label %33, label %14

14:                                               ; preds = %11
  %15 = load i32, i32* inttoptr (i64 2147352600 to i32*), align 8, !noalias !74
  %16 = icmp eq i32 %15, %3, !souper !68
  br i1 %16, label %33, label %17

17:                                               ; preds = %14
  %18 = load i32, i32* inttoptr (i64 2147352608 to i32*), align 32, !noalias !79
  %19 = icmp eq i32 %18, %3, !souper !68
  br i1 %19, label %33, label %20

20:                                               ; preds = %17
  %21 = load i32, i32* inttoptr (i64 2147352588 to i32*), align 4, !noalias !84
  %22 = icmp eq i32 %21, %3, !souper !68
  br i1 %22, label %33, label %23

23:                                               ; preds = %20
  %24 = load i32, i32* inttoptr (i64 2147352612 to i32*), align 4, !noalias !89
  %25 = icmp eq i32 %24, %3, !souper !68
  br i1 %25, label %33, label %26

26:                                               ; preds = %23
  %27 = load i32, i32* inttoptr (i64 2147352596 to i32*), align 4, !noalias !94
  %28 = icmp eq i32 %27, %3, !souper !68
  br i1 %28, label %33, label %29

29:                                               ; preds = %26
  %30 = load i32, i32* inttoptr (i64 2147353392 to i32*), align 16, !noalias !99
  %31 = icmp eq i32 %30, %3, !souper !68
  %32 = zext i1 %31 to i64
  br label %33

33:                                               ; preds = %7, %0, %29, %26, %23, %20, %17, %14, %11
  %34 = phi i64 [ %32, %29 ], [ 1, %26 ], [ 1, %23 ], [ 1, %20 ], [ 1, %17 ], [ 1, %14 ], [ 1, %11 ], [ 1, %7 ], [ 0, %0 ]
  store i64 %34, i64* %rax, align 8, !tbaa !4, !alias.scope !104, !noalias !105
  %35 = inttoptr i64 %1 to i64*
  %36 = load i64, i64* %35, align 1, !noalias !106
  %37 = add i64 %1, 8
  store i64 %37, i64* %rsp, align 8, !tbaa !4, !alias.scope !107, !noalias !108
  ret i64 %36
}