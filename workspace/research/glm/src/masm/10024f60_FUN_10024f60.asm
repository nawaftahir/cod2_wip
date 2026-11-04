.686
.MODEL FLAT, C
EXTRN sub_10021960:PROC
EXTRN sub_10021B6C:PROC
EXTRN sub_100222DD:PROC
EXTRN sub_100249CD:PROC
EXTRN g_101CE694:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101D4818:DWORD
EXTRN g_101D489C:DWORD
EXTRN g_1042E778:DWORD
EXTRN g_10678500:DWORD
.CODE
FUN_10024f60 PROC
    mov ecx, dword ptr [g_10678500]
    sub esp, 16
    push esi
    push edi
    push eax
    push ecx
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    call sub_10021B6C
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    mov ecx, 000030000h
    sub ecx, edx
    mov esi, 8
    add esp, 8
    cmp ecx, esi
    jge L0
    mov dword ptr [eax + 000030008h], 0
    xor ecx, ecx
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
    lea eax, [esp + 8]
    call sub_100249CD
    push 0
    push 03F800000h
    mov ecx, eax
    push ecx
    push esi
    call sub_100222DD
    mov edx, dword ptr [esp + 48]
    mov eax, dword ptr [esp + 44]
    push 0
    push 33
    push edx
    push eax
    call sub_10021960
    add esp, 32
    pop edi
    pop esi
    add esp, 16
    ret
FUN_10024f60 ENDP
END
