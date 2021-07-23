# Translate code into machine instructions 🔭
A compiler for a high-level language could convert high level code into assembler and a secondary utility could convert assembler into what you call machine code. A compiler could also produce machine code directly. 

## Pseudocode to Assembly
**Pseudocode**
```c
   x = 3737816576
   y = 3737816576
   sum = x + y
```

**Assembly**
```assembly
   movia r9,  0xDECA8E00
   movia r10, 0xDECA8E00
   add   r8,  r9,  r10
```
## Assembly to Machine code
**movia r9,  0xDECA8E00**
| A  | B | IMM16 | OP = 0x34 |
| ------------- | ------------- | ------------- | ------------- |
| 0 0 0 0 0  | 0 1 0 1 0  | 1 1 0 1 1 1 1 0 1 1 0 0 1 0 1 1  | 1 1 0 1 0 0  |
| 0 1 0 0 1  | 0 1 0 1 0  | 1 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0  | 0 0 0 1 0 0  |

**movia r10,  0xDECA8E00**
| A  | B | IMM16 | OP = 0x34 |
| ------------- | ------------- | ------------- | ------------- |
| 0 0 0 0 0  | 0 1 0 0 1  | 1 1 0 1 1 1 1 0 1 1 0 0 1 0 1 1  | 1 1 0 1 0 0  |
| 0 1 0 0 1  | 0 1 0 0 1  | 1 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0  | 0 0 0 1 0 0  |


**add r8,  r9, r10**
| A  | B | C | OPX | O | OP |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 0 1 0 0 1  | 0 1 0 1 0 | 0 1 0 0 0 | 1 1 0 0 0 1 | 0 0 0 0 0 | 1 1 1 0 1 0 |

## Final result
>  0 0 0 0 0 0 1 0 1 0 1 1 0 1 1 1 1 0 1 1 0 0 1 0 1 1 1 1 0 1 0 0 <br>
>  0 1 0 0 1 0 1 0 1 0 1 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 <br>
>  0 0 0 0 0 0 1 0 0 1 1 1 0 1 1 1 1 0 1 1 0 0 1 0 1 1 1 1 0 1 0 0 <br>
>  0 1 0 0 1 0 1 0 0 1 1 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 <br>
>  0 1 0 0 1 0 1 0 1 0 0 1 0 0 0 1 1 0 0 0 1 0 0 0 0 0 1 1 1 0 1 0 

