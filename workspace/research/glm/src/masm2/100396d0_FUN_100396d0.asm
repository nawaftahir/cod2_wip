.686
.MODEL FLAT, C
EXTRN sub_100138F3:PROC
EXTRN sub_10034E0F:PROC
EXTRN sub_1003869A:PROC
EXTRN sub_10038715:PROC
EXTRN sub_10038795:PROC
EXTRN sub_10039641:PROC
EXTRN sub_100396BB:PROC
EXTRN sub_10039998:PROC
EXTRN sub_100399AD:PROC
EXTRN sub_100399BC:PROC
EXTRN sub_10039A44:PROC
EXTRN sub_10039A53:PROC
EXTRN sub_10039AF7:PROC
EXTRN sub_10039B06:PROC
EXTRN sub_10039B43:PROC
EXTRN sub_10039B71:PROC
EXTRN sub_1003C668:PROC
EXTRN sub_1003CEAF:PROC
EXTRN sub_10060D5D:PROC
EXTRN sub_10060DB8:PROC
EXTRN sub_10060E04:PROC
EXTRN sub_10060E5D:PROC
EXTRN sub_100F6D09:PROC
EXTRN sub_100F6D64:PROC
EXTRN sub_100F6DBF:PROC
EXTRN sub_100F6DC2:PROC
EXTRN sub_100F6E0A:PROC
EXTRN sub_100F6E1D:PROC
EXTRN sub_100F6E64:PROC
EXTRN sub_100F6E78:PROC
EXTRN sub_100F6EC4:PROC
EXTRN sub_100F6F1D:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766680:DWORD:DWORD
EXTRN EXTRN g_10766684:DWORD:DWORD
.CODE
FUN_100396d0 PROC
    mov mov ecx, dword ptr [edi + 4]
    sub sub esp, 12
    push push ebx
    push push ebp
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [esp + 28]
    mov mov edx, dword ptr [ecx + eax*4 + 8]
    test test edx, edx
    jne L0
    mov mov edx, dword ptr [g_1072D9BC]
    mov mov ecx, dword ptr [edx]
    mov mov edx, dword ptr [edi + 8]
    push push ecx
    mov mov ecx, dword ptr [edx]
    push push ecx
    push push eax
    push push 010198B58h
    push push 0
    call sub_100138F3
    add add esp, 20
    mov mov eax, dword ptr [edi]
    lea lea edx, [esp + 16]
    push push edx
    push push eax
    mov mov eax, dword ptr [g_1072D9BC]
    add add eax, 44
    call sub_100396BB
    mov mov ebx, dword ptr [esp + 24]
    add add esp, 8
    test test esi, esi
    je L2
    mov mov ebp, dword ptr [esi]
    mov mov ecx, dword ptr [esi + 4]
    mov mov edx, dword ptr [esi + 8]
    mov mov eax, dword ptr [esi + 12]
    and and ebx, ebp
    mov mov ebp, dword ptr [esp + 20]
    and and ebp, ecx
    or or ebx, edx
    or or ebp, eax
    mov mov dword ptr [esp + 20], ebp
    jmp L3
    mov mov ebp, dword ptr [esp + 20]
    mov mov al, byte ptr [g_1072DEBD]
    test test al, al
    je L4
    mov mov eax, dword ptr [esp + 20]
    and and eax, -49
    mov mov dword ptr [esp + 20], eax
    mov mov ebp, eax
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_10039998
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne al
    test test al, al
    je L5
    push push 010198B38h
    push push 010193358h
    push push ecx
    call sub_100F6DC2
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6D09
    add add esp, 4
    mov mov ecx, dword ptr [edi + 8]
    movzx movzx eax, byte ptr [ecx + 11]
    cdq cdq
    mov mov esi, 10
    idiv idiv esi
    push push edx
    push push eax
    mov mov eax, dword ptr [ecx]
    push push eax
    push push 010198B0Ch
    call sub_10060D5D
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 16
    test test edx, edx
    je L6
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je L7
    push push eax
L4:
    push push 010193358h
    push push ecx
    call sub_100F6E1D
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6D64
    add add esp, 4
    mov mov ecx, dword ptr [edi + 12]
    movzx movzx eax, byte ptr [ecx + 11]
    cdq cdq
    mov mov esi, 10
    idiv idiv esi
    push push edx
    push push eax
    mov mov eax, dword ptr [ecx]
    push push eax
    push push 010198AE0h
    call sub_10060DB8
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 16
    test test edx, edx
    je sub_100399AD
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je sub_100399BC
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F6E78
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
L5:
    push push edx
    call sub_100F6DBF
    add add esp, 4
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [eax]
    push push ecx
    push push 010198AC4h
    call sub_10060E04
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [edx + 8]
    add add esp, 8
    test test ecx, ecx
    je sub_10039A44
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je sub_10039A53
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F6EC4
    mov mov eax, dword ptr [g_10764584]
    add add esp, 12
    push push eax
    call sub_100F6E0A
    add add esp, 4
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [g_1072D9BC]
    mov mov edx, dword ptr [eax + 48]
    mov mov eax, dword ptr [eax + 44]
    push push ecx
    push push ebx
    push push edx
    push push eax
    push push 010198A88h
    call sub_10060E5D
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 20
    test test edx, edx
    je sub_10039AF7
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je sub_10039B06
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F6F1D
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6E64
L6:
    add add esp, 4
    cmp cmp ebx, dword ptr [g_10766680]
    je sub_10039B43
    push push ebx
    call sub_1003C668
    add add esp, 4
    mov mov dword ptr [g_10766680], ebx
    cmp cmp ebp, dword ptr [g_10766684]
    je sub_10039B71
    push push ebp
    call sub_1003CEAF
    add add esp, 4
    mov mov dword ptr [g_10766684], ebp
    xor xor eax, eax
    call sub_10034E0F
    mov mov eax, dword ptr [edi + 12]
    mov mov esi, dword ptr [eax + 12]
    call sub_1003869A
    mov mov ecx, dword ptr [edi + 8]
    mov mov esi, dword ptr [ecx + 12]
    call sub_10038715
    mov mov edx, dword ptr [edi + 4]
    mov mov eax, dword ptr [esp + 28]
    mov mov esi, dword ptr [edx + eax*4 + 8]
    call sub_10038795
    movzx movzx eax, word ptr [edi + 16]
    mov mov ecx, dword ptr [edi + 20]
    call sub_10039641
    mov mov ecx, dword ptr [edi + 24]
    movzx movzx eax, word ptr [edi + 18]
    push push ecx
    call L1
    add add esp, 4
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
FUN_100396d0 ENDP
END
