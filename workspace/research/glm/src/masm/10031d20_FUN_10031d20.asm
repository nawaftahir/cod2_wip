.686
.MODEL FLAT, C
EXTRN sub_1002DFD4:PROC
EXTRN sub_1002E3B8:PROC
EXTRN sub_1002E85C:PROC
EXTRN sub_1003A656:PROC
EXTRN sub_1003A8FA:PROC
EXTRN sub_1003A92F:PROC
EXTRN sub_1003AA32:PROC
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DEBD:DWORD
.CODE
FUN_10031d20 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 12
    push ebx
    push esi
    mov bx, ax
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    push edi
    mov esi, ecx
    mov edi, edx
    jne L0
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L1
L0:
    call sub_1003A8FA
L1:
    mov al, byte ptr [g_1072DEBD]
    test al, al
    je L2
    call sub_1002E3B8
L2:
    cmp dword ptr [g_1072D9BC], edi
    jne L3
    cmp dword ptr [g_1072D9C0], esi
    je L6
L3:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L4
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L5
L4:
    call sub_1003A92F
L5:
    push 31
    call sub_1003A656
    add esp, 4
L6:
    movsx eax, word ptr [ebp + 12]
    mov ecx, dword ptr [g_1072D9D4]
    add eax, ecx
    cmp eax, 00000154Ah
    jg L7
    mov ecx, dword ptr [g_1072D9D0]
    movsx edx, bx
    add edx, ecx
    cmp edx, 000100000h
    jle L8
L7:
    call sub_1002DFD4
L8:
    movsx ecx, bx
    xor eax, eax
    test ecx, ecx
    mov dword ptr [esp + 20], ecx
    jle L10
L9:
    mov edx, dword ptr [ebp + 8]
    mov dx, word ptr [edx + eax*2]
    mov esi, dword ptr [g_1072D9D0]
    add dx, word ptr [g_1072D9D4]
    mov edi, dword ptr [g_1072D9B0]
    add esi, eax
    inc eax
    cmp eax, ecx
    mov word ptr [edi + esi*2], dx
    jl L9
L10:
    movsx eax, word ptr [ebp + 12]
    xor edi, edi
    test eax, eax
    jle L12
    mov esi, dword ptr [ebp + 16]
    mov eax, dword ptr [ebp + 24]
    mov ebx, dword ptr [ebp + 20]
    add esi, 8
    mov dword ptr [esp + 16], eax
    add ebx, 4
L11:
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [ebp + 28]
    mov edx, dword ptr [eax + edi*8 + 4]
    mov eax, dword ptr [eax + edi*8]
    push ecx
    mov ecx, dword ptr [ebx + 4]
    push edx
    mov edx, dword ptr [ebx]
    push eax
    mov eax, dword ptr [ebx - 4]
    push ecx
    mov ecx, dword ptr [esi + 4]
    push edx
    mov edx, dword ptr [esi]
    push eax
    mov eax, dword ptr [esi - 4]
    push ecx
    mov ecx, dword ptr [esi - 8]
    push edx
    mov edx, dword ptr [g_1072D9D4]
    push eax
    push ecx
    lea eax, [edx + edi]
    call sub_1002E85C
    mov ecx, dword ptr [esp + 56]
    movsx eax, word ptr [ebp + 12]
    add esp, 40
    inc edi
    add ecx, 4
    add ebx, 12
    add esi, 16
    cmp edi, eax
    mov dword ptr [esp + 16], ecx
    jl L11
    mov ecx, dword ptr [esp + 20]
L12:
    mov edx, dword ptr [g_1072D9D0]
    movsx eax, word ptr [ebp + 12]
    add edx, ecx
    mov ecx, dword ptr [g_1072D9D4]
    add ecx, eax
    mov dword ptr [g_1072D9D0], edx
    mov dword ptr [g_1072D9D4], ecx
    call sub_1003AA32
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_10031d20 ENDP
END
