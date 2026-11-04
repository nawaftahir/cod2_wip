.686
.MODEL FLAT, C
EXTRN sub_1008C854:PROC
EXTRN sub_100F787F:PROC
.CODE
FUN_1008c825 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    test test byte ptr [ebp + 8], 1
    push push esi
    mov mov esi, ecx
    mov mov dword ptr [esi], 010110440h
    je sub_1008C854
    push push esi
    call sub_100F787F
    pop pop ecx
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_1008c825 ENDP
END
