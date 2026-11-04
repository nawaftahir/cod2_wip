.686
.MODEL FLAT, C
EXTRN sub_100827CC:PROC
EXTRN sub_10082856:PROC
.CODE
FUN_10083357 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push 14
    mov ebx, ecx
    call sub_100827CC
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebx], 010110068h
    lea eax, [ebx + 16]
    mov edi, eax
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    cmp dword ptr [eax], 4
    mov esi, dword ptr [ebp + 12]
    push 8
    lea edi, [ebx + 32]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jne L0
    mov eax, dword ptr [ebx + 24]
    test eax, eax
    je L0
    push eax
    call sub_10082856
    mov dword ptr [ebx + 24], eax
L0:
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    pop ebp
    ret 8
FUN_10083357 ENDP
END
