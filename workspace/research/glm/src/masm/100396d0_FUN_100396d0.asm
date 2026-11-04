.686
.MODEL FLAT, C
EXTRN sub_100138F3:PROC
EXTRN sub_10034E0F:PROC
EXTRN sub_1003869A:PROC
EXTRN sub_10038715:PROC
EXTRN sub_10038795:PROC
EXTRN sub_10039641:PROC
EXTRN sub_100396BB:PROC
EXTRN sub_1003973E:PROC
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
EXTRN g_101CE7EC:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072DEBD:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766680:DWORD
EXTRN g_10766684:DWORD
.CODE
FUN_100396d0 PROC
    mov ecx, dword ptr [edi + 4]
    sub esp, 12
    push ebx
    push ebp
    push esi
    mov esi, eax
    mov eax, dword ptr [esp + 28]
    mov edx, dword ptr [ecx + eax*4 + 8]
    test edx, edx
    jne L0
    mov edx, dword ptr [g_1072D9BC]
    mov ecx, dword ptr [edx]
    mov edx, dword ptr [edi + 8]
    push ecx
    mov ecx, dword ptr [edx]
    push ecx
    push eax
    push 010198B58h
    push 0
    call sub_100138F3
    add esp, 20
L0:
    mov eax, dword ptr [edi]
    lea edx, [esp + 16]
    push edx
    push eax
    mov eax, dword ptr [g_1072D9BC]
    add eax, 44
    call sub_100396BB
    mov ebx, dword ptr [esp + 24]
    add esp, 8
    test esi, esi
    je L1
    mov ebp, dword ptr [esi]
    mov ecx, dword ptr [esi + 4]
    mov edx, dword ptr [esi + 8]
    mov eax, dword ptr [esi + 12]
    and ebx, ebp
    mov ebp, dword ptr [esp + 20]
    and ebp, ecx
    or ebx, edx
    or ebp, eax
    mov dword ptr [esp + 20], ebp
    jmp L2
L1:
    mov ebp, dword ptr [esp + 20]
L2:
    mov al, byte ptr [g_1072DEBD]
    test al, al
    je L3
    mov eax, dword ptr [esp + 20]
    and eax, 0FFFFFFCFh
    mov dword ptr [esp + 20], eax
    mov ebp, eax
L3:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L8
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne al
    test al, al
    je L4
    push 010198B38h
    push 010193358h
    push ecx
    call sub_100F6DC2
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6D09
    add esp, 4
L4:
    mov ecx, dword ptr [edi + 8]
    movzx eax, byte ptr [ecx + 11]
    cdq
    mov esi, 10
    idiv esi
    push edx
    push eax
    mov eax, dword ptr [ecx]
    push eax
    push 010198B0Ch
    call sub_10060D5D
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 16
    test edx, edx
    je L5
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L5
    push eax
    push 010193358h
    push ecx
    call sub_100F6E1D
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6D64
    add esp, 4
L5:
    mov ecx, dword ptr [edi + 12]
    movzx eax, byte ptr [ecx + 11]
    cdq
    mov esi, 10
    idiv esi
    push edx
    push eax
    mov eax, dword ptr [ecx]
    push eax
    push 010198AE0h
    call sub_10060DB8
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 16
    test edx, edx
    je L6
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L6
    push eax
    push 010193358h
    push ecx
    call sub_100F6E78
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6DBF
    add esp, 4
L6:
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [eax]
    push ecx
    push 010198AC4h
    call sub_10060E04
    mov edx, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [edx + 8]
    add esp, 8
    test ecx, ecx
    je L7
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L7
    push eax
    push 010193358h
    push ecx
    call sub_100F6EC4
    mov eax, dword ptr [g_10764584]
    add esp, 12
    push eax
    call sub_100F6E0A
    add esp, 4
L7:
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [g_1072D9BC]
    mov edx, dword ptr [eax + 48]
    mov eax, dword ptr [eax + 44]
    push ecx
    push ebx
    push edx
    push eax
    push 010198A88h
    call sub_10060E5D
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 20
    test edx, edx
    je L8
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L8
    push eax
    push 010193358h
    push ecx
    call sub_100F6F1D
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6E64
    add esp, 4
L8:
    cmp ebx, dword ptr [g_10766680]
    je L9
    push ebx
    call sub_1003C668
    add esp, 4
    mov dword ptr [g_10766680], ebx
L9:
    cmp ebp, dword ptr [g_10766684]
    je L10
    push ebp
    call sub_1003CEAF
    add esp, 4
    mov dword ptr [g_10766684], ebp
L10:
    xor eax, eax
    call sub_10034E0F
    mov eax, dword ptr [edi + 12]
    mov esi, dword ptr [eax + 12]
    call sub_1003869A
    mov ecx, dword ptr [edi + 8]
    mov esi, dword ptr [ecx + 12]
    call sub_10038715
    mov edx, dword ptr [edi + 4]
    mov eax, dword ptr [esp + 28]
    mov esi, dword ptr [edx + eax*4 + 8]
    call sub_10038795
    movzx eax, word ptr [edi + 16]
    mov ecx, dword ptr [edi + 20]
    call sub_10039641
    mov ecx, dword ptr [edi + 24]
    movzx eax, word ptr [edi + 18]
    push ecx
    call sub_1003973E
    add esp, 4
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
FUN_100396d0 ENDP
END
