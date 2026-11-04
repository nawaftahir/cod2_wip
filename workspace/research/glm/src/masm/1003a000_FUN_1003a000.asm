.686
.MODEL FLAT, C
EXTRN sub_1003872C:PROC
EXTRN sub_10038744:PROC
EXTRN sub_100397C6:PROC
EXTRN sub_10039C23:PROC
EXTRN sub_1003E1C0:PROC
EXTRN sub_1003E1D6:PROC
EXTRN sub_10060CA0:PROC
EXTRN sub_100F6CA7:PROC
EXTRN sub_100F6D60:PROC
EXTRN sub_100F6DC6:PROC
EXTRN sub_100F6E7F:PROC
EXTRN g_101CE6AC:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072DBA0:DWORD
EXTRN g_1072DBA4:DWORD
EXTRN g_1072DBA8:DWORD
EXTRN g_1072DBAC:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_1003a000 PROC
    mov edx, dword ptr [g_101CE7EC]
    sub esp, 8
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [g_1072D9BC]
    mov ecx, dword ptr [eax + 56]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    mov ebp, dword ptr [ecx + edi*4 + 4]
    je L0
    mov eax, dword ptr [ebp]
    push eax
    push 0101989E4h
    call sub_10060CA0
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    test edx, edx
    je L0
    mov edx, dword ptr [g_10764584]
    test edx, edx
    setne cl
    test cl, cl
    je L0
    push eax
    push 010193358h
    push edx
    call sub_100F6D60
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6CA7
    add esp, 4
L0:
    cmp edi, 33
    jne L1
    mov eax, dword ptr [g_101CE6AC]
    mov eax, dword ptr [eax + 8]
    shl eax, 4
    add eax, 010190640h
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov dword ptr [g_1072DBA0], ecx
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [g_1072DBA4], edx
    mov edx, dword ptr [eax + 12]
    mov dword ptr [g_1072DBA8], ecx
    mov dword ptr [g_1072DBAC], edx
L1:
    cmp word ptr [ebp + 6], 0
    mov dword ptr [esp + 20], 0
    jbe L7
    lea ebx, [ebp + 13]
    lea edi, [ebp + 8]
    mov edi, edi
L2:
    mov eax, dword ptr [g_101CE708]
    mov ecx, dword ptr [eax + 8]
    mov esi, 2
    cmp ecx, esi
    jne L3
    mov ecx, dword ptr [esp + 28]
    mov eax, dword ptr [esp + 36]
    push ecx
    lea edx, [ebx - 5]
    push edx
    call sub_10039C23
    add esp, 8
    jmp L4
L3:
    mov eax, dword ptr [esp + 28]
    push eax
    mov eax, dword ptr [esp + 40]
    call sub_100397C6
    add esp, 4
L4:
    mov ecx, dword ptr [g_101CE708]
    cmp dword ptr [ecx + 8], esi
    jne L5
    cmp byte ptr [ebx], 0
    je L5
    push 0
    call sub_1003E1C0
    mov esi, dword ptr [esp + 36]
    add esp, 4
    call sub_1003872C
    push 03F800000h
    call sub_1003E1D6
    add esp, 4
    jmp L6
L5:
    mov esi, dword ptr [esp + 32]
    call sub_10038744
L6:
    mov eax, dword ptr [esp + 20]
    movzx edx, word ptr [ebp + 6]
    inc eax
    add edi, 28
    add ebx, 92
    cmp eax, edx
    mov dword ptr [esp + 20], eax
    jl L2
L7:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L8
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne al
    test al, al
    je L8
    push 010193290h
    push 010193358h
    push ecx
    call sub_100F6E7F
    mov ecx, dword ptr [g_10764584]
    add esp, 12
    push ecx
    call sub_100F6DC6
    add esp, 4
L8:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_1003a000 ENDP
END
