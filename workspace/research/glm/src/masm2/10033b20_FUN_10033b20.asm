.686
.MODEL FLAT, C
EXTRN sub_10012001:PROC
EXTRN sub_1001393D:PROC
EXTRN sub_1002BB7C:PROC
EXTRN sub_100308D9:PROC
EXTRN sub_10033C8D:PROC
EXTRN sub_10033CD6:PROC
EXTRN sub_10033CF9:PROC
EXTRN sub_10033D02:PROC
EXTRN sub_10037934:PROC
EXTRN sub_100EFEAC:PROC
EXTRN sub_100F6C7A:PROC
EXTRN sub_100F6D36:PROC
EXTRN EXTRN fp_101D4A5C:DWORD:DWORD
EXTRN EXTRN g_101CE62C:DWORD:DWORD
EXTRN EXTRN g_101CE6F8:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D492C:DWORD:DWORD
EXTRN EXTRN g_101D4934:DWORD:DWORD
EXTRN EXTRN g_101D497C:DWORD:DWORD
EXTRN EXTRN g_101D4C94:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10033b20 PROC
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    sub sub esp, 0200h
    test test ecx, ecx
    je L0
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne al
    test test al, al
    je L1
    push push 0101979BCh
    push push 010193358h
    push push ecx
    call sub_100F6D36
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6C7A
    add add esp, 16
    mov mov edx, dword ptr [g_101D4934]
    push push 0
    push push 0
    push push 0
    push push 0
    shl shl edx, 4
    mov mov eax, dword ptr [edx + 0101D4940h]
    mov mov ecx, dword ptr [eax]
    push push 0
    push push eax
    call call dword ptr [ecx + 12]
    test test eax, eax
L1:
    jge L3
    cmp cmp eax, 088760868h
    je L2
    push push eax
    call sub_100EFEAC
    push push eax
    push push 010197994h
    push push 0
    call sub_1001393D
    add add esp, 12
    mov mov byte ptr [g_101D492C], 1
    call sub_1002BB7C
    mov mov edx, dword ptr [g_101D497C]
    mov mov dword ptr [edx], 0
    mov mov byte ptr [g_1072DEBD], 0
    call sub_10037934
    mov mov eax, dword ptr [g_101CE62C]
    mov mov cl, byte ptr [eax + 7]
    test test cl, cl
    jne sub_10033C8D
    mov mov ecx, dword ptr [g_101CE6F8]
    mov mov dl, byte ptr [ecx + 7]
    test test dl, dl
    je sub_10033CD6
    push push eax
    call dword ptr [fp_101D4A5C]
    mov mov edx, dword ptr [g_101CE6F8]
    push push edx
    call dword ptr [fp_101D4A5C]
    mov mov eax, dword ptr [g_101CE6F8]
    mov mov cl, byte ptr [eax + 8]
    add add esp, 8
    test test cl, cl
    jne sub_10033CF9
    mov mov al, byte ptr [g_101D4C94]
    test test al, al
    je sub_10033D02
    lea lea ecx, [esp]
    call sub_10012001
    lea lea eax, [esp]
    call sub_100308D9
    add add esp, 0200h
    ret ret
FUN_10033b20 ENDP
END
