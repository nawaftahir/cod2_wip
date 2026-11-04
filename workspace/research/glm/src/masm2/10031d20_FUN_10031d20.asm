.686
.MODEL FLAT, C
EXTRN sub_1002DFD4:PROC
EXTRN sub_1002E3B8:PROC
EXTRN sub_1002E85C:PROC
EXTRN sub_10031F2D:PROC
EXTRN sub_10031F3C:PROC
EXTRN sub_1003A656:PROC
EXTRN sub_1003A8FA:PROC
EXTRN sub_1003A92F:PROC
EXTRN sub_1003AA32:PROC
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
.CODE
FUN_10031d20 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 12
    push push ebx
    push push esi
    mov mov bx, ax
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    push push edi
    mov mov esi, ecx
    mov mov edi, edx
    jne L0
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L1
    call sub_1003A8FA
    mov mov al, byte ptr [g_1072DEBD]
    test test al, al
    je L2
    call sub_1002E3B8
    cmp cmp dword ptr [g_1072D9BC], edi
    jne L3
    cmp cmp dword ptr [g_1072D9C0], esi
    je L5
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
L1:
    jne L4
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L6
    call sub_1003A92F
    push push 31
    call sub_1003A656
    add add esp, 4
    movsx movsx eax, word ptr [ebp + 12]
    mov mov ecx, dword ptr [g_1072D9D4]
    add add eax, ecx
    cmp cmp eax, 0154Ah
    jg L7
    mov mov ecx, dword ptr [g_1072D9D0]
    movsx movsx edx, bx
    add add edx, ecx
    cmp cmp edx, 0100000h
    jle L8
    call sub_1002DFD4
    movsx movsx ecx, bx
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [esp + 20], ecx
    jle L9
    mov mov edx, dword ptr [ebp + 8]
    mov mov dx, word ptr [edx + eax*2]
    mov mov esi, dword ptr [g_1072D9D0]
    add add dx, word ptr [g_1072D9D4]
    mov mov edi, dword ptr [g_1072D9B0]
    add add esi, eax
    inc inc eax
    cmp cmp eax, ecx
    mov mov word ptr [edi + esi*2], dx
    jl L9
    movsx movsx eax, word ptr [ebp + 12]
    xor xor edi, edi
    test test eax, eax
    jle sub_10031F2D
    mov mov esi, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 24]
    mov mov ebx, dword ptr [ebp + 20]
    add add esi, 8
    mov mov dword ptr [esp + 16], eax
    add add ebx, 4
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [ebp + 28]
    mov mov edx, dword ptr [eax + edi*8 + 4]
    mov mov eax, dword ptr [eax + edi*8]
    push push ecx
    mov mov ecx, dword ptr [ebx + 4]
    push push edx
    mov mov edx, dword ptr [ebx]
    push push eax
    mov mov eax, dword ptr [ebx - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 4]
    push push edx
    mov mov edx, dword ptr [esi]
    push push eax
    mov mov eax, dword ptr [esi - 4]
    push push ecx
    mov mov ecx, dword ptr [esi - 8]
L7:
    push push edx
    mov mov edx, dword ptr [g_1072D9D4]
    push push eax
    push push ecx
    lea lea eax, [edx + edi]
    call sub_1002E85C
    mov mov ecx, dword ptr [esp + 56]
    movsx movsx eax, word ptr [ebp + 12]
    add add esp, 40
    inc inc edi
    add add ecx, 4
    add add ebx, 12
    add add esi, 16
    cmp cmp edi, eax
    mov mov dword ptr [esp + 16], ecx
    jl sub_10031F3C
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [g_1072D9D0]
    movsx movsx eax, word ptr [ebp + 12]
    add add edx, ecx
    mov mov ecx, dword ptr [g_1072D9D4]
    add add ecx, eax
    mov mov dword ptr [g_1072D9D0], edx
    mov mov dword ptr [g_1072D9D4], ecx
    call sub_1003AA32
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
L9:
    pop pop ebp
    ret ret
FUN_10031d20 ENDP
END
