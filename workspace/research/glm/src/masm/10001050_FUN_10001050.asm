.686
.MODEL FLAT, C
EXTRN sub_10004F71:PROC
EXTRN sub_100051D0:PROC
EXTRN sub_100051EE:PROC
EXTRN sub_1005ECB2:PROC
EXTRN g_101CE708:DWORD
.CODE
FUN_10001050 PROC
    push ecx
    mov ecx, dword ptr [g_101CE708]
    mov edx, dword ptr [ecx + 8]
    push ebx
    mov ebx, eax
    xor eax, eax
    cmp edx, 2
    setne al
    push ebp
    mov ebp, dword ptr [esp + 16]
    push esi
    push edi
    lea edi, [esp + 16]
    dec eax
    and eax, 0FFFFFFDCh
    add eax, 68
    imul eax, ebx
    mov esi, eax
    call sub_10004F71
    mov edx, dword ptr [g_101CE708]
    cmp dword ptr [edx + 8], 2
    jne L3
    xor edi, edi
    cmp ebx, 4
    jl L1
    lea esi, [ebx - 4]
    shr esi, 2
    inc esi
    lea ecx, [eax + 28]
    lea edx, [ebp + 40]
    lea edi, [esi*4]
L0:
    mov ebp, dword ptr [edx - 40]
    mov dword ptr [ecx - 28], ebp
    mov ebp, dword ptr [edx - 36]
    mov dword ptr [ecx - 24], ebp
    mov ebp, dword ptr [edx - 32]
    mov dword ptr [ecx - 20], ebp
    mov ebp, dword ptr [edx - 16]
    mov dword ptr [ecx - 16], ebp
    mov ebp, dword ptr [edx - 12]
    mov dword ptr [ecx - 12], ebp
    mov ebp, dword ptr [edx - 8]
    mov dword ptr [ecx - 8], ebp
    mov ebp, dword ptr [edx - 4]
    mov dword ptr [ecx - 4], ebp
    mov ebp, dword ptr [edx]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edx + 28]
    mov dword ptr [ecx + 4], ebp
    mov ebp, dword ptr [edx + 32]
    mov dword ptr [ecx + 8], ebp
    mov ebp, dword ptr [edx + 36]
    mov dword ptr [ecx + 12], ebp
    mov ebp, dword ptr [edx + 52]
    mov dword ptr [ecx + 16], ebp
    mov ebp, dword ptr [edx + 56]
    mov dword ptr [ecx + 20], ebp
    mov ebp, dword ptr [edx + 60]
    mov dword ptr [ecx + 24], ebp
    mov ebp, dword ptr [edx + 64]
    mov dword ptr [ecx + 28], ebp
    mov ebp, dword ptr [edx + 68]
    mov dword ptr [ecx + 32], ebp
    mov ebp, dword ptr [edx + 96]
    mov dword ptr [ecx + 36], ebp
    mov ebp, dword ptr [edx + 100]
    mov dword ptr [ecx + 40], ebp
    mov ebp, dword ptr [edx + 104]
    mov dword ptr [ecx + 44], ebp
    mov ebp, dword ptr [edx + 120]
    mov dword ptr [ecx + 48], ebp
    mov ebp, dword ptr [edx + 124]
    mov dword ptr [ecx + 52], ebp
    mov ebp, dword ptr [edx + 000000080h]
    mov dword ptr [ecx + 56], ebp
    mov ebp, dword ptr [edx + 000000084h]
    mov dword ptr [ecx + 60], ebp
    mov ebp, dword ptr [edx + 000000088h]
    mov dword ptr [ecx + 64], ebp
    mov ebp, dword ptr [edx + 0000000A4h]
    mov dword ptr [ecx + 68], ebp
    mov ebp, dword ptr [edx + 0000000A8h]
    mov dword ptr [ecx + 72], ebp
    mov ebp, dword ptr [edx + 0000000ACh]
    mov dword ptr [ecx + 76], ebp
    mov ebp, dword ptr [edx + 0000000BCh]
    mov dword ptr [ecx + 80], ebp
    mov ebp, dword ptr [edx + 0000000C0h]
    mov dword ptr [ecx + 84], ebp
    mov ebp, dword ptr [edx + 0000000C4h]
    mov dword ptr [ecx + 88], ebp
    mov ebp, dword ptr [edx + 0000000C8h]
    mov dword ptr [ecx + 92], ebp
    mov ebp, dword ptr [edx + 0000000CCh]
    mov dword ptr [ecx + 96], ebp
    add ecx, 000000080h
    add edx, 000000110h
    dec esi
    jne L0
    mov ebp, dword ptr [esp + 24]
L1:
    cmp edi, ebx
    jge L4
    mov edx, edi
    imul edx, edx, 68
    mov ecx, edi
    shl ecx, 5
    lea eax, [ecx + eax + 28]
    lea ecx, [edx + ebp + 40]
    sub ebx, edi
    mov edi, edi
L2:
    mov edx, dword ptr [ecx - 40]
    mov dword ptr [eax - 28], edx
    mov edx, dword ptr [ecx - 36]
    mov dword ptr [eax - 24], edx
    mov edx, dword ptr [ecx - 32]
    mov dword ptr [eax - 20], edx
    mov edx, dword ptr [ecx - 16]
    mov dword ptr [eax - 16], edx
    mov edx, dword ptr [ecx - 12]
    mov dword ptr [eax - 12], edx
    mov edx, dword ptr [ecx - 8]
    mov dword ptr [eax - 8], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [eax - 4], edx
    mov edx, dword ptr [ecx]
    mov dword ptr [eax], edx
    add eax, 32
    add ecx, 68
    dec ebx
    jne L2
    mov esi, dword ptr [esp + 16]
    call sub_100051D0
    mov eax, dword ptr [esp + 16]
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
L3:
    push esi
    push ebp
    push eax
    call sub_1005ECB2
    add esp, 12
L4:
    mov esi, dword ptr [esp + 16]
    call sub_100051EE
    mov eax, dword ptr [esp + 16]
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_10001050 ENDP
END
