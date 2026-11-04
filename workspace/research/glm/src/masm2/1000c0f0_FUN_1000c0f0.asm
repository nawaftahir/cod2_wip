.686
.MODEL FLAT, C
EXTRN sub_1000C252:PROC
EXTRN sub_1000C25B:PROC
EXTRN sub_1000C26D:PROC
EXTRN sub_1000C275:PROC
EXTRN sub_1000C27E:PROC
EXTRN sub_1000C287:PROC
EXTRN sub_1000C28C:PROC
EXTRN sub_1000C290:PROC
EXTRN sub_1000C29F:PROC
EXTRN sub_1000C2A4:PROC
EXTRN sub_1000C2AD:PROC
EXTRN sub_1000C2C6:PROC
EXTRN sub_1000C2CF:PROC
EXTRN sub_1000C2E8:PROC
EXTRN sub_1000C303:PROC
EXTRN sub_1000C30B:PROC
EXTRN sub_1000C30F:PROC
EXTRN sub_1000C34B:PROC
EXTRN sub_1000C37C:PROC
EXTRN EXTRN g_1019BD54:DWORD:DWORD
.CODE
FUN_1000c0f0 PROC
    mov mov ecx, dword ptr [esp + 8]
    mov mov edx, dword ptr [ecx]
    sub sub esp, 12
    cmp cmp edx, 03FFh
    jle L0
    mov mov dword ptr [ecx], 03FFh
    mov mov edx, dword ptr [esp + 24]
    push push ebp
    push push esi
    mov mov byte ptr [ebx], 0
    push push edi
    xor xor edi, edi
    mov mov byte ptr [edx], 0
    mov mov edx, dword ptr [ecx]
L0:
    xor xor esi, esi
    or or ebp, -1
    cmp cmp edx, edi
    mov mov dword ptr [esp + 16], 7
    mov mov dword ptr [esp + 12], edi
    jle sub_1000C26D
    mov mov ecx, dword ptr [esp + 28]
    mov mov dx, word ptr [ecx + edi*2]
    movzx movzx ecx, dx
    shr shr ecx, 8
    cmp cmp ecx, dword ptr [esp + 16]
    je L2
    cmp cmp ecx, 13
    je sub_1000C275
    cmp cmp ecx, 16
    je sub_1000C27E
    cmp cmp ecx, 17
    je sub_1000C287
    cmp cmp ecx, 18
    je sub_1000C290
    cmp cmp ecx, 10
    jne L1
    test test eax, eax
    je sub_1000C28C
    and and edx, 0FFh
    mov mov dword ptr [esp + 20], edx
    fild fild dword ptr [esp + 20]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [eax]
    jmp sub_1000C2A4
    cmp cmp ecx, 11
    jne sub_1000C25B
    test test eax, eax
    je sub_1000C2AD
    and and edx, 0FFh
    mov mov dword ptr [esp + 20], edx
    fild fild dword ptr [esp + 20]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [eax + 4]
    jmp sub_1000C2C6
    cmp cmp ecx, 12
    jne sub_1000C29F
    test test eax, eax
    je sub_1000C2CF
    and and edx, 0FFh
    mov mov dword ptr [esp + 20], edx
    fild fild dword ptr [esp + 20]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [eax + 8]
    jmp sub_1000C2E8
    mov mov byte ptr [esi + ebx], 94
    mov mov dword ptr [esp + 16], ecx
    inc inc esi
    add add cl, 48
    mov mov byte ptr [esi + ebx], cl
    inc inc esi
    mov mov edx, dword ptr [esp + 28]
    mov mov cl, byte ptr [edx + edi*2]
    cmp cmp cl, 32
    mov mov byte ptr [esi + ebx], cl
    jne sub_1000C303
    cmp cmp ebp, -1
    jne sub_1000C30B
    mov mov ebp, esi
    jmp sub_1000C30F
    or or ebp, -1
    inc inc esi
    mov mov ecx, dword ptr [esp + 32]
    mov mov edx, dword ptr [ecx]
    inc inc edi
    cmp cmp edi, edx
    jl sub_1000C252
    jmp sub_1000C34B
    mov mov edx, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 36]
    lea lea eax, [edx + edi*2]
    mov mov dword ptr [esp + 12], eax
    or or ebp, -1
    mov mov byte ptr [ecx], 1
    mov mov ecx, dword ptr [esp + 32]
    test test ebp, ebp
    mov mov byte ptr [esi + ebx], 0
    jl sub_1000C37C
    mov mov byte ptr [ebx + ebp], 0
    mov mov eax, dword ptr [ecx]
    sub sub eax, edi
    pop pop edi
    pop pop esi
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 4]
    pop pop ebp
    add add esp, 12
    ret ret
FUN_1000c0f0 ENDP
END
