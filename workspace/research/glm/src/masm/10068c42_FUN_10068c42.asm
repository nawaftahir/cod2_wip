.686
.MODEL FLAT, C
EXTRN sub_10067C9B:PROC
EXTRN sub_10067CB9:PROC
EXTRN sub_10067CF6:PROC
EXTRN sub_10067E9F:PROC
EXTRN sub_100F6251:PROC
EXTRN sub_100F883F:PROC
.CODE
FUN_10068c42 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, 000001000h
    call sub_100F883F
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ebp + 12]
    push edi
    push 13
    mov edi, 01010C5E8h
    pop ecx
    xor eax, eax
    mov dword ptr [ebx + 76], 1
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    mov ecx, dword ptr [ebx]
    lea esi, [ebx + 16]
    push esi
    push 0000007D0h
    call sub_10067E9F
    cmp dword ptr [esi], 9
    jne L2
    mov eax, 0000007E7h
    cmp dword ptr [ebx + 84], eax
    jne L0
    push dword ptr [ebx + 24]
    push 01010EC20h
    push eax
    push esi
    push dword ptr [ebx]
    call sub_10067C9B
    add esp, 20
L0:
    mov eax, 0000007E8h
    cmp dword ptr [ebx + 84], eax
    jne L2
    push dword ptr [ebx + 24]
    push 01010EBFCh
    push eax
    push esi
    push dword ptr [ebx]
    call sub_10067CB9
    add esp, 20
    jmp L2
L1:
    lea eax, [ebp + 16]
    push eax
    push dword ptr [ebp + 12]
    lea eax, [ebp - 000001000h]
    push 000001000h
    push eax
    call sub_100F6251
    lea eax, [ebp - 000001000h]
    push eax
    push 010193358h
    push 0
    lea eax, [ebx + 16]
    push eax
    push dword ptr [ebx]
    mov byte ptr [ebp - 000000F01h], 0
    call sub_10067CF6
    add esp, 36
L2:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10068c42 ENDP
END
