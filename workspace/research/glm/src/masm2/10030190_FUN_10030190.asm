.686
.MODEL FLAT, C
EXTRN sub_1002E8CD:PROC
EXTRN sub_1002E903:PROC
EXTRN sub_1002E93C:PROC
EXTRN sub_1002E95F:PROC
EXTRN sub_1003A9EE:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_101D1B90:DWORD:DWORD
EXTRN EXTRN g_101D1B94:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
.CODE
FUN_10030190 PROC
    sub sub esp, 20
    fild fild dword ptr [g_1076671C]
    push push ebx
    push push ebp
    push push esi
    fmul fmul dword ptr [g_1019BCB0]
    push push edi
    push push 03F800000h
    push push 03F800000h
    fstp fstp dword ptr [esp + 32]
    xor xor ecx, ecx
    fild fild dword ptr [g_10766720]
    push push ecx
    push push ecx
    mov mov al, 0FFh
    fmul fmul dword ptr [g_1019BCB0]
    mov mov byte ptr [esp + 34], al
    mov mov byte ptr [esp + 35], al
    mov mov eax, dword ptr [g_101D1B90]
    fstp fstp dword ptr [esp + 36]
    mov mov byte ptr [esp + 33], cl
    fld fld dword ptr [esp + 40]
    mov mov byte ptr [esp + 32], cl
    fmul fmul dword ptr [g_1019BCB0]
    mov mov ebx, dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 36]
    mov mov edi, dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 44]
    mov mov esi, dword ptr [esp + 44]
    push push esi
    push push edi
    push push esi
    push push edi
    call sub_1002E8CD
    mov mov ebp, dword ptr [esp + 56]
    push push 03F800000h
    push push 03F800000h
    xor xor ecx, ecx
    push push ecx
    push push ecx
    push push esi
    mov mov al, 0FFh
    push push edi
    mov mov byte ptr [esp + 73], al
    mov mov byte ptr [esp + 75], al
    mov mov eax, dword ptr [g_101D1B90]
    mov mov byte ptr [esp + 74], cl
    mov mov byte ptr [esp + 72], cl
    mov mov ebx, dword ptr [esp + 72]
    push push esi
    push push ebp
    call sub_1002E903
    add add esp, 64
    push push 03F800000h
    push push 03F800000h
    xor xor ecx, ecx
    push push ecx
    push push ecx
    mov mov al, 0FFh
    mov mov byte ptr [esp + 32], al
    mov mov byte ptr [esp + 35], al
    mov mov eax, dword ptr [esp + 36]
    push push esi
    push push edi
    push push eax
    mov mov eax, dword ptr [g_101D1B90]
    mov mov byte ptr [esp + 46], cl
    mov mov byte ptr [esp + 45], cl
    mov mov ebx, dword ptr [esp + 44]
    push push edi
    call sub_1002E93C
    mov mov ecx, dword ptr [esp + 52]
    push push 03F800000h
    push push 03F800000h
    push push 0
    push push 0
    push push esi
    push push edi
    push push ecx
    push push ebp
    mov mov eax, dword ptr [g_101D1B94]
    or or ebx, -1
    call sub_1002E95F
    add add esp, 64
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 20
    jmp sub_1003A9EE
FUN_10030190 ENDP
END
