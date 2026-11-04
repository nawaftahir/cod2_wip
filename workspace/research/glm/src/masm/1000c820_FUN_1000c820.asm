.686
.MODEL FLAT, C
EXTRN sub_1000D4A9:PROC
EXTRN sub_100F883A:PROC
EXTRN g_101D0A78:DWORD
.CODE
FUN_1000c820 PROC
    mov eax, 00000202Ch
    call sub_100F883A
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 000002038h]
    push esi
    push edi
    xor esi, esi
    lea edi, [esp + 56]
    mov ebx, 01000C7E0h
    mov dword ptr [esp + 56], esi
    call sub_1000D4A9
    mov edi, dword ptr [esp + 56]
    xor eax, eax
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 36], eax
    mov dword ptr [esp + 40], eax
    mov dword ptr [esp + 44], eax
    mov dword ptr [esp + 48], eax
    xor edx, edx
    test edi, edi
    mov dword ptr [esp + 52], eax
    jle L3
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [esp + edx*4 + 60]
    mov ecx, dword ptr [eax + 16]
    movzx eax, byte ptr [eax + 12]
    mov ebx, dword ptr [esp + eax*4 + 16]
    add ebx, ecx
    test eax, eax
    mov dword ptr [esp + eax*4 + 16], ebx
    jl L1
    cmp eax, 1
    jle L2
    cmp eax, 4
    je L2
L1:
    add esi, ecx
L2:
    inc edx
    cmp edx, edi
    jl L0
L3:
    mov ecx, dword ptr [esp + 32]
    mov dword ptr [ebp], esi
    pop edi
    mov dword ptr [ebp + 4], ecx
    mov edx, dword ptr [g_101D0A78]
    pop esi
    mov dword ptr [ebp + 8], edx
    pop ebp
    pop ebx
    add esp, 00000202Ch
    ret
FUN_1000c820 ENDP
END
