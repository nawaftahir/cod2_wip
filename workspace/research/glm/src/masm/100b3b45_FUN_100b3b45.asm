.686
.MODEL FLAT, C
EXTRN sub_1006A7FE:PROC
EXTRN sub_1006A87D:PROC
EXTRN sub_100C4F90:PROC
EXTRN sub_100C7D40:PROC
EXTRN sub_100C8CD9:PROC
EXTRN sub_100C9AA3:PROC
EXTRN sub_100F6004:PROC
EXTRN sub_100F78E4:PROC
EXTRN sub_100F793A:PROC
EXTRN sub_100F7975:PROC
.CODE
FUN_100b3b45 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 48
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    push edi
    push dword ptr [ebx + 108]
    mov esi, ecx
    mov eax, dword ptr [esi]
    call dword ptr [eax + 0x54]
    push dword ptr [ebx + 108]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    xor edx, edx
    cmp dword ptr [esi + 000000158h], edx
    mov edi, eax
    mov dword ptr [ebp - 16], edi
    je L4
    cmp dword ptr [ebx + 108], -1
    je L22
    cmp dword ptr [ebp + 8], 00000FFFFh
    je L3
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_100C8CD9
    push edi
    push dword ptr [eax]
    lea eax, [ebp - 48]
    push 010115CC8h
    push 32
    push eax
    call sub_100F78E4
    add esp, 20
    push 1
    push dword ptr [ebx + 12]
    lea eax, [ebp - 48]
    lea ecx, [esi + 0000001D4h]
    push eax
    mov byte ptr [ebp - 17], 0
    call sub_1006A7FE
    test eax, eax
    jl L24
    inc dword ptr [esi + 0000001F0h]
    test byte ptr [esi + 0000000CCh], 1
    je L3
    mov eax, dword ptr [ebx + 96]
    test eax, eax
    je L3
    cmp dword ptr [eax + 4], 6
    jne L3
    mov edi, dword ptr [eax + 20]
    cmp dword ptr [edi + 4], 3
    jne L3
    mov eax, dword ptr [edi + 24]
    lea edx, [eax + 1]
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    add eax, 3
    push eax
    call sub_100F793A
    test eax, eax
    pop ecx
    mov dword ptr [ebp + 8], eax
    jne L1
    mov eax, 08007000Eh
    jmp L24
L1:
    push dword ptr [edi + 24]
    push 010115CB8h
    push eax
    call sub_100F6004
    add esp, 12
    push 1
    push dword ptr [ebx + 12]
    lea ecx, [esi + 0000001D4h]
    push dword ptr [ebp + 8]
    call sub_1006A87D
    push dword ptr [ebp + 8]
    mov edi, eax
    call sub_100F7975
    test edi, edi
    pop ecx
    jge L2
    mov eax, edi
    jmp L24
L2:
    inc dword ptr [esi + 0000001F0h]
L3:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L22
    mov ecx, dword ptr [ebx + 108]
    mov dword ptr [eax], ecx
    jmp L22
L4:
    cmp dword ptr [ebp + 8], 11
    jne L5
    cmp edi, dword ptr [esi + 40]
    jae L23
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], edi
    mov eax, dword ptr [esi + edi*4 + 000000218h]
    mov dword ptr [ebp - 4], 1
    jmp L6
L5:
    cmp dword ptr [ebp + 8], 6
    jne L23
    cmp edi, 8
    jae L23
    mov ecx, dword ptr [ebp + 12]
    lea eax, [edi + 2]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi + edi*4 + 0000001F8h]
    mov dword ptr [ebp - 4], 3
L6:
    cmp eax, edx
    mov dword ptr [ebp + 12], edx
    jbe L12
L7:
    mov ecx, edx
    sub ecx, 0
    je L10
    dec ecx
    je L9
    dec ecx
    je L8
    dec ecx
    jne L11
    or byte ptr [ebp + 14], 8
    jmp L11
L8:
    or byte ptr [ebp + 14], 4
    jmp L11
L9:
    or byte ptr [ebp + 14], 2
    jmp L11
L10:
    or byte ptr [ebp + 14], 1
L11:
    inc edx
    cmp edx, eax
    jb L7
L12:
    cmp dword ptr [ebp - 4], 1
    je L14
    test byte ptr [esi + 0000000CCh], 32
    jne L13
    cmp dword ptr [ebp + 8], 6
    jne L14
    test byte ptr [ebx + 3], 2
    je L14
L13:
    or byte ptr [ebp + 14], 32
L14:
    and dword ptr [ebp - 8], 0
    test byte ptr [ebx + 3], 1
    je L15
    mov dword ptr [ebp - 8], 000400000h
L15:
    push 00200001Fh
    mov ecx, esi
    call sub_100C9AA3
    test eax, eax
    jl L24
    push 080000000h
    mov ecx, esi
    call sub_100C7D40
    test eax, eax
    jl L24
    test byte ptr [esi + 0000000CCh], 1
    je L21
    and dword ptr [ebp - 12], 0
    and dword ptr [ebp + 8], 0
    or eax, 0FFFFFFFFh
    cmp dword ptr [esi + 8], 0
    lea edi, [ebp - 32]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    jbe L18
    mov edi, dword ptr [ebx + 4]
    mov ecx, dword ptr [esi + 20]
L16:
    mov eax, dword ptr [ecx]
    cmp edi, dword ptr [eax + 4]
    jne L17
    mov edx, dword ptr [ebx + 8]
    cmp edx, dword ptr [eax + 8]
    jne L17
    mov edx, dword ptr [ebx + 12]
    cmp edx, dword ptr [eax + 12]
    jne L17
    mov eax, dword ptr [eax + 16]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ebp + eax*4 - 32], edx
L17:
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    add ecx, 4
    cmp eax, dword ptr [esi + 8]
    jb L16
L18:
    mov edx, dword ptr [ebp - 12]
    xor ecx, ecx
L19:
    mov eax, dword ptr [ebp + ecx*4 - 32]
    cmp eax, -1
    je L20
    mov dword ptr [ebp + edx*4 - 32], eax
    inc edx
L20:
    inc ecx
    cmp ecx, 4
    jb L19
    mov eax, dword ptr [esi]
    push 1
    lea ecx, [ebp + 8]
    push ecx
    push edx
    lea ecx, [ebp - 32]
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x70]
    test eax, eax
    jl L24
    mov edi, dword ptr [ebp - 16]
L21:
    mov eax, dword ptr [ebp - 4]
    mov edx, dword ptr [esi]
    mov ecx, eax
    or ecx, 0FFFFFFF8h
    shl ecx, 20
    and eax, 24
    or ecx, eax
    shl ecx, 8
    push 0
    push dword ptr [ebp + 12]
    and edi, 0000007FFh
    or ecx, edi
    or ecx, dword ptr [ebp - 8]
    push ecx
    mov ecx, esi
    call dword ptr [edx + 0x64]
    test eax, eax
    jl L24
    mov ecx, esi
    call sub_100C4F90
    test eax, eax
    jl L24
L22:
    xor eax, eax
    jmp L24
L23:
    mov eax, 080004005h
L24:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100b3b45 ENDP
END
