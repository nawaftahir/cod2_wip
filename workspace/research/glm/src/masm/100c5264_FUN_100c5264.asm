.686
.MODEL FLAT, C
EXTRN sub_10068C72:PROC
EXTRN sub_1006A83B:PROC
EXTRN sub_10086475:PROC
EXTRN sub_1008659A:PROC
EXTRN sub_1008B14B:PROC
EXTRN sub_1008B1F7:PROC
EXTRN sub_100BAA0C:PROC
EXTRN sub_100BAA50:PROC
EXTRN sub_100BAA7A:PROC
.CODE
FUN_100c5264 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000208h
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov esi, ecx
    mov ecx, dword ptr [edi + 104]
    xor eax, eax
    cmp ecx, eax
    mov dword ptr [ebp - 4], eax
    jne L0
    or byte ptr [edi + 3], 64
    mov edx, dword ptr [esi]
    push eax
    push eax
    mov ecx, esi
    call dword ptr [edx + 0x50]
    mov dword ptr [edi + 108], eax
    xor eax, eax
    jmp L7
L0:
    cmp dword ptr [esi + 000000158h], 0
    mov eax, dword ptr [edi + 4]
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [edx + eax*4]
    push ebx
    mov ebx, dword ptr [ecx + 24]
    mov dword ptr [ebp - 8], eax
    je L9
    mov eax, ebx
    lea edx, [eax + 1]
    mov dword ptr [ebp + 8], edx
L1:
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L1
    sub eax, dword ptr [ebp + 8]
    cmp eax, 2
    jbe L8
    mov eax, 01010EFFCh
    mov ax, word ptr [eax]
    cmp ax, word ptr [ebx]
    jne L8
    cmp dword ptr [edi + 112], 4
    jbe L2
    push ebx
    push 01011A48Ch
    push 0000011BFh
    push ecx
    push esi
    call sub_1008B14B
    add esp, 20
    mov dword ptr [ebp - 4], 1
L2:
    lea ecx, [esi + 0000001B4h]
    push ebx
    call sub_10068C72
    test eax, eax
    jne L3
    push 1
    push dword ptr [esi + 0000001D0h]
    lea ecx, [esi + 0000001B4h]
    push ebx
    call sub_1006A83B
    test eax, eax
    jl L6
    mov eax, dword ptr [esi + 0000001D0h]
    lea ecx, [eax + 1]
    mov dword ptr [esi + 0000001D0h], ecx
    jmp L4
L3:
    mov eax, dword ptr [eax + 4]
L4:
    mov edx, dword ptr [esi]
    push eax
    push 00000FFFFh
    mov ecx, esi
    call dword ptr [edx + 0x50]
    mov dword ptr [edi + 108], eax
L5:
    mov eax, dword ptr [ebp - 4]
    neg eax
    sbb eax, eax
    and eax, 080004005h
L6:
    pop ebx
L7:
    pop edi
    pop esi
    leave
    ret 8
L8:
    mov eax, dword ptr [ebp - 8]
L9:
    cmp dword ptr [edi + 108], -1
    je L11
    test byte ptr [edi + 3], 64
    je L11
    cmp dword ptr [ebp + 12], 0
    jne L11
    push 000000200h
    lea eax, [ebp - 000000208h]
    push eax
    push edi
    mov ecx, esi
    call sub_1008659A
    lea eax, [ebp - 000000208h]
    push eax
    push 01011A480h
L10:
    push 000001196h
    push dword ptr [edi + 104]
    push esi
    call sub_1008B1F7
    add esp, 20
    mov dword ptr [ebp - 4], 1
    jmp L5
L11:
    test byte ptr [esi + 112], 64
    mov eax, dword ptr [eax + 4]
    je L14
    test al, 16
    je L12
    test ah, 2
    jne L12
    lea eax, [ebp - 4]
    push eax
    push 2
    push dword ptr [esi + 0000000F0h]
    mov ecx, esi
    push edi
    call sub_100BAA0C
    test eax, eax
    jl L6
    cmp dword ptr [edi + 108], 10
    jne L5
    cmp dword ptr [edi + 16], 0
    jne L5
    push edi
    mov ecx, esi
    call sub_10086475
    push eax
    push 01011A45Ch
    jmp L10
L12:
    test al, 32
    je L5
    lea eax, [ebp - 4]
    push eax
    push 2
    push dword ptr [esi + 0000000F4h]
L13:
    mov ecx, esi
    push edi
    call sub_100BAA50
    test eax, eax
    jge L5
    jmp L6
L14:
    test al, 16
    je L15
    test ah, 2
    jne L15
    lea eax, [ebp - 4]
    push eax
    push 1
    push dword ptr [esi + 0000000F4h]
    mov ecx, esi
    push edi
    call sub_100BAA7A
    test eax, eax
    jl L6
    cmp dword ptr [esi + 40], 2
    jne L5
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    cmp eax, 11
    jne L5
    or word ptr [edi], 000000114h
    fldz
    fstp qword ptr [edi + 32]
    fld1
    fstp qword ptr [edi + 40]
    jmp L5
L15:
    test al, 32
    je L5
    lea eax, [ebp - 4]
    push eax
    push 1
    push dword ptr [esi + 0000000F8h]
    jmp L13
FUN_100c5264 ENDP
END
