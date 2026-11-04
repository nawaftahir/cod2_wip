.686
.MODEL FLAT, C
EXTRN sub_10067C9B:PROC
EXTRN sub_10067CB9:PROC
EXTRN sub_10067CF6:PROC
EXTRN sub_10067E9F:PROC
EXTRN sub_10068D3F:PROC
EXTRN sub_10068D67:PROC
EXTRN sub_10068D7D:PROC
EXTRN sub_100F6251:PROC
EXTRN sub_100F883F:PROC
.CODE
FUN_10068c42 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, 01000h
    call sub_100F883F
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    push push edi
    push push 13
    mov mov edi, 01010C5E8h
    pop pop ecx
    xor xor eax, eax
    mov mov dword ptr [ebx + 76], 1
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    mov mov ecx, dword ptr [ebx]
    lea lea esi, [ebx + 16]
    push push esi
    push push 07D0h
    call sub_10067E9F
    cmp cmp dword ptr [esi], 9
    jne sub_10068D3F
    mov mov eax, 07E7h
    cmp cmp dword ptr [ebx + 84], eax
    jne L0
    push push dword ptr [ebx + 24]
    push push 01010EC20h
    push push eax
    push push esi
    push push dword ptr [ebx]
    call sub_10067C9B
    add add esp, 20
    mov mov eax, 07E8h
    cmp cmp dword ptr [ebx + 84], eax
    jne sub_10068D67
    push push dword ptr [ebx + 24]
    push push 01010EBFCh
    push push eax
    push push esi
    push push dword ptr [ebx]
    call sub_10067CB9
    add add esp, 20
    jmp sub_10068D7D
    lea lea eax, [ebp + 16]
    push push eax
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 01000h]
    push push 01000h
    push push eax
    call sub_100F6251
    lea lea eax, [ebp - 01000h]
    push push eax
    push push 010193358h
    push push 0
    lea lea eax, [ebx + 16]
    push push eax
    push push dword ptr [ebx]
L0:
    mov mov byte ptr [ebp - 0F01h], 0
    call sub_10067CF6
    add add esp, 36
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10068c42 ENDP
END
