.686
.MODEL FLAT, C
EXTRN sub_1010A73A:PROC
.CODE
__global_unwind2 PROC
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push edi
    push push ebp
    push push 0
    push push 0
    push push 010101078h
    push push dword ptr [ebp + 8]
    call sub_1010A73A
    pop pop ebp
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
__global_unwind2 ENDP
END
