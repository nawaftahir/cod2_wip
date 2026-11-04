.686
.MODEL FLAT, C
EXTRN sub_1002E772:PROC
EXTRN sub_1002E789:PROC
EXTRN sub_1002E7A2:PROC
EXTRN sub_1002E7BE:PROC
EXTRN sub_1002FDB1:PROC
EXTRN sub_1002FDBA:PROC
EXTRN sub_1003A641:PROC
EXTRN sub_1003A6B8:PROC
EXTRN sub_1003A91A:PROC
EXTRN sub_1003A980:PROC
EXTRN sub_1003A9BF:PROC
EXTRN sub_1003AB27:PROC
EXTRN EXTRN g_101D1B34:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9C4:DWORD:DWORD
EXTRN EXTRN g_1072D9CC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
.CODE
FUN_1002faf0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 28
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [g_1072D9BC]
    push push ebx
    mov mov ebx, dword ptr [eax]
    mov mov eax, dword ptr [g_101D1B34]
    cmp cmp ecx, eax
    push push esi
    push push edi
    mov mov dword ptr [esp + 28], ebx
    mov mov edi, eax
    mov mov esi, 3
    jne L0
    cmp cmp dword ptr [g_1072D9C0], esi
    je L2
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L1
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L3
    call sub_1003A91A
    push push 31
    call sub_1003A641
    add add esp, 4
    mov mov eax, dword ptr [ebx + 8]
    test test eax, eax
    mov mov dword ptr [esp + 12], -1
    mov mov dword ptr [esp + 24], 0
    jle sub_1002FDB1
    add add ebx, 12
    mov mov dword ptr [esp + 16], ebx
    jmp L4
    mov mov ebx, dword ptr [esp + 16]
    lea lea esp, [esp]
    mov mov ecx, dword ptr [g_1072D9D4]
    add add ecx, 4
    cmp cmp ecx, 0154Ah
L3:
    jg L5
    mov mov edx, dword ptr [g_1072D9D0]
    add add edx, 6
    cmp cmp edx, 0100000h
    jle L6
    mov mov eax, dword ptr [g_1072D9CC]
    mov mov dword ptr [esp + 32], eax
    call sub_1003A980
    mov mov ecx, dword ptr [g_1072D9C4]
    mov mov esi, dword ptr [g_1072D9C0]
    mov mov edi, dword ptr [g_1072D9BC]
    push push ecx
    call sub_1003A6B8
    mov mov esi, dword ptr [esp + 36]
    mov mov eax, dword ptr [g_1072D9CC]
    add add esp, 4
    cmp cmp eax, esi
    je L8
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L7
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L9
    call sub_1003A9BF
    mov mov dword ptr [g_1072D9CC], esi
    fld fld dword ptr [ebx]
    mov mov edx, dword ptr [ebx]
    mov mov eax, dword ptr [esp + 28]
    fsub fsub dword ptr [eax + 4]
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov dword ptr [esp + 20], edx
    push push 0
    fstp fstp dword ptr [esp + 36]
    push push 0
    fld fld dword ptr [esp + 28]
    mov mov edi, dword ptr [esp + 40]
    mov mov esi, edx
    fchs fchs
    push push esi
    fstp fstp dword ptr [esp + 48]
    mov mov ebx, dword ptr [esp + 48]
    push push edi
    push push ebx
    push push ebx
    lea lea edx, [esp + 36]
    call sub_1002E772
    mov mov eax, dword ptr [g_1072D9D4]
    push push 0
    push push 0
    push push esi
    push push edi
    push push esi
    push push ebx
    inc inc eax
    lea lea edx, [esp + 60]
    call sub_1002E789
    mov mov eax, dword ptr [g_1072D9D4]
    push push 0
    push push 0
    push push esi
    push push edi
    push push esi
    push push esi
    add add eax, 2
    lea lea edx, [esp + 84]
    call sub_1002E7A2
    mov mov eax, dword ptr [g_1072D9D4]
    add add esp, 72
    push push 0
    push push 0
    push push esi
    push push edi
    push push ebx
    push push esi
    add add eax, 3
    lea lea edx, [esp + 36]
    call sub_1002E7BE
    mov mov cx, word ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov eax, dword ptr [g_1072D9D0]
    mov mov word ptr [edx + eax*2], cx
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov eax, dword ptr [g_1072D9D0]
    add add esp, 24
    inc inc ecx
    mov mov word ptr [edx + eax*2 + 2], cx
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov eax, dword ptr [g_1072D9D0]
    add add ecx, 2
    mov mov word ptr [edx + eax*2 + 4], cx
    mov mov ecx, dword ptr [g_1072D9D4]
L8:
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov eax, dword ptr [g_1072D9D0]
    add add ecx, 2
    mov mov word ptr [edx + eax*2 + 6], cx
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov eax, dword ptr [g_1072D9D0]
    add add ecx, 3
    mov mov word ptr [edx + eax*2 + 8], cx
    mov mov cx, word ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov eax, dword ptr [g_1072D9B0]
    mov mov word ptr [eax + edx*2 + 10], cx
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov ebx, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [esp + 16]
    mov mov ecx, 4
    add add eax, ecx
    mov mov dword ptr [g_1072D9D4], eax
    mov mov eax, dword ptr [esp + 24]
    add add ebx, 6
    add add esi, ecx
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [g_1072D9D0], ebx
    mov mov edx, dword ptr [ecx + 8]
    inc inc eax
    cmp cmp eax, edx
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 16], esi
    jl sub_1002FDBA
    call sub_1003AB27
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx]
    movzx movzx edx, word ptr [eax + 2]
    pop pop edi
    add add edx, eax
    pop pop esi
    mov mov dword ptr [ecx], edx
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1002faf0 ENDP
END
