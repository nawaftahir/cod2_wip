.686
.MODEL FLAT, C
EXTRN sub_100FA3B7:PROC
EXTRN sub_100FC278:PROC
EXTRN sub_10100E21:PROC
EXTRN sub_10106BE1:PROC
EXTRN sub_10108BEF:PROC
EXTRN sub_10108C02:PROC
EXTRN sub_10108C04:PROC
EXTRN sub_10108C15:PROC
EXTRN sub_10108C22:PROC
EXTRN sub_10108C35:PROC
EXTRN sub_10108C69:PROC
EXTRN sub_10108C70:PROC
EXTRN sub_10108C83:PROC
EXTRN sub_10109E18:PROC
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
__putwc_lk PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    mov mov eax, dword ptr [g_101A50D0]
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    test test byte ptr [esi + 12], 64
    mov mov dword ptr [ebp - 4], eax
    push push edi
    jne L2
    mov mov eax, dword ptr [esi + 16]
    cmp cmp eax, -1
    je L0
    mov mov ecx, eax
    sar sar ecx, 5
    mov mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    and and eax, 31
    lea lea eax, [eax + eax*8]
    lea lea eax, [ecx + eax*4]
    jmp L1
    mov mov eax, 0101A4E60h
    test test byte ptr [eax + 4], 080h
    je sub_10108BEF
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 12]
    push push eax
    call sub_10106BE1
    mov mov ebx, eax
    cmp cmp ebx, -1
    pop pop ecx
    pop pop ecx
    jne L3
    call sub_100FC278
    mov mov dword ptr [eax], 42
    or or ax, 0FFFFh
    jmp sub_10108C35
    xor xor edi, edi
    test test ebx, ebx
    jle sub_10108C15
    dec dec dword ptr [esi + 4]
    js sub_10108C02
    mov mov eax, dword ptr [esi]
    mov mov cl, byte ptr [ebp + edi - 12]
L1:
    mov mov byte ptr [eax], cl
    mov mov ecx, dword ptr [esi]
    movzx movzx eax, byte ptr [ecx]
    inc inc ecx
    mov mov dword ptr [esi], ecx
    jmp sub_10108C22
    movsx movsx eax, byte ptr [ebp + edi - 12]
    push push esi
    push push eax
    call sub_100FA3B7
    pop pop ecx
    pop pop ecx
    cmp cmp eax, -1
    je sub_10108C04
    inc inc edi
    cmp cmp edi, ebx
    jl sub_10108C15
    mov mov ax, word ptr [ebp + 8]
    jmp sub_10108C70
    add add dword ptr [esi + 4], -2
    js sub_10108C69
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [ebp + 8]
    mov mov word ptr [ecx], ax
    add add dword ptr [esi], 2
    jmp sub_10108C83
    movzx movzx eax, word ptr [ebp + 8]
    push push esi
    push push eax
    call sub_10109E18
L2:
    pop pop ecx
    pop pop ecx
    mov mov ecx, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    call sub_10100E21
    leave leave
    ret ret
__putwc_lk ENDP
END
