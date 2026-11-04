.686
.MODEL FLAT, C
EXTRN sub_1002E8CD:PROC
EXTRN sub_1002E903:PROC
EXTRN sub_1002E93C:PROC
EXTRN sub_1002E95F:PROC
EXTRN sub_1003A9EE:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_101D1B90:DWORD
EXTRN g_101D1B94:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
.CODE
FUN_10030190 PROC
    sub esp, 20
    fild dword ptr [g_1076671C]
    push ebx
    push ebp
    push esi
    fmul dword ptr [g_1019BCB0]
    push edi
    push 03F800000h
    push 03F800000h
    fstp dword ptr [esp + 32]
    xor ecx, ecx
    fild dword ptr [g_10766720]
    push ecx
    push ecx
    mov al, 0000000FFh
    fmul dword ptr [g_1019BCB0]
    mov byte ptr [esp + 34], al
    mov byte ptr [esp + 35], al
    mov eax, dword ptr [g_101D1B90]
    fstp dword ptr [esp + 36]
    mov byte ptr [esp + 33], cl
    fld dword ptr [esp + 40]
    mov byte ptr [esp + 32], cl
    fmul dword ptr [g_1019BCB0]
    mov ebx, dword ptr [esp + 32]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 36]
    mov edi, dword ptr [esp + 48]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 44]
    mov esi, dword ptr [esp + 44]
    push esi
    push edi
    push esi
    push edi
    call sub_1002E8CD
    mov ebp, dword ptr [esp + 56]
    push 03F800000h
    push 03F800000h
    xor ecx, ecx
    push ecx
    push ecx
    push esi
    mov al, 0000000FFh
    push edi
    mov byte ptr [esp + 73], al
    mov byte ptr [esp + 75], al
    mov eax, dword ptr [g_101D1B90]
    mov byte ptr [esp + 74], cl
    mov byte ptr [esp + 72], cl
    mov ebx, dword ptr [esp + 72]
    push esi
    push ebp
    call sub_1002E903
    add esp, 64
    push 03F800000h
    push 03F800000h
    xor ecx, ecx
    push ecx
    push ecx
    mov al, 0000000FFh
    mov byte ptr [esp + 32], al
    mov byte ptr [esp + 35], al
    mov eax, dword ptr [esp + 36]
    push esi
    push edi
    push eax
    mov eax, dword ptr [g_101D1B90]
    mov byte ptr [esp + 46], cl
    mov byte ptr [esp + 45], cl
    mov ebx, dword ptr [esp + 44]
    push edi
    call sub_1002E93C
    mov ecx, dword ptr [esp + 52]
    push 03F800000h
    push 03F800000h
    push 0
    push 0
    push esi
    push edi
    push ecx
    push ebp
    mov eax, dword ptr [g_101D1B94]
    or ebx, 0FFFFFFFFh
    call sub_1002E95F
    add esp, 64
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 20
    jmp sub_1003A9EE
FUN_10030190 ENDP
END
