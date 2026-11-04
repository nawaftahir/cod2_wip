.686
.MODEL FLAT, C
EXTRN sub_100FC2A2:PROC
EXTRN sub_100FC2B6:PROC
EXTRN sub_100FC32F:PROC
EXTRN sub_100FC343:PROC
EXTRN sub_100FC3BD:PROC
EXTRN sub_100FC3D1:PROC
EXTRN sub_100FC42F:PROC
EXTRN sub_100FC497:PROC
EXTRN sub_100FCF79:PROC
EXTRN sub_10106C08:PROC
EXTRN sub_10106C73:PROC
EXTRN sub_1010783A:PROC
EXTRN sub_101079AC:PROC
EXTRN sub_10108ECD:PROC
EXTRN sub_101095D9:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C078:DWORD
EXTRN fp_1010C084:DWORD
EXTRN fp_1010C158:DWORD
EXTRN g_101AE008:DWORD
EXTRN g_101AE00C:DWORD
EXTRN g_101AE25C:DWORD
.CODE
__tsopen_lk PROC
    push ebp
    mov ebp, esp
    sub esp, 28
    mov edx, dword ptr [ebp + 20]
    push ebx
    push esi
    xor esi, esi
    test dl, dl
    mov dword ptr [ebp - 28], 12
    mov dword ptr [ebp - 24], esi
    jns L0
    mov dword ptr [ebp - 20], esi
    mov byte ptr [ebp - 1], 16
    jmp L1
L0:
    mov dword ptr [ebp - 20], 1
    mov byte ptr [ebp - 1], 0
L1:
    mov eax, 000008000h
    test eax, edx
    jne L3
    test dh, 64
    jne L2
    cmp dword ptr [g_101AE25C], eax
    je L3
L2:
    or byte ptr [ebp - 1], 000000080h
L3:
    push 3
    mov eax, edx
    pop ebx
    and eax, ebx
    sub eax, esi
    je L5
    dec eax
    je L4
    dec eax
    jne L7
    mov dword ptr [ebp - 16], 0C0000000h
    jmp L6
L4:
    mov dword ptr [ebp - 16], 040000000h
    jmp L6
L5:
    mov dword ptr [ebp - 16], 080000000h
L6:
    cmp ecx, 16
    je L11
    cmp ecx, 32
    je L10
    cmp ecx, 48
    je L9
    cmp ecx, 64
    je L8
L7:
    call sub_100FC2A2
    mov dword ptr [eax], 22
    call sub_100FC2B6
    mov dword ptr [eax], esi
    or eax, 0FFFFFFFFh
    jmp L35
L8:
    mov dword ptr [ebp - 8], ebx
    jmp L12
L9:
    mov dword ptr [ebp - 8], 2
    jmp L12
L10:
    mov dword ptr [ebp - 8], 1
    jmp L12
L11:
    mov dword ptr [ebp - 8], esi
L12:
    mov eax, edx
    mov edx, 000000700h
    and eax, edx
    mov ecx, 000000400h
    cmp eax, ecx
    push edi
    mov edi, 000000100h
    jg L15
    je L14
    cmp eax, esi
    je L14
    cmp eax, edi
    je L13
    cmp eax, 000000200h
    je L18
    cmp eax, 000000300h
    jne L16
    mov dword ptr [ebp - 12], 2
    jmp L20
L13:
    mov dword ptr [ebp - 12], 4
    jmp L20
L14:
    mov dword ptr [ebp - 12], ebx
    jmp L20
L15:
    cmp eax, 000000500h
    je L19
    cmp eax, 000000600h
    je L18
    cmp eax, edx
    je L19
L16:
    call sub_100FC32F
    mov dword ptr [eax], 22
    call sub_100FC343
    mov dword ptr [eax], esi
L17:
    or eax, 0FFFFFFFFh
    jmp L34
L18:
    mov dword ptr [ebp - 12], 5
    jmp L20
L19:
    mov dword ptr [ebp - 12], 1
L20:
    mov eax, dword ptr [ebp + 20]
    test edi, eax
    mov esi, 000000080h
    je L21
    mov ecx, dword ptr [g_101AE008]
    not ecx
    and ecx, dword ptr [ebp + 24]
    test cl, cl
    js L21
    xor esi, esi
    inc esi
L21:
    test al, 64
    je L22
    or byte ptr [ebp - 14], 1
    or esi, 004000000h
    cmp dword ptr [g_101AE00C], 2
    jne L22
    or dword ptr [ebp - 8], 4
L22:
    test ah, 16
    je L23
    or esi, edi
L23:
    test al, 32
    je L24
    or esi, 008000000h
    jmp L25
L24:
    test al, 16
    je L25
    or esi, 010000000h
L25:
    call sub_101079AC
    mov edi, eax
    or ebx, 0FFFFFFFFh
    cmp edi, ebx
    jne L27
    call sub_100FC3BD
    mov dword ptr [eax], 24
    call sub_100FC3D1
    and dword ptr [eax], 0
L26:
    mov eax, ebx
    jmp L34
L27:
    mov eax, dword ptr [ebp + 8]
    push 0
    push esi
    push dword ptr [ebp - 12]
    mov dword ptr [eax], 1
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], edi
    lea eax, [ebp - 28]
    push eax
    push dword ptr [ebp - 8]
    push dword ptr [ebp - 16]
    push dword ptr [ebp + 16]
    call dword ptr [fp_1010C078]
    mov esi, eax
    cmp esi, ebx
    je L28
    push esi
    call dword ptr [fp_1010C158]
    test eax, eax
    jne L29
    push esi
    call dword ptr [fp_1010C084]
L28:
    call dword ptr [fp_1010C054]
    push eax
    call sub_100FC42F
    pop ecx
    jmp L26
L29:
    cmp eax, 2
    jne L30
    or byte ptr [ebp - 1], 64
    jmp L31
L30:
    cmp eax, 3
    jne L31
    or byte ptr [ebp - 1], 8
L31:
    push esi
    push edi
    call sub_1010783A
    or byte ptr [ebp - 1], 1
    mov eax, edi
    sar eax, 5
    lea ebx, [eax*4 + 01076ACA0h]
    mov eax, edi
    and eax, 31
    lea esi, [eax + eax*8]
    mov al, byte ptr [ebp - 1]
    pop ecx
    pop ecx
    mov ecx, dword ptr [ebx]
    shl esi, 2
    mov byte ptr [ebp - 1], al
    and byte ptr [ebp - 1], 72
    mov byte ptr [esi + ecx + 4], al
    jne L32
    test al, al
    jns L32
    test byte ptr [ebp + 20], 2
    je L32
    push 2
    push -1
    push edi
    call sub_10106C08
    add esp, 12
    cmp eax, -1
    mov dword ptr [ebp - 16], eax
    jne L36
    call sub_100FC497
    cmp dword ptr [eax], 000000083h
    jne L38
L32:
    cmp byte ptr [ebp - 1], 0
    jne L33
    test byte ptr [ebp + 20], 8
    je L33
    mov eax, dword ptr [ebx]
    lea eax, [esi + eax + 4]
    or byte ptr [eax], 32
L33:
    mov eax, edi
L34:
    pop edi
L35:
    pop esi
    pop ebx
    leave
    ret
L36:
    push 1
    lea eax, [ebp - 2]
    push eax
    push edi
    mov byte ptr [ebp - 2], 0
    call sub_10108ECD
    add esp, 12
    test eax, eax
    jne L37
    cmp byte ptr [ebp - 2], 26
    jne L37
    push dword ptr [ebp - 16]
    push edi
    call sub_101095D9
    cmp eax, -1
    pop ecx
    pop ecx
    je L38
L37:
    push 0
    push 0
    push edi
    call sub_10106C73
    add esp, 12
    cmp eax, -1
    jne L32
L38:
    push edi
    call sub_100FCF79
    pop ecx
    jmp L17
__tsopen_lk ENDP
END
