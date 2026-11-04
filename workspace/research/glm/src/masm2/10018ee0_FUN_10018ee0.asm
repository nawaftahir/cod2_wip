.686
.MODEL FLAT, C
EXTRN sub_10018F97:PROC
EXTRN sub_10018FD3:PROC
EXTRN sub_10018FD8:PROC
EXTRN sub_10018FF8:PROC
EXTRN sub_1005F3FB:PROC
EXTRN sub_1005F6E9:PROC
EXTRN sub_1005FAFE:PROC
EXTRN sub_1005FB78:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_10018ee0 PROC
    push push 1
    push push 0101956F0h
    mov mov ecx, esi
    call sub_1005FAFE
    add add esp, 8
    test test eax, eax
    je sub_10018F97
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L1
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esi], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push esi
    mov mov eax, 1
    call sub_1005F6E9
    mov mov cl, byte ptr [eax]
    add add esp, 4
    test test cl, cl
    je sub_10018FD3
    cmp cmp cl, 59
    je sub_10018FD8
    push push edi
    mov mov edi, eax
    call L0
    test test eax, eax
    mov mov ecx, dword ptr [esp + 8]
    mov mov dword ptr [ecx], eax
    pop pop edi
    je sub_10018FF8
    push push 1
    push push 010195820h
L1:
    mov mov ecx, esi
    call sub_1005FB78
    add add esp, 8
    test test eax, eax
    setne setne al
    ret ret
    push push 0101956D4h
    call sub_1005F3FB
    add add esp, 4
    xor xor al, al
    ret ret
FUN_10018ee0 ENDP
END
