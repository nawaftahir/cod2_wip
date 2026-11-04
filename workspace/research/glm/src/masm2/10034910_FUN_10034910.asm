.686
.MODEL FLAT, C
EXTRN sub_10023715:PROC
EXTRN sub_10034BAE:PROC
EXTRN sub_10034BC8:PROC
EXTRN sub_10034BD3:PROC
EXTRN sub_10034BFA:PROC
EXTRN sub_10034BFE:PROC
EXTRN sub_10034C0E:PROC
EXTRN sub_10034C16:PROC
EXTRN sub_10034C20:PROC
EXTRN sub_10034C97:PROC
EXTRN sub_10034CB4:PROC
EXTRN sub_10034CC1:PROC
EXTRN sub_10034D3C:PROC
EXTRN sub_10034D4C:PROC
EXTRN sub_10034D52:PROC
EXTRN sub_10034D53:PROC
EXTRN sub_10034DD2:PROC
EXTRN sub_10034DE3:PROC
EXTRN sub_10034DEB:PROC
EXTRN sub_10037A1B:PROC
EXTRN sub_10037A6C:PROC
EXTRN sub_10037AC7:PROC
EXTRN sub_10037B0B:PROC
EXTRN sub_10037B56:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE61C:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072DBC0:DWORD:DWORD
EXTRN EXTRN g_1072DBC4:DWORD:DWORD
EXTRN EXTRN g_1072DBC8:DWORD:DWORD
EXTRN EXTRN g_1072DBCC:DWORD:DWORD
EXTRN EXTRN g_1072DBD0:DWORD:DWORD
EXTRN EXTRN g_1072DBD4:DWORD:DWORD
EXTRN EXTRN g_1072DBD8:DWORD:DWORD
EXTRN EXTRN g_1072DBDC:DWORD:DWORD
EXTRN EXTRN g_1072DEC8:DWORD:DWORD
EXTRN EXTRN g_107667DC:DWORD:DWORD
EXTRN EXTRN g_107667E0:DWORD:DWORD
EXTRN EXTRN g_107667E4:DWORD:DWORD
EXTRN EXTRN g_107667E8:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10034910 PROC
    mov mov eax, dword ptr [g_1072D9C0]
    sub sub esp, 24
    cmp cmp eax, 3
    je sub_10034BAE
    push push esi
    mov mov esi, dword ptr [g_106D3194]
    mov mov eax, dword ptr [esi + 0219CECh]
    add add esi, 0219CECh
    test test eax, eax
    je sub_10034BC8
    mov mov al, byte ptr [esi + 28]
    test test al, al
    je sub_10034BD3
    mov mov eax, dword ptr [esi + 12]
    push push edi
    lea lea edi, [esi + 12]
    mov mov dword ptr [g_1072DEC8], eax
    xor xor eax, eax
    call sub_10034BFA
    lea lea eax, [esp + 16]
    mov mov ecx, edi
    call sub_10023715
    fld fld dword ptr [g_1019BC84]
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [g_1072DBD0], ecx
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [g_1072DBDC], ecx
    mov mov ecx, dword ptr [g_101CE61C]
    mov mov dword ptr [g_1072DBD8], eax
    mov mov dword ptr [g_1072DBD4], edx
    fld fld dword ptr [ecx + 8]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L0
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [esp + 8], edx
    jmp L1
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [esp + 8], eax
    fld fld dword ptr [esp + 8]
    mov mov edx, dword ptr [g_101CE708]
    fsub fsub dword ptr [esi + 16]
    fdivr fdivr dword ptr [g_1019BC78]
    fst fst dword ptr [esp + 12]
    fchs fchs
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 8]
    fld fld dword ptr [esi + 24]
    fchs fchs
    fstp fstp dword ptr [esp + 24]
    mov mov dword ptr [g_1072DBCC], 0
    fxch fxch st(1)
    mov mov ecx, dword ptr [esp + 24]
    fstp fstp dword ptr [g_1072DBC0]
    mov mov dword ptr [g_1072DBC8], ecx
    fstp fstp dword ptr [g_1072DBC4]
    mov mov eax, dword ptr [edx + 8]
    cmp cmp eax, 2
    jne sub_10034C97
    mov mov eax, dword ptr [esi]
    mov mov edi, 1
    cmp cmp eax, edi
    mov mov eax, dword ptr [g_107667DC]
    jne sub_10034C20
    cmp cmp eax, 3
    je L4
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L2
    mov mov edx, 010198340h
    call sub_10037A1B
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 3
    push push 08Ch
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L3
    mov mov dword ptr [g_107667DC], 3
    fld fld dword ptr [esi + 16]
    fld fld dword ptr [g_107667E0]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10034C16
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_10034BFE
    mov mov edx, 0101982F0h
    call sub_10037A6C
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push 36
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10034C0E
    mov mov eax, dword ptr [esi + 16]
    mov mov dword ptr [g_107667E0], eax
    fld fld dword ptr [esp + 8]
    fld fld dword ptr [g_107667E4]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10034D53
    mov mov esi, dword ptr [esp + 8]
    lea lea esp, [esp]
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_10034CB4
    mov mov edx, 0101982ACh
    call sub_10037AC7
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push esi
    push push 37
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10034CC1
    mov mov eax, dword ptr [esp + 8]
    pop pop edi
    mov mov dword ptr [g_107667E4], eax
    pop pop esi
    add add esp, 24
    ret ret
    cmp cmp eax, edi
    je sub_10034D52
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_10034D3C
    mov mov edx, 01019826Ch
    call sub_10037B0B
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push edi
    push push 08Ch
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10034D4C
    mov mov dword ptr [g_107667DC], edi
    fld fld dword ptr [esi + 24]
    fld fld dword ptr [g_107667E8]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10034DEB
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_10034DD2
    mov mov edx, 010198220h
    call sub_10037B56
    mov mov edx, dword ptr [esi + 24]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push 38
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10034DE3
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [g_107667E8], eax
    pop pop edi
    pop pop esi
    add add esp, 24
    ret ret
FUN_10034910 ENDP
END
