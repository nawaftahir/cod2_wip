.686
.MODEL FLAT, C
EXTRN sub_10021841:PROC
EXTRN sub_1002196C:PROC
EXTRN sub_10021977:PROC
EXTRN sub_1002198B:PROC
EXTRN sub_10021A10:PROC
EXTRN sub_10021B71:PROC
EXTRN sub_100222DE:PROC
EXTRN sub_100249CE:PROC
EXTRN g_101CE694:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D4818:DWORD
EXTRN g_101D489C:DWORD
EXTRN g_1042E778:DWORD
EXTRN g_10678500:DWORD
.CODE
FUN_10024c80 PROC
    mov ecx, dword ptr [g_10678500]
    sub esp, 16
    push ebp
    mov ebp, dword ptr [esp + 28]
    push esi
    push edi
    push eax
    push ecx
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    call sub_10021B71
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    mov ecx, 000030000h
    sub ecx, edx
    mov esi, 8
    add esp, 8
    cmp ecx, esi
    jge L0
    xor ecx, ecx
    mov dword ptr [eax + 000030008h], ecx
    jmp L1
L0:
    lea ecx, [edx + eax]
    add edx, 8
    mov dword ptr [eax + 000030000h], edx
    add dword ptr [eax + 000030004h], esi
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 14
    mov word ptr [ecx + 2], si
L1:
    mov dword ptr [ecx + 4], 0
    mov eax, dword ptr [g_101D4818]
    test eax, eax
    je L2
    mov edx, dword ptr [g_101CE708]
    cmp dword ptr [edx + 8], 2
    je L2
    mov eax, dword ptr [g_101CE694]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L2
    mov eax, dword ptr [g_101D489C]
    test eax, eax
    mov esi, 1
    jne L3
L2:
    mov esi, 7
L3:
    lea eax, [esp + 12]
    call sub_100249CE
    push 0
    push 03F800000h
    mov ecx, eax
    push ecx
    push esi
    call sub_100222DE
    mov ecx, dword ptr [g_101D1B9C]
    add ecx, 0000000B4h
    push 0
    call sub_10021841
    push 0
    push 1
    push ebp
    push ebx
    call sub_1002196C
    push 0
    push 6
    push ebp
    push ebx
    call sub_10021977
    mov esi, dword ptr [esp + 84]
    call sub_10021A10
    push 0
    push 21
    push ebp
    push ebx
    call sub_1002198B
    add esp, 68
    pop edi
    pop esi
    pop ebp
    add esp, 16
    ret
FUN_10024c80 ENDP
END
