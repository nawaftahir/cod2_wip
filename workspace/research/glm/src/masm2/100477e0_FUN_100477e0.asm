.686
.MODEL FLAT, C
EXTRN sub_10043F16:PROC
EXTRN sub_1004796D:PROC
EXTRN sub_10047980:PROC
EXTRN sub_100479A3:PROC
EXTRN sub_100479BE:PROC
EXTRN sub_100479DC:PROC
EXTRN sub_100479E0:PROC
EXTRN sub_100479E3:PROC
EXTRN sub_100479F0:PROC
EXTRN sub_100479F8:PROC
EXTRN sub_10047A3E:PROC
.CODE
FUN_100477e0 PROC
    sub sub esp, 8
    push push ebx
    mov mov bl, byte ptr [esp + 20]
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 24]
    mov mov ebp, dword ptr [esi + 0164h]
    mov mov dword ptr [ebp + 32], esi
    mov mov byte ptr [ebp + 12], bl
    mov mov edx, dword ptr [esi + 0134h]
    mov mov ecx, dword ptr [esi + 013Ch]
    push push edi
    xor xor edi, edi
    cmp cmp edx, edi
    sete sete al
    cmp cmp ecx, edi
    mov mov byte ptr [esp + 16], al
    jne L1
    test test al, al
    je L0
    mov mov dword ptr [ebp + 4], 010047D40h
    jmp L3
    mov mov dword ptr [ebp + 4], 010047EC0h
    jmp L4
    test test al, al
    je L2
    mov mov dword ptr [ebp + 4], 0100480C0h
    jmp L5
    cmp cmp dword ptr [ebp + 64], edi
    mov mov dword ptr [ebp + 4], 010048190h
    jne L6
    mov mov eax, dword ptr [esi + 4]
    push push 03E8h
    push push 1
    push push esi
    call call dword ptr [eax]
    add add esp, 12
    mov mov dword ptr [ebp + 64], eax
    test test bl, bl
    je L7
    mov mov dword ptr [ebp + 8], 010048470h
    jmp L8
    mov mov dword ptr [ebp + 8], 010048420h
    cmp cmp dword ptr [esi + 0ECh], edi
    mov mov dword ptr [esp + 20], edi
    jle sub_100479DC
    lea lea ecx, [ebp + 36]
    mov mov dword ptr [esp + 28], ecx
    lea lea ebx, [esi + 0F0h]
L2:
    lea lea esp, [esp]
    mov mov cl, byte ptr [esp + 16]
    test test cl, cl
    mov mov edx, dword ptr [esp + 28]
    mov mov eax, dword ptr [ebx]
    mov mov dword ptr [edx], edi
    je sub_1004796D
    cmp cmp dword ptr [esi + 013Ch], edi
    jne sub_100479E3
    mov mov edi, dword ptr [eax + 20]
    jmp sub_10047980
    mov mov edi, dword ptr [eax + 24]
    mov mov dword ptr [ebp + 52], edi
    mov mov al, byte ptr [esp + 32]
    test test al, al
    je sub_100479E0
    test test edi, edi
L6:
    jl sub_100479A3
    cmp cmp edi, 4
    jl sub_100479BE
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 50
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 24], edi
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, dword ptr [ebp + edi*4 + 92]
    test test eax, eax
    jne sub_100479F8
    mov mov eax, dword ptr [esi + 4]
    push push 0404h
    push push 1
    push push esi
    call call dword ptr [eax]
    add add esp, 12
    mov mov dword ptr [ebp + edi*4 + 92], eax
    mov mov edi, dword ptr [ebp + edi*4 + 92]
    mov mov ecx, 0101h
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    jmp sub_10047A3E
    mov mov ecx, dword ptr [esp + 16]
    push push ecx
    lea lea eax, [ebp + edi*4 + 76]
    push push esi
    mov mov ecx, edi
    call sub_10043F16
    add add esp, 8
    xor xor edi, edi
    mov mov eax, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esi + 0ECh]
    inc inc eax
    add add edx, 4
    add add ebx, 4
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 20], eax
    mov mov dword ptr [esp + 28], edx
    jl sub_100479F0
    mov mov dword ptr [ebp + 56], edi
    mov mov dword ptr [ebp + 60], edi
    mov mov dword ptr [ebp + 24], edi
    mov mov dword ptr [ebp + 28], edi
    mov mov edx, dword ptr [esi + 0C4h]
    mov mov dword ptr [ebp + 72], edi
    pop pop edi
    pop pop esi
    mov mov dword ptr [ebp + 68], edx
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_100477e0 ENDP
END
