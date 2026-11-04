.686
.MODEL FLAT, C
EXTRN sub_1003872C:PROC
EXTRN sub_10038744:PROC
EXTRN sub_100397C6:PROC
EXTRN sub_10039C23:PROC
EXTRN sub_1003A1B9:PROC
EXTRN sub_1003A1E1:PROC
EXTRN sub_1003A207:PROC
EXTRN sub_1003A20F:PROC
EXTRN sub_1003A22F:PROC
EXTRN sub_1003A234:PROC
EXTRN sub_1003A25F:PROC
EXTRN sub_1003A2E7:PROC
EXTRN sub_1003A2F6:PROC
EXTRN sub_1003E1C0:PROC
EXTRN sub_1003E1D6:PROC
EXTRN sub_10060CA0:PROC
EXTRN sub_100F6CA7:PROC
EXTRN sub_100F6D60:PROC
EXTRN sub_100F6DC6:PROC
EXTRN sub_100F6E7F:PROC
EXTRN EXTRN g_101CE6AC:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072DBA0:DWORD:DWORD
EXTRN EXTRN g_1072DBA4:DWORD:DWORD
EXTRN EXTRN g_1072DBA8:DWORD:DWORD
EXTRN EXTRN g_1072DBAC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_1003a000 PROC
    mov mov edx, dword ptr [g_101CE7EC]
    sub sub esp, 8
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [g_1072D9BC]
    mov mov ecx, dword ptr [eax + 56]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    mov mov ebp, dword ptr [ecx + edi*4 + 4]
    je L0
    mov mov eax, dword ptr [ebp]
    push push eax
    push push 0101989E4h
    call sub_10060CA0
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je L1
    mov mov edx, dword ptr [g_10764584]
    test test edx, edx
    setne setne cl
    test test cl, cl
    je L2
    push push eax
    push push 010193358h
    push push edx
    call sub_100F6D60
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6CA7
    add add esp, 4
    cmp cmp edi, 33
    jne L3
    mov mov eax, dword ptr [g_101CE6AC]
    mov mov eax, dword ptr [eax + 8]
    shl shl eax, 4
    add add eax, 010190640h
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [g_1072DBA0], ecx
    mov mov ecx, dword ptr [eax + 8]
    mov mov dword ptr [g_1072DBA4], edx
    mov mov edx, dword ptr [eax + 12]
    mov mov dword ptr [g_1072DBA8], ecx
    mov mov dword ptr [g_1072DBAC], edx
    cmp cmp word ptr [ebp + 6], 0
    mov mov dword ptr [esp + 20], 0
    jbe sub_1003A207
    lea lea ebx, [ebp + 13]
    lea lea edi, [ebp + 8]
    mov mov edi, edi
    mov mov eax, dword ptr [g_101CE708]
    mov mov ecx, dword ptr [eax + 8]
    mov mov esi, 2
    cmp cmp ecx, esi
    jne sub_1003A1B9
    mov mov ecx, dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 36]
    push push ecx
    lea lea edx, [ebx - 5]
    push push edx
    call sub_10039C23
    add add esp, 8
    jmp sub_1003A1E1
    mov mov eax, dword ptr [esp + 28]
    push push eax
    mov mov eax, dword ptr [esp + 40]
    call sub_100397C6
    add add esp, 4
    mov mov ecx, dword ptr [g_101CE708]
    cmp cmp dword ptr [ecx + 8], esi
    jne sub_1003A22F
    cmp cmp byte ptr [ebx], 0
    je sub_1003A234
    push push 0
    call sub_1003E1C0
    mov mov esi, dword ptr [esp + 36]
    add add esp, 4
L3:
    call sub_1003872C
    push push 03F800000h
    call sub_1003E1D6
    add add esp, 4
    jmp sub_1003A25F
    mov mov esi, dword ptr [esp + 32]
    call sub_10038744
    mov mov eax, dword ptr [esp + 20]
    movzx movzx edx, word ptr [ebp + 6]
    inc inc eax
    add add edi, 28
    add add ebx, 92
    cmp cmp eax, edx
    mov mov dword ptr [esp + 20], eax
    jl sub_1003A20F
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003A2E7
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne al
    test test al, al
    je sub_1003A2F6
    push push 010193290h
    push push 010193358h
    push push ecx
    call sub_100F6E7F
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 12
    push push ecx
    call sub_100F6DC6
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_1003a000 ENDP
END
