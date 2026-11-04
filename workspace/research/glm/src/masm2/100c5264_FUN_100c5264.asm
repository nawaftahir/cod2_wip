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
EXTRN sub_100C549E:PROC
EXTRN sub_100C54BA:PROC
EXTRN sub_100C54C0:PROC
EXTRN sub_100C54C6:PROC
EXTRN sub_100C54D2:PROC
EXTRN sub_100C54D4:PROC
EXTRN sub_100C54DC:PROC
EXTRN sub_100C54F4:PROC
EXTRN sub_100C5510:PROC
EXTRN sub_100C5521:PROC
EXTRN sub_100C5534:PROC
EXTRN sub_100C5544:PROC
EXTRN sub_100C5546:PROC
EXTRN sub_100C5557:PROC
EXTRN sub_100C555B:PROC
EXTRN sub_100C5560:PROC
EXTRN sub_100C556B:PROC
EXTRN sub_100C5573:PROC
EXTRN sub_100C5580:PROC
EXTRN sub_100C5648:PROC
EXTRN sub_100C564D:PROC
.CODE
FUN_100c5264 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0208h
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov esi, ecx
    mov mov ecx, dword ptr [edi + 104]
    xor xor eax, eax
    cmp cmp ecx, eax
    mov mov dword ptr [ebp - 4], eax
    jne L0
    or or byte ptr [edi + 3], 64
    mov mov edx, dword ptr [esi]
    push push eax
    push push eax
    mov mov ecx, esi
    call call dword ptr [edx + 80]
    mov mov dword ptr [edi + 108], eax
    xor xor eax, eax
    jmp L3
    cmp cmp dword ptr [esi + 0158h], 0
    mov mov eax, dword ptr [edi + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edx + eax*4]
    push push ebx
    mov mov ebx, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 8], eax
    je L4
    mov mov eax, ebx
    lea lea edx, [eax + 1]
    mov mov dword ptr [ebp + 8], edx
    mov mov dl, byte ptr [eax]
    inc inc eax
    test test dl, dl
    jne L1
    sub sub eax, dword ptr [ebp + 8]
    cmp cmp eax, 2
    jbe L5
    mov mov eax, 01010EFFCh
    mov mov ax, word ptr [eax]
    cmp cmp ax, word ptr [ebx]
    jne L6
    cmp cmp dword ptr [edi + 112], 4
    jbe L2
    push push ebx
    push push 01011A48Ch
    push push 011BFh
    push push ecx
    push push esi
    call sub_1008B14B
    add add esp, 20
    mov mov dword ptr [ebp - 4], 1
    lea lea ecx, [esi + 01B4h]
    push push ebx
    call sub_10068C72
    test test eax, eax
    jne L7
    push push 1
    push push dword ptr [esi + 01D0h]
    lea lea ecx, [esi + 01B4h]
    push push ebx
    call sub_1006A83B
    test test eax, eax
    jl L9
    mov mov eax, dword ptr [esi + 01D0h]
    lea lea ecx, [eax + 1]
    mov mov dword ptr [esi + 01D0h], ecx
    jmp L8
    mov mov eax, dword ptr [eax + 4]
    mov mov edx, dword ptr [esi]
    push push eax
    push push 0FFFFh
    mov mov ecx, esi
    call call dword ptr [edx + 80]
    mov mov dword ptr [edi + 108], eax
    mov mov eax, dword ptr [ebp - 4]
    neg neg eax
    sbb sbb eax, eax
    and and eax, 080004005h
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret 8
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp dword ptr [edi + 108], -1
    je sub_100C54BA
    test test byte ptr [edi + 3], 64
    je sub_100C54C0
    cmp cmp dword ptr [ebp + 12], 0
    jne sub_100C54C6
    push push 0200h
    lea lea eax, [ebp - 0208h]
    push push eax
    push push edi
    mov mov ecx, esi
    call sub_1008659A
    lea lea eax, [ebp - 0208h]
L3:
    push push eax
    push push 01011A480h
    push push 01196h
    push push dword ptr [edi + 104]
    push push esi
    call sub_1008B1F7
    add add esp, 20
    mov mov dword ptr [ebp - 4], 1
    jmp sub_100C549E
    test test byte ptr [esi + 112], 64
    mov mov eax, dword ptr [eax + 4]
    je sub_100C5580
    test test al, 16
    je sub_100C555B
    test test ah, 2
    jne sub_100C5560
    lea lea eax, [ebp - 4]
    push push eax
    push push 2
    push push dword ptr [esi + 0F0h]
L5:
    mov mov ecx, esi
    push push edi
    call sub_100BAA0C
    test test eax, eax
    jl sub_100C54D4
    cmp cmp dword ptr [edi + 108], 10
    jne sub_100C54D2
    cmp cmp dword ptr [edi + 16], 0
    jne sub_100C54DC
    push push edi
    mov mov ecx, esi
    call sub_10086475
    push push eax
    push push 01011A45Ch
    jmp sub_100C5534
    test test al, 32
    je sub_100C54F4
    lea lea eax, [ebp - 4]
    push push eax
    push push 2
    push push dword ptr [esi + 0F4h]
    mov mov ecx, esi
    push push edi
    call sub_100BAA50
    test test eax, eax
    jge sub_100C5510
L9:
    jmp sub_100C5521
    test test al, 16
    je sub_100C5648
    test test ah, 2
    jne sub_100C564D
    lea lea eax, [ebp - 4]
    push push eax
    push push 1
    push push dword ptr [esi + 0F4h]
    mov mov ecx, esi
    push push edi
    call sub_100BAA7A
    test test eax, eax
    jl sub_100C5546
    cmp cmp dword ptr [esi + 40], 2
    jne sub_100C5544
    push push dword ptr [edi + 108]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 84]
    cmp cmp eax, 11
    jne sub_100C5557
    or or word ptr [edi], 0114h
    fldz fldz
    fstp fstp qword ptr [edi + 32]
    fld1 fld1
    fstp fstp qword ptr [edi + 40]
    jmp sub_100C556B
    test test al, 32
    je sub_100C5573
    lea lea eax, [ebp - 4]
    push push eax
    push push 1
    push push dword ptr [esi + 0F8h]
    jmp sub_100C5648
FUN_100c5264 ENDP
END
