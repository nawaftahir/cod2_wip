.686
.MODEL FLAT, C
EXTRN sub_1002E39F:PROC
EXTRN sub_1003A646:PROC
EXTRN sub_1003A91A:PROC
EXTRN sub_1004116B:PROC
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DEBD:DWORD
.CODE
FUN_1002eff0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 124
    mov al, byte ptr [g_1072DEBD]
    test al, al
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov ebx, dword ptr [esi]
    push edi
    je L0
    call sub_1002E39F
L0:
    mov edi, dword ptr [ebx + 4]
    cmp dword ptr [g_1072D9BC], edi
    jne L1
    cmp dword ptr [g_1072D9C0], 3
    je L4
L1:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L2
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L3
L2:
    call sub_1003A91A
L3:
    push 31
    mov esi, 3
    call sub_1003A646
    mov esi, dword ptr [ebp + 8]
    add esp, 4
L4:
    mov edx, dword ptr [ebx + 20]
    xor eax, eax
    mov ecx, 29
    lea edi, [esp + 16]
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebx + 12]
    mov ecx, dword ptr [ebx + 16]
    mov dword ptr [esp + 76], eax
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [esp + 84], edx
    mov edx, dword ptr [ebx + 24]
    mov dword ptr [esp + 80], ecx
    mov ecx, dword ptr [ebx + 32]
    mov dword ptr [esp + 100], eax
    mov eax, edx
    mov dword ptr [esp + 20], ecx
    mov ecx, dword ptr [ebx + 28]
    mov dword ptr [esp + 116], edx
    mov edx, dword ptr [ebx + 8]
    mov dword ptr [esp + 120], eax
    lea eax, [esp + 16]
    mov dword ptr [esp + 16], 4
    mov dword ptr [esp + 000000080h], ecx
    mov dword ptr [esp + 104], edx
    call sub_1004116B
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add ecx, eax
    pop edi
    mov dword ptr [esi], ecx
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_1002eff0 ENDP
END
