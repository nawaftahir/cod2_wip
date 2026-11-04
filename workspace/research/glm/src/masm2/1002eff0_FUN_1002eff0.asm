.686
.MODEL FLAT, C
EXTRN sub_1002E39F:PROC
EXTRN sub_1003A646:PROC
EXTRN sub_1003A91A:PROC
EXTRN sub_1004116B:PROC
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
.CODE
FUN_1002eff0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 124
    mov mov al, byte ptr [g_1072DEBD]
    test test al, al
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [esi]
    push push edi
    je L0
    call sub_1002E39F
    mov mov edi, dword ptr [ebx + 4]
    cmp cmp dword ptr [g_1072D9BC], edi
    jne L1
    cmp cmp dword ptr [g_1072D9C0], 3
    je L3
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L2
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L3
    call sub_1003A91A
    push push 31
    mov mov esi, 3
    call sub_1003A646
    mov mov esi, dword ptr [ebp + 8]
    add add esp, 4
    mov mov edx, dword ptr [ebx + 20]
    xor xor eax, eax
    mov mov ecx, 29
    lea lea edi, [esp + 16]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebx + 12]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov dword ptr [esp + 76], eax
    mov mov eax, dword ptr [ebx + 4]
    mov mov dword ptr [esp + 84], edx
    mov mov edx, dword ptr [ebx + 24]
    mov mov dword ptr [esp + 80], ecx
    mov mov ecx, dword ptr [ebx + 32]
    mov mov dword ptr [esp + 100], eax
    mov mov eax, edx
    mov mov dword ptr [esp + 20], ecx
    mov mov ecx, dword ptr [ebx + 28]
    mov mov dword ptr [esp + 116], edx
    mov mov edx, dword ptr [ebx + 8]
    mov mov dword ptr [esp + 120], eax
    lea lea eax, [esp + 16]
    mov mov dword ptr [esp + 16], 4
    mov mov dword ptr [esp + 080h], ecx
    mov mov dword ptr [esp + 104], edx
    call sub_1004116B
    mov mov eax, dword ptr [esi]
    movzx movzx ecx, word ptr [eax + 2]
    add add ecx, eax
    pop pop edi
    mov mov dword ptr [esi], ecx
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1002eff0 ENDP
END
