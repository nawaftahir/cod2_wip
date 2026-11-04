.686
.MODEL FLAT, C
EXTRN sub_100827CC:PROC
.CODE
FUN_10085180 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push edi
    push push 18
    mov mov ebx, ecx
    call sub_100827CC
    mov mov esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 12]
    push push 8
    mov mov dword ptr [ebx], 0101103E0h
    pop pop ecx
    lea lea edi, [ebx + 16]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [ebx + 48], eax
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebx + 52], eax
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [ebx + 56], eax
    xor xor eax, eax
    mov mov dword ptr [ebx + 60], eax
    mov mov dword ptr [ebx + 64], eax
    mov mov dword ptr [ebx + 84], eax
    mov mov dword ptr [ebx + 88], eax
    lea lea edi, [ebx + 68]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    pop pop edi
    pop pop esi
    mov mov eax, ebx
    pop pop ebx
    pop pop ebp
    ret ret 16
FUN_10085180 ENDP
END
