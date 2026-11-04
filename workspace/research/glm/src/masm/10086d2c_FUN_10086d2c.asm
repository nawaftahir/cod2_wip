.686
.MODEL FLAT, C
EXTRN sub_100F787F:PROC
.CODE
FUN_10086d2c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    test byte ptr [ebp + 8], 1
    push esi
    mov esi, ecx
    mov dword ptr [esi], 010110440h
    je L0
    push esi
    call sub_100F787F
    pop ecx
L0:
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_10086d2c ENDP
END
