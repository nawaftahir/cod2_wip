.686
.MODEL FLAT, C
EXTRN sub_100827CC:PROC
EXTRN sub_10082856:PROC
EXTRN sub_100833CD:PROC
EXTRN sub_100833D4:PROC
.CODE
FUN_10083357 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push edi
    push push 14
    mov mov ebx, ecx
    call sub_100827CC
    mov mov esi, dword ptr [ebp + 8]
    mov mov dword ptr [ebx], 010110068h
    lea lea eax, [ebx + 16]
    mov mov edi, eax
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    cmp cmp dword ptr [eax], 4
    mov mov esi, dword ptr [ebp + 12]
    push push 8
    lea lea edi, [ebx + 32]
    pop pop ecx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jne sub_100833CD
    mov mov eax, dword ptr [ebx + 24]
    test test eax, eax
    je sub_100833D4
    push push eax
    call sub_10082856
    mov mov dword ptr [ebx + 24], eax
    pop pop edi
    pop pop esi
    mov mov eax, ebx
    pop pop ebx
    pop pop ebp
    ret ret 8
FUN_10083357 ENDP
END
