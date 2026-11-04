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
EXTRN g_101CE640:DWORD
EXTRN g_101CE694:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE810:DWORD
EXTRN g_101CE830:DWORD
EXTRN g_101D489C:DWORD
EXTRN g_1042E778:DWORD
EXTRN g_10678500:DWORD
EXTRN g_10678ABC:DWORD
EXTRN g_10696C5C:DWORD
EXTRN g_10696C60:DWORD
EXTRN g_10696C74:DWORD
.CODE
FUN_10027930 PROC
    mov eax, dword ptr [g_10696C60]
    sub esp, 28
    cmp eax, -1
    je L0
    mov ecx, 1
    jmp L1
L0:
    mov byte ptr [g_10696C5C], 1
    call sub_10020F30
    mov dword ptr [g_10696C60], eax
    xor ecx, ecx
L1:
    test ecx, ecx
    mov cl, byte ptr [g_10696C5C]
    sete byte ptr [esp + 3]
    test cl, cl
    je L2
    push eax
    call sub_10020FAE
    add esp, 4
    mov byte ptr [g_10696C5C], 0
L2:
    push ebp
    push esi
    push edi
    call sub_10020F60
    mov ecx, dword ptr [esp + 44]
    mov ebp, dword ptr [esp + 52]
    mov dword ptr [ecx*4 + 010696C64h], eax
    mov eax, dword ptr [ebp + 000000A20h]
    xor ecx, ecx
    test eax, eax
    mov dword ptr [esp + 24], 03F000000h
    mov dword ptr [esp + 28], 03F000000h
    mov dword ptr [esp + 32], 03F000000h
    mov dword ptr [esp + 36], 0
    mov dword ptr [esp + 16], ecx
    je L7
    add ebp, 104
    push ebx
L3:
    mov ebx, dword ptr [ebp - 100]
    mov eax, dword ptr [ebp - 96]
    mov esi, dword ptr [ebp - 104]
    sub eax, ebx
    sub ebx, esi
    test eax, eax
    mov dword ptr [esp + 24], eax
    je L6
    test ebx, ebx
    je L6
    mov edx, dword ptr [g_101CE810]
    cmp ecx, dword ptr [edx + 8]
    jge L6
    mov eax, dword ptr [ebp]
    push eax
    lea ecx, [ebp - 92]
    push ecx
    call sub_10021BB4
    mov esi, 4
    call sub_1002191E
    push 0
    push 03F800000h
    lea edx, [esp + 44]
    push edx
    push 7
    call sub_10022311
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [g_10678500]
    push eax
    push ecx
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    call sub_10021C5B
    push 126
    push 126
    push 1
    push 1
    call sub_10021D08
    mov eax, dword ptr [g_10678ABC]
    mov edx, dword ptr [ebp - 104]
    lea esi, [eax + edx*8]
    mov eax, ebx
    mov ecx, esi
    call sub_100245DC
    push 0
    push 31
    push ebx
    push esi
    call sub_100219C7
    add esp, 64
    push 000000080h
    push 000000080h
    push 0
    push 0
    call sub_10021D3D
    mov ecx, dword ptr [g_101CE830]
    mov eax, dword ptr [ecx + 8]
    add esp, 16
    test eax, eax
    je L4
    call sub_10022332
L4:
    mov esi, 3
    call sub_100219AC
    mov al, byte ptr [esp + 19]
    test al, al
    je L5
    mov edx, dword ptr [g_101CE708]
    cmp dword ptr [edx + 8], 2
    mov byte ptr [esp + 19], 0
    je L5
    mov eax, dword ptr [g_101CE694]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L5
    mov eax, dword ptr [g_101D489C]
    test eax, eax
    je L5
    push 0
    push 0
    push 010191488h
    push 1
    call sub_100223CA
    add esp, 16
L5:
    mov ecx, dword ptr [esp + 52]
    mov edx, dword ptr [g_10678500]
    push ecx
    push edx
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    call sub_10021D18
    mov ecx, dword ptr [g_101CE640]
    mov eax, dword ptr [esp + 28]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    cmp eax, edx
    jge L6
    mov eax, dword ptr [g_10678ABC]
    mov edx, dword ptr [ebp - 100]
    mov edi, dword ptr [esp + 24]
    lea esi, [eax + edx*8]
    mov eax, edi
    mov ecx, esi
    call sub_100246A4
    push 0
    push 32
    push edi
    push esi
    call sub_10021A8F
    add esp, 16
L6:
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 56]
    mov eax, dword ptr [edx + 000000A20h]
    inc ecx
    add ebp, 108
    cmp ecx, eax
    mov dword ptr [esp + 20], ecx
    jne L3
    pop ebx
L7:
    mov al, byte ptr [esp + 15]
    test al, al
    mov esi, dword ptr [g_1042E778]
    mov edi, 8
    je L10
    mov ecx, dword ptr [esi + 000030000h]
    mov eax, 000030000h
    sub eax, ecx
    cmp eax, edi
    jge L8
    xor eax, eax
    mov dword ptr [esi + 000030008h], eax
    jmp L9
L8:
    lea eax, [ecx + esi]
    add ecx, 8
    mov dword ptr [esi + 000030000h], ecx
    add dword ptr [esi + 000030004h], edi
    mov dword ptr [esi + 000030008h], eax
    mov word ptr [eax], 14
    mov word ptr [eax + 2], di
L9:
    mov dword ptr [eax + 4], 3
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    je L10
    mov ecx, dword ptr [g_101CE694]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L10
    mov eax, dword ptr [g_101D489C]
    test eax, eax
    je L10
    push 0
    push 0
    push 010191488h
    push 1
    call sub_100224C8
    add esp, 16
L10:
    mov edx, dword ptr [esp + 44]
    mov eax, dword ptr [edx*4 + 010696C64h]
    cmp eax, -1
    je L11
    push eax
    call sub_10021231
    add esp, 4
L11:
    mov ecx, dword ptr [g_10696C74]
    cmp ecx, -1
    jne L14
    mov byte ptr [g_10696C5C], 1
    mov ecx, dword ptr [esi + 000030000h]
    mov eax, 000030000h
    sub eax, ecx
    cmp eax, edi
    jge L12
    xor eax, eax
    mov dword ptr [esi + 000030008h], eax
    jmp L13
L12:
    lea edx, [ecx + 8]
    mov dword ptr [esi + 000030000h], edx
    mov edx, dword ptr [esi + 000030004h]
    lea eax, [ecx + esi]
    add edx, edi
    mov dword ptr [esi + 000030004h], edx
    mov dword ptr [esi + 000030008h], eax
    mov word ptr [eax], 1
    mov word ptr [eax + 2], di
L13:
    mov dword ptr [eax + 4], 0
    mov dword ptr [g_10696C74], ecx
L14:
    mov al, byte ptr [g_10696C5C]
    test al, al
    pop edi
    pop esi
    pop ebp
    je L15
    push ecx
    call sub_100212A9
    add esp, 4
    mov byte ptr [g_10696C5C], 0
L15:
    add esp, 28
    ret
FUN_10027930 ENDP
END
