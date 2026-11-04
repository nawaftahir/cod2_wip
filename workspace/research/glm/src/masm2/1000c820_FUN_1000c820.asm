.686
.MODEL FLAT, C
EXTRN sub_1000C907:PROC
EXTRN sub_1000C90A:PROC
EXTRN sub_1000C91C:PROC
EXTRN sub_1000C923:PROC
EXTRN sub_1000C928:PROC
EXTRN sub_1000D4A9:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN g_101D0A78:DWORD:DWORD
.CODE
FUN_1000c820 PROC
    mov mov eax, 0202Ch
    call sub_100F883A
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 02038h]
    push push esi
    push push edi
    xor xor esi, esi
    lea lea edi, [esp + 56]
    mov mov ebx, 01000C7E0h
    mov mov dword ptr [esp + 56], esi
    call sub_1000D4A9
    mov mov edi, dword ptr [esp + 56]
    xor xor eax, eax
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], eax
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 36], eax
    mov mov dword ptr [esp + 40], eax
    mov mov dword ptr [esp + 44], eax
    mov mov dword ptr [esp + 48], eax
    xor xor edx, edx
    test test edi, edi
    mov mov dword ptr [esp + 52], eax
    jle sub_1000C907
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + edx*4 + 60]
    mov mov ecx, dword ptr [eax + 16]
    movzx movzx eax, byte ptr [eax + 12]
    mov mov ebx, dword ptr [esp + eax*4 + 16]
    add add ebx, ecx
    test test eax, eax
    mov mov dword ptr [esp + eax*4 + 16], ebx
    jl sub_1000C91C
    cmp cmp eax, 1
    jle sub_1000C923
    cmp cmp eax, 4
    je sub_1000C928
    add add esi, ecx
    inc inc edx
    cmp cmp edx, edi
    jl sub_1000C90A
    mov mov ecx, dword ptr [esp + 32]
    mov mov dword ptr [ebp], esi
    pop pop edi
    mov mov dword ptr [ebp + 4], ecx
    mov mov edx, dword ptr [g_101D0A78]
    pop pop esi
    mov mov dword ptr [ebp + 8], edx
    pop pop ebp
    pop pop ebx
    add add esp, 0202Ch
    ret ret
FUN_1000c820 ENDP
END
