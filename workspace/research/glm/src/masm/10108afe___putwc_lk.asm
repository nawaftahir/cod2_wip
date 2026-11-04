.686
.MODEL FLAT, C
EXTRN sub_100FA3B7:PROC
EXTRN sub_100FC278:PROC
EXTRN sub_10100E21:PROC
EXTRN sub_10106BE1:PROC
EXTRN sub_10109E18:PROC
EXTRN g_101A50D0:DWORD
.CODE
__putwc_lk PROC
    push ebp
    mov ebp, esp
    sub esp, 12
    mov eax, dword ptr [g_101A50D0]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 12]
    test byte ptr [esi + 12], 64
    mov dword ptr [ebp - 4], eax
    push edi
    jne L8
    mov eax, dword ptr [esi + 16]
    cmp eax, -1
    je L0
    mov ecx, eax
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    and eax, 31
    lea eax, [eax + eax*8]
    lea eax, [ecx + eax*4]
    jmp L1
L0:
    mov eax, 0101A4E60h
L1:
    test byte ptr [eax + 4], 000000080h
    je L8
    push dword ptr [ebp + 8]
    lea eax, [ebp - 12]
    push eax
    call sub_10106BE1
    mov ebx, eax
    cmp ebx, -1
    pop ecx
    pop ecx
    jne L3
    call sub_100FC278
    mov dword ptr [eax], 42
L2:
    or ax, 00000FFFFh
    jmp L10
L3:
    xor edi, edi
    test ebx, ebx
    jle L7
L4:
    dec dword ptr [esi + 4]
    js L5
    mov eax, dword ptr [esi]
    mov cl, byte ptr [ebp + edi - 12]
    mov byte ptr [eax], cl
    mov ecx, dword ptr [esi]
    movzx eax, byte ptr [ecx]
    inc ecx
    mov dword ptr [esi], ecx
    jmp L6
L5:
    movsx eax, byte ptr [ebp + edi - 12]
    push esi
    push eax
    call sub_100FA3B7
    pop ecx
    pop ecx
L6:
    cmp eax, -1
    je L2
    inc edi
    cmp edi, ebx
    jl L4
L7:
    mov ax, word ptr [ebp + 8]
    jmp L10
L8:
    add dword ptr [esi + 4], -2
    js L9
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ebp + 8]
    mov word ptr [ecx], ax
    add dword ptr [esi], 2
    jmp L10
L9:
    movzx eax, word ptr [ebp + 8]
    push esi
    push eax
    call sub_10109E18
    pop ecx
    pop ecx
L10:
    mov ecx, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    call sub_10100E21
    leave
    ret
__putwc_lk ENDP
END
