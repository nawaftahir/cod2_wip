.686
.MODEL FLAT, C
EXTRN sub_10086942:PROC
EXTRN sub_100CBC17:PROC
EXTRN sub_100CBC30:PROC
EXTRN sub_100CBC34:PROC
.CODE
FUN_100cbbc6 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    mov mov eax, dword ptr [edi]
    cmp cmp eax, 1
    jbe sub_100CBC17
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push 0
    push push eax
    push push esi
    push push 0100CBBACh
    call sub_10086942
    xor xor ecx, ecx
    xor xor edx, edx
    inc inc ecx
    inc inc edx
    cmp cmp dword ptr [edi], ecx
    jbe sub_100CBC30
    mov mov eax, dword ptr [esi + ecx*4]
    cmp cmp eax, dword ptr [esi + ecx*4 - 4]
    je sub_100CBC34
    mov mov dword ptr [esi + edx*4], eax
    inc inc edx
    inc inc ecx
    cmp cmp ecx, dword ptr [edi]
    jb sub_100CBC30
    mov mov dword ptr [edi], edx
    pop pop esi
    pop pop edi
    pop pop ebp
    ret ret 8
FUN_100cbbc6 ENDP
END
