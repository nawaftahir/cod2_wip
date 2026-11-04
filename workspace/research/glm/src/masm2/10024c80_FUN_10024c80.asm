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
EXTRN sub_10024D9A:PROC
EXTRN sub_10024DA6:PROC
EXTRN sub_10024DB2:PROC
EXTRN sub_10024DC5:PROC
EXTRN EXTRN g_101CE694:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D4818:DWORD:DWORD
EXTRN EXTRN g_101D489C:DWORD:DWORD
EXTRN EXTRN g_1042E778:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
.CODE
FUN_10024c80 PROC
    mov mov ecx, dword ptr [g_10678500]
    sub sub esp, 16
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    push push esi
    push push edi
    push push eax
    push push ecx
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    call sub_10021B71
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    mov mov esi, 8
    add add esp, 8
    cmp cmp ecx, esi
    jge L0
    xor xor ecx, ecx
    mov mov dword ptr [eax + 030008h], ecx
    jmp L1
    lea lea ecx, [edx + eax]
    add add edx, 8
    mov mov dword ptr [eax + 030000h], edx
    add add dword ptr [eax + 030004h], esi
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 14
    mov mov word ptr [ecx + 2], si
    mov mov dword ptr [ecx + 4], 0
    mov mov eax, dword ptr [g_101D4818]
    test test eax, eax
    je sub_10024D9A
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    je sub_10024DA6
    mov mov eax, dword ptr [g_101CE694]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je sub_10024DB2
    mov mov eax, dword ptr [g_101D489C]
    test test eax, eax
    mov mov esi, 1
    jne sub_10024DC5
    mov mov esi, 7
    lea lea eax, [esp + 12]
    call sub_100249CE
    push push 0
    push push 03F800000h
    mov mov ecx, eax
    push push ecx
    push push esi
    call sub_100222DE
    mov mov ecx, dword ptr [g_101D1B9C]
    add add ecx, 0B4h
    push push 0
    call sub_10021841
    push push 0
    push push 1
    push push ebp
    push push ebx
    call sub_1002196C
    push push 0
    push push 6
    push push ebp
    push push ebx
    call sub_10021977
    mov mov esi, dword ptr [esp + 84]
    call sub_10021A10
    push push 0
    push push 21
    push push ebp
    push push ebx
    call sub_1002198B
    add add esp, 68
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 16
    ret ret
FUN_10024c80 ENDP
END
