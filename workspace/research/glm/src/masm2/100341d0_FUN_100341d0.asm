.686
.MODEL FLAT, C
EXTRN sub_100343EB:PROC
EXTRN sub_100343ED:PROC
EXTRN sub_100343F7:PROC
EXTRN sub_100343F9:PROC
EXTRN sub_10034402:PROC
EXTRN sub_10034445:PROC
EXTRN sub_1003444F:PROC
EXTRN sub_100344E4:PROC
EXTRN sub_100344E9:PROC
EXTRN sub_1003A60A:PROC
EXTRN sub_1003A6E4:PROC
EXTRN sub_1003A9AD:PROC
EXTRN sub_1003A9E7:PROC
EXTRN sub_1003AACE:PROC
EXTRN sub_1010A917:PROC
EXTRN sub_1010A929:PROC
EXTRN sub_1010A93A:PROC
EXTRN sub_1010A94C:PROC
EXTRN EXTRN g_1019BCAC:DWORD:DWORD
EXTRN EXTRN g_101D1B38:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9C4:DWORD:DWORD
EXTRN EXTRN g_1072D9CC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
.CODE
FUN_100341d0 PROC
    sub sub esp, 20
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [g_101D1B38]
    xor xor ebx, ebx
    push push ebx
    mov mov esi, 3
    call sub_1003A60A
    mov mov ecx, dword ptr [g_106D3194]
    mov mov eax, dword ptr [ecx + 0249D28h]
    add add esp, 4
    cmp cmp eax, ebx
    mov mov dword ptr [esp + 28], ebx
    jle sub_100343F7
    mov mov dword ptr [esp + 24], ebx
    lea lea esp, [esp]
    mov mov ebx, dword ptr [ecx + 0249D24h]
    mov mov edx, dword ptr [esp + 24]
    mov mov eax, dword ptr [ebx + edx + 16]
    fld fld dword ptr [ebx + edx + 8]
    mov mov ecx, dword ptr [ecx + 0249D18h]
    fmul fmul dword ptr [g_1019BCAC]
    add add ebx, edx
    lea lea eax, [eax + eax*2]
    lea lea edx, [ecx + eax*4]
    mov mov dword ptr [esp + 32], edx
    call sub_1010A917
    fld fld dword ptr [ebx + 4]
    fmul fmul dword ptr [g_1019BCAC]
    mov mov byte ptr [esp + 20], al
    call sub_1010A929
    fld fld dword ptr [ebx]
    fmul fmul dword ptr [g_1019BCAC]
    mov mov byte ptr [esp + 21], al
    call sub_1010A93A
    fld fld dword ptr [ebx + 12]
    fmul fmul dword ptr [g_1019BCAC]
    mov mov byte ptr [esp + 22], al
    call sub_1010A94C
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov byte ptr [esp + 23], al
    mov mov eax, dword ptr [ebx + 20]
    lea lea edx, [eax + ecx]
    cmp cmp edx, 0154Ah
    jg L1
    mov mov ecx, dword ptr [g_1072D9D0]
    add add eax, -2
    lea lea edx, [ecx + eax*2]
    add add edx, eax
    cmp cmp edx, 0100000h
    jle L2
    mov mov ebp, dword ptr [g_1072D9CC]
    call sub_1003A9AD
    mov mov eax, dword ptr [g_1072D9C4]
    mov mov esi, dword ptr [g_1072D9C0]
    mov mov edi, dword ptr [g_1072D9BC]
    push push eax
    call sub_1003A6E4
    mov mov eax, dword ptr [g_1072D9CC]
    add add esp, 4
    cmp cmp eax, ebp
    je sub_100343ED
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne sub_100343EB
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je sub_100343F9
    call sub_1003A9E7
    mov mov dword ptr [g_1072D9CC], ebp
    mov mov eax, dword ptr [ebx + 20]
    xor xor esi, esi
    test test eax, eax
    jle sub_10034445
    mov mov edi, dword ptr [esp + 32]
    mov mov ebp, dword ptr [esp + 20]
    mov mov edi, edi
    mov mov ecx, dword ptr [g_1072D9D4]
    lea lea eax, [ecx + esi]
    push push ebp
    mov mov ecx, edi
    call L0
    mov mov eax, dword ptr [ebx + 20]
    add add esp, 4
    inc inc esi
    add add edi, 12
    cmp cmp esi, eax
    jl sub_1003444F
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, 2
    cmp cmp ecx, eax
    jle sub_100344E4
    mov mov ecx, 3
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov si, word ptr [g_1072D9D4]
    mov mov word ptr [edx + edi*2], si
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    add add edx, eax
    mov mov word ptr [esi + edi*2 + 2], dx
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov edi, dword ptr [g_1072D9B0]
    lea lea edx, [eax + edx - 1]
    mov mov word ptr [edi + esi*2 + 4], dx
    add add dword ptr [g_1072D9D0], ecx
    mov mov edx, dword ptr [ebx + 20]
    inc inc eax
    cmp cmp eax, edx
    jl sub_100344E9
    mov mov eax, dword ptr [ebx + 20]
    mov mov ebx, dword ptr [g_1072D9D4]
    mov mov esi, dword ptr [esp + 24]
    mov mov ecx, dword ptr [g_106D3194]
    add add ebx, eax
    mov mov eax, dword ptr [esp + 28]
    mov mov dword ptr [g_1072D9D4], ebx
    mov mov edx, dword ptr [ecx + 0249D28h]
    inc inc eax
    add add esi, 24
    cmp cmp eax, edx
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [esp + 24], esi
    jl sub_10034402
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 20
    jmp sub_1003AACE
FUN_100341d0 ENDP
END
