# TicklingVMProtect

The code is meant to be used as a learning resource while following the _Tickling VMProtect with LLVM_ [1](https://secret.club/2021/09/08/vmprotect-llvm-lifting-1.html) [2](https://secret.club/2021/09/08/vmprotect-llvm-lifting-2.html) [3](https://secret.club/2021/09/08/vmprotect-llvm-lifting-3.html) series.

- The C++ helper code is a high-level representation of the structures mentioned in the posts and described by previous public research.
- The LLVM passes are generic implementations of the passes described in the posts, except for the pass meant to simplify the VMProtect-specific jump trick, which seems to be deprecated since years.
