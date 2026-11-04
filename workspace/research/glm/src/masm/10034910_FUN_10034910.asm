.686
.MODEL FLAT, C
EXTRN sub_10023715:PROC
EXTRN sub_10034BFA:PROC
EXTRN sub_10037A1B:PROC
EXTRN sub_10037A6C:PROC
EXTRN sub_10037AC7:PROC
EXTRN sub_10037B0B:PROC
EXTRN sub_10037B56:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_101CE61C:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_106D3194:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072DBC0:DWORD
EXTRN g_1072DBC4:DWORD
EXTRN g_1072DBC8:DWORD
EXTRN g_1072DBCC:DWORD
EXTRN g_1072DBD0:DWORD
EXTRN g_1072DBD4:DWORD
EXTRN g_1072DBD8:DWORD
EXTRN g_1072DBDC:DWORD
EXTRN g_1072DEC8:DWORD
EXTRN g_107667DC:DWORD
EXTRN g_107667E0:DWORD
EXTRN g_107667E4:DWORD
EXTRN g_107667E8:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10034910 PROC
    mov eax, dword ptr [g_1072D9C0]
    sub esp, 24
    cmp eax, 3
    je L18
    push esi
    mov esi, dword ptr [g_106D3194]
    mov eax, dword ptr [esi + 000219CECh]
    add esi, 000219CECh
    test eax, eax
    je L17
    mov al, byte ptr [esi + 28]
    test al, al
    je L17
    mov eax, dword ptr [esi + 12]
    push edi
    lea edi, [esi + 12]
    mov dword ptr [g_1072DEC8], eax
    xor eax, eax
    call sub_10034BFA
    lea eax, [esp + 16]
    mov ecx, edi
    call sub_10023715
    fld dword ptr [g_1019BC84]
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 24]
    mov edx, dword ptr [esp + 20]
    mov dword ptr [g_1072DBD0], ecx
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [g_1072DBDC], ecx
    mov ecx, dword ptr [g_101CE61C]
    mov dword ptr [g_1072DBD8], eax
    mov dword ptr [g_1072DBD4], edx
    fld dword ptr [ecx + 8]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L0
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [esp + 8], edx
    jmp L1
L0:
    mov eax, dword ptr [esi + 20]
    mov dword ptr [esp + 8], eax
L1:
    fld dword ptr [esp + 8]
    mov edx, dword ptr [g_101CE708]
    fsub dword ptr [esi + 16]
    fdivr dword ptr [g_1019BC78]
    fst dword ptr [esp + 12]
    fchs
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 8]
    fld dword ptr [esi + 24]
    fchs
    fstp dword ptr [esp + 24]
    mov dword ptr [g_1072DBCC], 0
    fxch st(1)
    mov ecx, dword ptr [esp + 24]
    fstp dword ptr [g_1072DBC0]
    mov dword ptr [g_1072DBC8], ecx
    fstp dword ptr [g_1072DBC4]
    mov eax, dword ptr [edx + 8]
    cmp eax, 2
    jne L16
    mov eax, dword ptr [esi]
    mov edi, 1
    cmp eax, edi
    mov eax, dword ptr [g_107667DC]
    jne L10
    cmp eax, 3
    je L4
L2:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L3
    mov edx, 010198340h
    call sub_10037A1B
L3:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 3
    push 00000008Ch
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
    mov dword ptr [g_107667DC], 3
L4:
    fld dword ptr [esi + 16]
    fld dword ptr [g_107667E0]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L7
L5:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L6
    mov edx, 0101982F0h
    call sub_10037A6C
L6:
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edx
    push 36
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L5
    mov eax, dword ptr [esi + 16]
    mov dword ptr [g_107667E0], eax
L7:
    fld dword ptr [esp + 8]
    fld dword ptr [g_107667E4]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L16
    mov esi, dword ptr [esp + 8]
    lea esp, [esp]
L8:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L9
    mov edx, 0101982ACh
    call sub_10037AC7
L9:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push esi
    push 37
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L8
    mov eax, dword ptr [esp + 8]
    pop edi
    mov dword ptr [g_107667E4], eax
    pop esi
    add esp, 24
    ret
L10:
    cmp eax, edi
    je L13
L11:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L12
    mov edx, 01019826Ch
    call sub_10037B0B
L12:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push edi
    push 00000008Ch
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L11
    mov dword ptr [g_107667DC], edi
L13:
    fld dword ptr [esi + 24]
    fld dword ptr [g_107667E8]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L16
L14:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L15
    mov edx, 010198220h
    call sub_10037B56
L15:
    mov edx, dword ptr [esi + 24]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edx
    push 38
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L14
    mov eax, dword ptr [esi + 24]
    mov dword ptr [g_107667E8], eax
L16:
    pop edi
L17:
    pop esi
L18:
    add esp, 24
    ret
FUN_10034910 ENDP
END
