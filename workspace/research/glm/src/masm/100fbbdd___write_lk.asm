.686
.MODEL FLAT, C
EXTRN sub_100FC34F:PROC
EXTRN sub_100FC363:PROC
EXTRN sub_100FC3AB:PROC
EXTRN sub_100FC3B9:PROC
EXTRN sub_100FC3CD:PROC
EXTRN sub_10100F13:PROC
EXTRN sub_1010753E:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C124:DWORD
EXTRN g_101A50D0:DWORD
.CODE
__write_lk PROC
    push ebp
    lea ebp, [esp - 0000003A0h]
    sub esp, 000000420h
    mov eax, dword ptr [g_101A50D0]
    push edi
    xor edi, edi
    cmp dword ptr [ebp + 0000003B0h], edi
    mov dword ptr [ebp + 00000039Ch], eax
    mov dword ptr [ebp - 120], edi
    mov dword ptr [ebp - 124], edi
    jne L0
    xor eax, eax
    jmp L17
L0:
    mov eax, dword ptr [ebp + 0000003A8h]
    push ebx
    mov ebx, dword ptr [ebp + 0000003A8h]
    and eax, 31
    sar ebx, 5
    push esi
    lea esi, [eax + eax*8]
    lea ebx, [ebx*4 + 01076ACA0h]
    mov eax, dword ptr [ebx]
    shl esi, 2
    test byte ptr [eax + esi + 4], 32
    je L1
    push 2
    push edi
    push edi
    push dword ptr [ebp + 0000003A8h]
    call sub_1010753E
    add esp, 16
L1:
    mov eax, dword ptr [ebx]
    add eax, esi
    test byte ptr [eax + 4], 000000080h
    je L9
    cmp dword ptr [ebp + 0000003B0h], edi
    mov eax, dword ptr [ebp + 0000003ACh]
    mov dword ptr [ebp - 116], eax
    mov dword ptr [ebp - 108], edi
    jbe L12
L2:
    mov ecx, dword ptr [ebp - 116]
    sub ecx, dword ptr [ebp + 0000003ACh]
    lea eax, [ebp - 104]
    mov dword ptr [ebp - 112], edi
L3:
    cmp ecx, dword ptr [ebp + 0000003B0h]
    jae L5
    mov edx, dword ptr [ebp - 116]
    inc dword ptr [ebp - 116]
    mov dl, byte ptr [edx]
    inc ecx
    cmp dl, 10
    jne L4
    inc dword ptr [ebp - 124]
    mov byte ptr [eax], 13
    inc eax
    inc dword ptr [ebp - 112]
L4:
    mov byte ptr [eax], dl
    inc eax
    inc dword ptr [ebp - 112]
    cmp dword ptr [ebp - 112], 000000400h
    jl L3
L5:
    mov edi, eax
    lea eax, [ebp - 104]
    sub edi, eax
    push 0
    lea eax, [ebp - 000000080h]
    push eax
    push edi
    lea eax, [ebp - 104]
    push eax
    mov eax, dword ptr [ebx]
    push dword ptr [eax + esi]
    call dword ptr [fp_1010C124]
    test eax, eax
    je L6
    mov eax, dword ptr [ebp - 000000080h]
    add dword ptr [ebp - 120], eax
    cmp eax, edi
    jl L7
    mov eax, dword ptr [ebp - 116]
    sub eax, dword ptr [ebp + 0000003ACh]
    xor edi, edi
    cmp eax, dword ptr [ebp + 0000003B0h]
    jb L2
    jmp L8
L6:
    call dword ptr [fp_1010C054]
    mov dword ptr [ebp - 108], eax
L7:
    xor edi, edi
L8:
    mov eax, dword ptr [ebp - 120]
    cmp eax, edi
    jne L15
    cmp dword ptr [ebp - 108], edi
    je L12
    push 5
    pop esi
    cmp dword ptr [ebp - 108], esi
    jne L11
    call sub_100FC34F
    mov dword ptr [eax], 9
    call sub_100FC363
    mov dword ptr [eax], esi
    jmp L14
L9:
    push edi
    lea ecx, [ebp - 000000080h]
    push ecx
    push dword ptr [ebp + 0000003B0h]
    push dword ptr [ebp + 0000003ACh]
    push dword ptr [eax]
    call dword ptr [fp_1010C124]
    test eax, eax
    je L10
    mov eax, dword ptr [ebp - 000000080h]
    mov dword ptr [ebp - 108], edi
    mov dword ptr [ebp - 120], eax
    jmp L8
L10:
    call dword ptr [fp_1010C054]
    mov dword ptr [ebp - 108], eax
    jmp L8
L11:
    push dword ptr [ebp - 108]
    call sub_100FC3AB
    pop ecx
    jmp L14
L12:
    mov eax, dword ptr [ebx]
    test byte ptr [eax + esi + 4], 64
    je L13
    mov eax, dword ptr [ebp + 0000003ACh]
    cmp byte ptr [eax], 26
    jne L13
    xor eax, eax
    jmp L16
L13:
    call sub_100FC3B9
    mov dword ptr [eax], 28
    call sub_100FC3CD
    mov dword ptr [eax], edi
L14:
    or eax, 0FFFFFFFFh
    jmp L16
L15:
    sub eax, dword ptr [ebp - 124]
L16:
    pop esi
    pop ebx
L17:
    mov ecx, dword ptr [ebp + 00000039Ch]
    pop edi
    call sub_10100F13
    add ebp, 0000003A0h
    leave
    ret
__write_lk ENDP
END
