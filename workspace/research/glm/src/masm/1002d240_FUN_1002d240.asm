.686
.MODEL FLAT, C
.CODE
FUN_1002d240 PROC
    push ebx
    push esi
    push edi
    mov ebx, eax
    xor edi, edi
    cmp ebx, 4
    mov edx, ecx
    jl L1
    mov eax, dword ptr [esp + 16]
    lea esi, [ebx - 4]
    shr esi, 2
    add ecx, 56
    add eax, 20
    inc esi
    lea edi, [esi*4]
    push ebp
    jmp L0
    lea ecx, [ecx]
L0:
    mov ebp, dword ptr [ecx - 8]
    mov dword ptr [eax - 20], ebp
    mov ebp, dword ptr [ecx - 4]
    mov dword ptr [eax - 16], ebp
    mov ebp, dword ptr [ecx]
    mov dword ptr [eax - 12], ebp
    mov ebp, dword ptr [edx]
    mov dword ptr [eax - 8], ebp
    mov ebp, dword ptr [ecx - 52]
    mov dword ptr [eax - 4], ebp
    mov ebp, dword ptr [ecx - 48]
    mov dword ptr [eax], ebp
    mov ebp, dword ptr [ecx - 44]
    mov dword ptr [eax + 4], ebp
    mov ebp, dword ptr [ecx - 28]
    mov dword ptr [eax + 8], ebp
    mov ebp, dword ptr [ecx - 12]
    mov dword ptr [eax + 12], ebp
    mov ebp, dword ptr [ecx + 56]
    mov dword ptr [eax + 16], ebp
    mov ebp, dword ptr [ecx + 60]
    mov dword ptr [eax + 20], ebp
    mov ebp, dword ptr [ecx + 64]
    mov dword ptr [eax + 24], ebp
    mov ebp, dword ptr [ecx + 8]
    mov dword ptr [eax + 28], ebp
    mov ebp, dword ptr [ecx + 12]
    mov dword ptr [eax + 32], ebp
    mov ebp, dword ptr [ecx + 16]
    mov dword ptr [eax + 36], ebp
    mov ebp, dword ptr [ecx + 20]
    mov dword ptr [eax + 40], ebp
    mov ebp, dword ptr [ecx + 36]
    mov dword ptr [eax + 44], ebp
    mov ebp, dword ptr [ecx + 52]
    mov dword ptr [eax + 48], ebp
    mov ebp, dword ptr [ecx + 120]
    mov dword ptr [eax + 52], ebp
    mov ebp, dword ptr [ecx + 124]
    mov dword ptr [eax + 56], ebp
    mov ebp, dword ptr [ecx + 000000080h]
    mov dword ptr [eax + 60], ebp
    mov ebp, dword ptr [ecx + 72]
    mov dword ptr [eax + 64], ebp
    mov ebp, dword ptr [ecx + 76]
    mov dword ptr [eax + 68], ebp
    mov ebp, dword ptr [ecx + 80]
    mov dword ptr [eax + 72], ebp
    mov ebp, dword ptr [ecx + 84]
    mov dword ptr [eax + 76], ebp
    mov ebp, dword ptr [ecx + 100]
    mov dword ptr [eax + 80], ebp
    mov ebp, dword ptr [ecx + 116]
    mov dword ptr [eax + 84], ebp
    mov ebp, dword ptr [ecx + 0000000B8h]
    mov dword ptr [eax + 88], ebp
    mov ebp, dword ptr [ecx + 0000000BCh]
    mov dword ptr [eax + 92], ebp
    mov ebp, dword ptr [ecx + 0000000C0h]
    mov dword ptr [eax + 96], ebp
    mov ebp, dword ptr [ecx + 000000088h]
    mov dword ptr [eax + 100], ebp
    mov ebp, dword ptr [ecx + 00000008Ch]
    mov dword ptr [eax + 104], ebp
    mov ebp, dword ptr [ecx + 000000090h]
    mov dword ptr [eax + 108], ebp
    mov ebp, dword ptr [ecx + 000000094h]
    mov dword ptr [eax + 112], ebp
    mov ebp, dword ptr [ecx + 0000000A4h]
    mov dword ptr [eax + 116], ebp
    mov ebp, dword ptr [ecx + 0000000B4h]
    mov dword ptr [eax + 120], ebp
    add edx, 000000100h
    add ecx, 000000100h
    add eax, 000000090h
    dec esi
    jne L0
    pop ebp
L1:
    cmp edi, ebx
    jge L3
    mov esi, dword ptr [esp + 16]
    lea eax, [edi + edi*8]
    lea ecx, [edx + 56]
    lea eax, [esi + eax*4 + 20]
    sub ebx, edi
L2:
    mov esi, dword ptr [ecx - 8]
    mov dword ptr [eax - 20], esi
    mov esi, dword ptr [ecx - 4]
    mov dword ptr [eax - 16], esi
    mov esi, dword ptr [ecx]
    mov dword ptr [eax - 12], esi
    mov esi, dword ptr [edx]
    mov dword ptr [eax - 8], esi
    mov esi, dword ptr [ecx - 52]
    mov dword ptr [eax - 4], esi
    mov esi, dword ptr [ecx - 48]
    mov dword ptr [eax], esi
    mov esi, dword ptr [ecx - 44]
    mov dword ptr [eax + 4], esi
    mov esi, dword ptr [ecx - 28]
    mov dword ptr [eax + 8], esi
    mov esi, dword ptr [ecx - 12]
    mov dword ptr [eax + 12], esi
    add edx, 64
    add ecx, 64
    add eax, 36
    dec ebx
    jne L2
L3:
    pop edi
FUN_1002d240 ENDP
END
