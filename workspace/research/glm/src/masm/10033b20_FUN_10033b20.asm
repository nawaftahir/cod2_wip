.686
.MODEL FLAT, C
EXTRN sub_10012001:PROC
EXTRN sub_1001393D:PROC
EXTRN sub_1002BB7C:PROC
EXTRN sub_100308D9:PROC
EXTRN sub_10037934:PROC
EXTRN sub_100EFEAC:PROC
EXTRN sub_100F6C7A:PROC
EXTRN sub_100F6D36:PROC
EXTRN fp_101D4A5C:DWORD
EXTRN g_101CE62C:DWORD
EXTRN g_101CE6F8:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D492C:DWORD
EXTRN g_101D4934:DWORD
EXTRN g_101D497C:DWORD
EXTRN g_101D4C94:DWORD
EXTRN g_1072DEBD:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_10033b20 PROC
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    sub esp, 000000200h
    test ecx, ecx
    je L0
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne al
    test al, al
    je L0
    push 0101979BCh
    push 010193358h
    push ecx
    call sub_100F6D36
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6C7A
    add esp, 16
L0:
    mov edx, dword ptr [g_101D4934]
    push 0
    push 0
    push 0
    push 0
    shl edx, 4
    mov eax, dword ptr [edx + 0101D4940h]
    mov ecx, dword ptr [eax]
    push 0
    push eax
    call dword ptr [ecx + 0xc]
    test eax, eax
    jge L2
    cmp eax, 088760868h
    je L1
    push eax
    call sub_100EFEAC
    push eax
    push 010197994h
    push 0
    call sub_1001393D
    add esp, 12
L1:
    mov byte ptr [g_101D492C], 1
    call sub_1002BB7C
L2:
    mov edx, dword ptr [g_101D497C]
    mov dword ptr [edx], 0
    mov byte ptr [g_1072DEBD], 0
    call sub_10037934
    mov eax, dword ptr [g_101CE62C]
    mov cl, byte ptr [eax + 7]
    test cl, cl
    jne L3
    mov ecx, dword ptr [g_101CE6F8]
    mov dl, byte ptr [ecx + 7]
    test dl, dl
    je L4
L3:
    push eax
    call dword ptr [fp_101D4A5C]
    mov edx, dword ptr [g_101CE6F8]
    push edx
    call dword ptr [fp_101D4A5C]
    mov eax, dword ptr [g_101CE6F8]
    mov cl, byte ptr [eax + 8]
    add esp, 8
    test cl, cl
    jne L4
    mov al, byte ptr [g_101D4C94]
    test al, al
    je L4
    lea ecx, [esp]
    call sub_10012001
    lea eax, [esp]
    call sub_100308D9
L4:
    add esp, 000000200h
    ret
FUN_10033b20 ENDP
END
