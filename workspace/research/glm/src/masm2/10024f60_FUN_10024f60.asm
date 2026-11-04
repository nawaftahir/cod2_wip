.686
.MODEL FLAT, C
EXTRN sub_10021960:PROC
EXTRN sub_10021B6C:PROC
EXTRN sub_100222DD:PROC
EXTRN sub_100249CD:PROC
EXTRN sub_10025078:PROC
EXTRN sub_10025084:PROC
EXTRN sub_10025090:PROC
EXTRN sub_100250A3:PROC
EXTRN EXTRN g_101CE694:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D4818:DWORD:DWORD
EXTRN EXTRN g_101D489C:DWORD:DWORD
EXTRN EXTRN g_1042E778:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
.CODE
FUN_10024f60 PROC
    mov mov ecx, dword ptr [g_10678500]
    sub sub esp, 16
    push push esi
    push push edi
    push push eax
    push push ecx
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    call sub_10021B6C
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    mov mov esi, 8
    add add esp, 8
    cmp cmp ecx, esi
    jge L0
    mov mov dword ptr [eax + 030008h], 0
    xor xor ecx, ecx
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
    je sub_10025078
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    je sub_10025084
    mov mov eax, dword ptr [g_101CE694]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je sub_10025090
    mov mov eax, dword ptr [g_101D489C]
    test test eax, eax
    mov mov esi, 1
    jne sub_100250A3
    mov mov esi, 7
    lea lea eax, [esp + 8]
    call sub_100249CD
    push push 0
    push push 03F800000h
    mov mov ecx, eax
    push push ecx
    push push esi
    call sub_100222DD
    mov mov edx, dword ptr [esp + 48]
    mov mov eax, dword ptr [esp + 44]
    push push 0
    push push 33
    push push edx
    push push eax
    call sub_10021960
    add add esp, 32
    pop pop edi
    pop pop esi
    add add esp, 16
    ret ret
FUN_10024f60 ENDP
END
