.686
.MODEL FLAT, C
EXTRN sub_100827CC:PROC
.CODE
FUN_10085180 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push 18
    mov ebx, ecx
    call sub_100827CC
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 12]
    push 8
    mov dword ptr [ebx], 0101103E0h
    pop ecx
    lea edi, [ebx + 16]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [ebx + 48], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebx + 52], eax
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [ebx + 56], eax
    xor eax, eax
    mov dword ptr [ebx + 60], eax
    mov dword ptr [ebx + 64], eax
    mov dword ptr [ebx + 84], eax
    mov dword ptr [ebx + 88], eax
    lea edi, [ebx + 68]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    pop ebp
    ret 16
FUN_10085180 ENDP
END
