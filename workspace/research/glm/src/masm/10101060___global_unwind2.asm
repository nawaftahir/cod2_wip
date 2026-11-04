.686
.MODEL FLAT, C
EXTRN sub_1010A73A:PROC
.CODE
__global_unwind2 PROC
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push ebp
    push 0
    push 0
    push 010101078h
    push dword ptr [ebp + 8]
    call sub_1010A73A
    pop ebp
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
__global_unwind2 ENDP
END
