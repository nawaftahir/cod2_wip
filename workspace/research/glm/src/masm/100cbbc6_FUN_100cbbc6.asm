.686
.MODEL FLAT, C
EXTRN sub_10086942:PROC
.CODE
FUN_100cbbc6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 12]
    mov eax, dword ptr [edi]
    cmp eax, 1
    jbe L3
    push esi
    mov esi, dword ptr [ebp + 8]
    push 0
    push eax
    push esi
    push 0100CBBACh
    call sub_10086942
    xor ecx, ecx
    xor edx, edx
    inc ecx
    inc edx
    cmp dword ptr [edi], ecx
    jbe L2
L0:
    mov eax, dword ptr [esi + ecx*4]
    cmp eax, dword ptr [esi + ecx*4 - 4]
    je L1
    mov dword ptr [esi + edx*4], eax
    inc edx
L1:
    inc ecx
    cmp ecx, dword ptr [edi]
    jb L0
L2:
    mov dword ptr [edi], edx
    pop esi
L3:
    pop edi
    pop ebp
    ret 8
FUN_100cbbc6 ENDP
END
