.686
.MODEL FLAT, C
EXTRN sub_1002E772:PROC
EXTRN sub_1002E789:PROC
EXTRN sub_1002E7A2:PROC
EXTRN sub_1002E7BE:PROC
EXTRN sub_1003A641:PROC
EXTRN sub_1003A6B8:PROC
EXTRN sub_1003A91A:PROC
EXTRN sub_1003A980:PROC
EXTRN sub_1003A9BF:PROC
EXTRN sub_1003AB27:PROC
EXTRN g_101D1B34:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9C4:DWORD
EXTRN g_1072D9CC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9E0:DWORD
.CODE
FUN_1002faf0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 28
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [g_1072D9BC]
    push ebx
    mov ebx, dword ptr [eax]
    mov eax, dword ptr [g_101D1B34]
    cmp ecx, eax
    push esi
    push edi
    mov dword ptr [esp + 28], ebx
    mov edi, eax
    mov esi, 3
    jne L0
    cmp dword ptr [g_1072D9C0], esi
    je L3
L0:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L1
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L2
L1:
    call sub_1003A91A
L2:
    push 31
    call sub_1003A641
    add esp, 4
L3:
    mov eax, dword ptr [ebx + 8]
    test eax, eax
    mov dword ptr [esp + 12], 0FFFFFFFFh
    mov dword ptr [esp + 24], 0
    jle L10
    add ebx, 12
    mov dword ptr [esp + 16], ebx
    jmp L5
L4:
    mov ebx, dword ptr [esp + 16]
    lea esp, [esp]
L5:
    mov ecx, dword ptr [g_1072D9D4]
    add ecx, 4
    cmp ecx, 00000154Ah
    jg L6
    mov edx, dword ptr [g_1072D9D0]
    add edx, 6
    cmp edx, 000100000h
    jle L9
L6:
    mov eax, dword ptr [g_1072D9CC]
    mov dword ptr [esp + 32], eax
    call sub_1003A980
    mov ecx, dword ptr [g_1072D9C4]
    mov esi, dword ptr [g_1072D9C0]
    mov edi, dword ptr [g_1072D9BC]
    push ecx
    call sub_1003A6B8
    mov esi, dword ptr [esp + 36]
    mov eax, dword ptr [g_1072D9CC]
    add esp, 4
    cmp eax, esi
    je L9
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L7
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L8
L7:
    call sub_1003A9BF
L8:
    mov dword ptr [g_1072D9CC], esi
L9:
    fld dword ptr [ebx]
    mov edx, dword ptr [ebx]
    mov eax, dword ptr [esp + 28]
    fsub dword ptr [eax + 4]
    mov eax, dword ptr [g_1072D9D4]
    mov dword ptr [esp + 20], edx
    push 0
    fstp dword ptr [esp + 36]
    push 0
    fld dword ptr [esp + 28]
    mov edi, dword ptr [esp + 40]
    mov esi, edx
    fchs
    push esi
    fstp dword ptr [esp + 48]
    mov ebx, dword ptr [esp + 48]
    push edi
    push ebx
    push ebx
    lea edx, [esp + 36]
    call sub_1002E772
    mov eax, dword ptr [g_1072D9D4]
    push 0
    push 0
    push esi
    push edi
    push esi
    push ebx
    inc eax
    lea edx, [esp + 60]
    call sub_1002E789
    mov eax, dword ptr [g_1072D9D4]
    push 0
    push 0
    push esi
    push edi
    push esi
    push esi
    add eax, 2
    lea edx, [esp + 84]
    call sub_1002E7A2
    mov eax, dword ptr [g_1072D9D4]
    add esp, 72
    push 0
    push 0
    push esi
    push edi
    push ebx
    push esi
    add eax, 3
    lea edx, [esp + 36]
    call sub_1002E7BE
    mov cx, word ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    mov eax, dword ptr [g_1072D9D0]
    mov word ptr [edx + eax*2], cx
    mov ecx, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    mov eax, dword ptr [g_1072D9D0]
    add esp, 24
    inc ecx
    mov word ptr [edx + eax*2 + 2], cx
    mov ecx, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    mov eax, dword ptr [g_1072D9D0]
    add ecx, 2
    mov word ptr [edx + eax*2 + 4], cx
    mov ecx, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    mov eax, dword ptr [g_1072D9D0]
    add ecx, 2
    mov word ptr [edx + eax*2 + 6], cx
    mov ecx, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    mov eax, dword ptr [g_1072D9D0]
    add ecx, 3
    mov word ptr [edx + eax*2 + 8], cx
    mov cx, word ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9D0]
    mov eax, dword ptr [g_1072D9B0]
    mov word ptr [eax + edx*2 + 10], cx
    mov eax, dword ptr [g_1072D9D4]
    mov ebx, dword ptr [g_1072D9D0]
    mov esi, dword ptr [esp + 16]
    mov ecx, 4
    add eax, ecx
    mov dword ptr [g_1072D9D4], eax
    mov eax, dword ptr [esp + 24]
    add ebx, 6
    add esi, ecx
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [g_1072D9D0], ebx
    mov edx, dword ptr [ecx + 8]
    inc eax
    cmp eax, edx
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 16], esi
    jl L4
L10:
    call sub_1003AB27
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx]
    movzx edx, word ptr [eax + 2]
    pop edi
    add edx, eax
    pop esi
    mov dword ptr [ecx], edx
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_1002faf0 ENDP
END
