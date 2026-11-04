.686
.MODEL FLAT, C
EXTRN sub_10034231:PROC
EXTRN sub_1003A60A:PROC
EXTRN sub_1003A6E4:PROC
EXTRN sub_1003A9AD:PROC
EXTRN sub_1003A9E7:PROC
EXTRN sub_1003AACE:PROC
EXTRN sub_1010A917:PROC
EXTRN sub_1010A929:PROC
EXTRN sub_1010A93A:PROC
EXTRN sub_1010A94C:PROC
EXTRN g_1019BCAC:DWORD
EXTRN g_101D1B38:DWORD
EXTRN g_106D3194:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9C4:DWORD
EXTRN g_1072D9CC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9E0:DWORD
.CODE
FUN_100341d0 PROC
    sub esp, 20
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [g_101D1B38]
    xor ebx, ebx
    push ebx
    mov esi, 3
    call sub_1003A60A
    mov ecx, dword ptr [g_106D3194]
    mov eax, dword ptr [ecx + 000249D28h]
    add esp, 4
    cmp eax, ebx
    mov dword ptr [esp + 28], ebx
    jle L9
    mov dword ptr [esp + 24], ebx
    lea esp, [esp]
L0:
    mov ebx, dword ptr [ecx + 000249D24h]
    mov edx, dword ptr [esp + 24]
    mov eax, dword ptr [ebx + edx + 16]
    fld dword ptr [ebx + edx + 8]
    mov ecx, dword ptr [ecx + 000249D18h]
    fmul dword ptr [g_1019BCAC]
    add ebx, edx
    lea eax, [eax + eax*2]
    lea edx, [ecx + eax*4]
    mov dword ptr [esp + 32], edx
    call sub_1010A917
    fld dword ptr [ebx + 4]
    fmul dword ptr [g_1019BCAC]
    mov byte ptr [esp + 20], al
    call sub_1010A929
    fld dword ptr [ebx]
    fmul dword ptr [g_1019BCAC]
    mov byte ptr [esp + 21], al
    call sub_1010A93A
    fld dword ptr [ebx + 12]
    fmul dword ptr [g_1019BCAC]
    mov byte ptr [esp + 22], al
    call sub_1010A94C
    mov ecx, dword ptr [g_1072D9D4]
    mov byte ptr [esp + 23], al
    mov eax, dword ptr [ebx + 20]
    lea edx, [eax + ecx]
    cmp edx, 00000154Ah
    jg L1
    mov ecx, dword ptr [g_1072D9D0]
    add eax, -2
    lea edx, [ecx + eax*2]
    add edx, eax
    cmp edx, 000100000h
    jle L4
L1:
    mov ebp, dword ptr [g_1072D9CC]
    call sub_1003A9AD
    mov eax, dword ptr [g_1072D9C4]
    mov esi, dword ptr [g_1072D9C0]
    mov edi, dword ptr [g_1072D9BC]
    push eax
    call sub_1003A6E4
    mov eax, dword ptr [g_1072D9CC]
    add esp, 4
    cmp eax, ebp
    je L4
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L2
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L3
L2:
    call sub_1003A9E7
L3:
    mov dword ptr [g_1072D9CC], ebp
L4:
    mov eax, dword ptr [ebx + 20]
    xor esi, esi
    test eax, eax
    jle L6
    mov edi, dword ptr [esp + 32]
    mov ebp, dword ptr [esp + 20]
    mov edi, edi
L5:
    mov ecx, dword ptr [g_1072D9D4]
    lea eax, [ecx + esi]
    push ebp
    mov ecx, edi
    call sub_10034231
    mov eax, dword ptr [ebx + 20]
    add esp, 4
    inc esi
    add edi, 12
    cmp esi, eax
    jl L5
L6:
    mov ecx, dword ptr [ebx + 20]
    mov eax, 2
    cmp ecx, eax
    jle L8
    mov ecx, 3
L7:
    mov edi, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    mov si, word ptr [g_1072D9D4]
    mov word ptr [edx + edi*2], si
    mov edx, dword ptr [g_1072D9D4]
    mov edi, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    add edx, eax
    mov word ptr [esi + edi*2 + 2], dx
    mov edx, dword ptr [g_1072D9D4]
    mov esi, dword ptr [g_1072D9D0]
    mov edi, dword ptr [g_1072D9B0]
    lea edx, [eax + edx - 1]
    mov word ptr [edi + esi*2 + 4], dx
    add dword ptr [g_1072D9D0], ecx
    mov edx, dword ptr [ebx + 20]
    inc eax
    cmp eax, edx
    jl L7
L8:
    mov eax, dword ptr [ebx + 20]
    mov ebx, dword ptr [g_1072D9D4]
    mov esi, dword ptr [esp + 24]
    mov ecx, dword ptr [g_106D3194]
    add ebx, eax
    mov eax, dword ptr [esp + 28]
    mov dword ptr [g_1072D9D4], ebx
    mov edx, dword ptr [ecx + 000249D28h]
    inc eax
    add esi, 24
    cmp eax, edx
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 24], esi
    jl L0
L9:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 20
    jmp sub_1003AACE
FUN_100341d0 ENDP
END
