.686
.MODEL FLAT, C
EXTRN sub_10020F30:PROC
EXTRN sub_10020F60:PROC
EXTRN sub_10020FAE:PROC
EXTRN sub_10021231:PROC
EXTRN sub_100212A9:PROC
EXTRN sub_1002191E:PROC
EXTRN sub_100219AC:PROC
EXTRN sub_100219C7:PROC
EXTRN sub_10021A8F:PROC
EXTRN sub_10021BB4:PROC
EXTRN sub_10021C5B:PROC
EXTRN sub_10021D08:PROC
EXTRN sub_10021D18:PROC
EXTRN sub_10021D3D:PROC
EXTRN sub_10022311:PROC
EXTRN sub_10022332:PROC
EXTRN sub_100223CA:PROC
EXTRN sub_100224C8:PROC
EXTRN sub_100245DC:PROC
EXTRN sub_100246A4:PROC
EXTRN sub_10027C77:PROC
EXTRN sub_10027D0E:PROC
EXTRN sub_10027DC4:PROC
EXTRN sub_10027DEF:PROC
EXTRN sub_10027E0F:PROC
EXTRN sub_10027E5D:PROC
EXTRN sub_10027E6A:PROC
EXTRN sub_10027E73:PROC
EXTRN sub_10027EAF:PROC
EXTRN sub_10027F08:PROC
EXTRN sub_10027F26:PROC
EXTRN sub_10027F3B:PROC
EXTRN sub_10027FA6:PROC
EXTRN EXTRN g_101CE640:DWORD:DWORD
EXTRN EXTRN g_101CE694:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE810:DWORD:DWORD
EXTRN EXTRN g_101CE830:DWORD:DWORD
EXTRN EXTRN g_101D489C:DWORD:DWORD
EXTRN EXTRN g_1042E778:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
EXTRN EXTRN g_10678ABC:DWORD:DWORD
EXTRN EXTRN g_10696C5C:DWORD:DWORD
EXTRN EXTRN g_10696C60:DWORD:DWORD
EXTRN EXTRN g_10696C74:DWORD:DWORD
.CODE
FUN_10027930 PROC
    mov mov eax, dword ptr [g_10696C60]
    sub sub esp, 28
    cmp cmp eax, -1
    je L0
    mov mov ecx, 1
    jmp L1
    mov mov byte ptr [g_10696C5C], 1
    call sub_10020F30
    mov mov dword ptr [g_10696C60], eax
    xor xor ecx, ecx
    test test ecx, ecx
    mov mov cl, byte ptr [g_10696C5C]
    sete sete byte ptr [esp + 3]
    test test cl, cl
    je L2
    push push eax
    call sub_10020FAE
    add add esp, 4
    mov mov byte ptr [g_10696C5C], 0
    push push ebp
    push push esi
    push push edi
    call sub_10020F60
    mov mov ecx, dword ptr [esp + 44]
    mov mov ebp, dword ptr [esp + 52]
    mov mov dword ptr [ecx*4 + 010696C64h], eax
    mov mov eax, dword ptr [ebp + 0A20h]
    xor xor ecx, ecx
    test test eax, eax
    mov mov dword ptr [esp + 24], 03F000000h
    mov mov dword ptr [esp + 28], 03F000000h
    mov mov dword ptr [esp + 32], 03F000000h
    mov mov dword ptr [esp + 36], 0
    mov mov dword ptr [esp + 16], ecx
    je L4
    add add ebp, 104
    push push ebx
    mov mov ebx, dword ptr [ebp - 100]
    mov mov eax, dword ptr [ebp - 96]
    mov mov esi, dword ptr [ebp - 104]
    sub sub eax, ebx
    sub sub ebx, esi
    test test eax, eax
    mov mov dword ptr [esp + 24], eax
    je L3
    test test ebx, ebx
    je L6
    mov mov edx, dword ptr [g_101CE810]
    cmp cmp ecx, dword ptr [edx + 8]
    jge L8
    mov mov eax, dword ptr [ebp]
    push push eax
    lea lea ecx, [ebp - 92]
    push push ecx
    call sub_10021BB4
    mov mov esi, 4
    call sub_1002191E
    push push 0
    push push 03F800000h
    lea lea edx, [esp + 44]
    push push edx
    push push 7
    call sub_10022311
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [g_10678500]
    push push eax
    push push ecx
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    call sub_10021C5B
    push push 126
    push push 126
    push push 1
    push push 1
    call sub_10021D08
    mov mov eax, dword ptr [g_10678ABC]
    mov mov edx, dword ptr [ebp - 104]
    lea lea esi, [eax + edx*8]
    mov mov eax, ebx
    mov mov ecx, esi
    call sub_100245DC
    push push 0
    push push 31
    push push ebx
    push push esi
    call sub_100219C7
    add add esp, 64
    push push 080h
    push push 080h
    push push 0
    push push 0
    call sub_10021D3D
    mov mov ecx, dword ptr [g_101CE830]
    mov mov eax, dword ptr [ecx + 8]
    add add esp, 16
    test test eax, eax
    je L7
    call sub_10022332
    mov mov esi, 3
    call sub_100219AC
    mov mov al, byte ptr [esp + 19]
    test test al, al
    je L9
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    mov mov byte ptr [esp + 19], 0
    je L10
    mov mov eax, dword ptr [g_101CE694]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je L11
    mov mov eax, dword ptr [g_101D489C]
    test test eax, eax
    je sub_10027C77
    push push 0
    push push 0
    push push 010191488h
    push push 1
    call sub_100223CA
    add add esp, 16
    mov mov ecx, dword ptr [esp + 52]
    mov mov edx, dword ptr [g_10678500]
    push push ecx
    push push edx
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    call sub_10021D18
    mov mov ecx, dword ptr [g_101CE640]
    mov mov eax, dword ptr [esp + 28]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    cmp cmp eax, edx
    jge sub_10027D0E
    mov mov eax, dword ptr [g_10678ABC]
    mov mov edx, dword ptr [ebp - 100]
    mov mov edi, dword ptr [esp + 24]
    lea lea esi, [eax + edx*8]
    mov mov eax, edi
    mov mov ecx, esi
    call sub_100246A4
    push push 0
    push push 32
    push push edi
    push push esi
    call sub_10021A8F
    add add esp, 16
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 56]
    mov mov eax, dword ptr [edx + 0A20h]
    inc inc ecx
    add add ebp, 108
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 20], ecx
    jne L5
    pop pop ebx
    mov mov al, byte ptr [esp + 15]
    test test al, al
    mov mov esi, dword ptr [g_1042E778]
    mov mov edi, 8
    je sub_10027E0F
    mov mov ecx, dword ptr [esi + 030000h]
    mov mov eax, 030000h
    sub sub eax, ecx
    cmp cmp eax, edi
    jge sub_10027DC4
    xor xor eax, eax
    mov mov dword ptr [esi + 030008h], eax
    jmp sub_10027DEF
    lea lea eax, [ecx + esi]
    add add ecx, 8
    mov mov dword ptr [esi + 030000h], ecx
    add add dword ptr [esi + 030004h], edi
    mov mov dword ptr [esi + 030008h], eax
    mov mov word ptr [eax], 14
    mov mov word ptr [eax + 2], di
    mov mov dword ptr [eax + 4], 3
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    je sub_10027E5D
    mov mov ecx, dword ptr [g_101CE694]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je sub_10027E6A
    mov mov eax, dword ptr [g_101D489C]
    test test eax, eax
    je sub_10027E73
    push push 0
    push push 0
    push push 010191488h
    push push 1
    call sub_100224C8
    add add esp, 16
    mov mov edx, dword ptr [esp + 44]
    mov mov eax, dword ptr [edx*4 + 010696C64h]
    cmp cmp eax, -1
    je sub_10027EAF
    push push eax
    call sub_10021231
    add add esp, 4
    mov mov ecx, dword ptr [g_10696C74]
    cmp cmp ecx, -1
    jne sub_10027F26
    mov mov byte ptr [g_10696C5C], 1
    mov mov ecx, dword ptr [esi + 030000h]
    mov mov eax, 030000h
    sub sub eax, ecx
    cmp cmp eax, edi
    jge sub_10027F08
    xor xor eax, eax
    mov mov dword ptr [esi + 030008h], eax
    jmp sub_10027F3B
    lea lea edx, [ecx + 8]
    mov mov dword ptr [esi + 030000h], edx
    mov mov edx, dword ptr [esi + 030004h]
    lea lea eax, [ecx + esi]
    add add edx, edi
    mov mov dword ptr [esi + 030004h], edx
    mov mov dword ptr [esi + 030008h], eax
    mov mov word ptr [eax], 1
    mov mov word ptr [eax + 2], di
    mov mov dword ptr [eax + 4], 0
L9:
    mov mov dword ptr [g_10696C74], ecx
    mov mov al, byte ptr [g_10696C5C]
    test test al, al
    pop pop edi
    pop pop esi
    pop pop ebp
    je sub_10027FA6
    push push ecx
    call sub_100212A9
    add add esp, 4
    mov mov byte ptr [g_10696C5C], 0
    add add esp, 28
    ret ret
FUN_10027930 ENDP
END
