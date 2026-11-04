.686
.MODEL FLAT, C
EXTRN sub_1002E3A1:PROC
EXTRN sub_100317F3:PROC
EXTRN sub_10031842:PROC
EXTRN sub_100340A8:PROC
EXTRN sub_100345DF:PROC
EXTRN sub_100345E0:PROC
EXTRN sub_100345E2:PROC
EXTRN sub_100345EC:PROC
EXTRN sub_100345F9:PROC
EXTRN sub_1003465A:PROC
EXTRN sub_1003467D:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN fp_101D49E0:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
.CODE
FUN_10034500 PROC
    sub sub esp, 12
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, eax
    test test edi, edi
    mov mov esi, ecx
    je sub_100345E2
    mov mov al, byte ptr [g_1072DEBD]
    test test al, al
    je L0
    call sub_1002E3A1
    push push 0AA50h
    call dword ptr [fp_101D49DC]
    mov mov edx, dword ptr [esi + 40]
    add add esp, 4
    test test edx, edx
    setne setne byte ptr [esp + 20]
    mov mov ebp, eax
    xor xor eax, eax
L0:
    test test edi, edi
    jle sub_100345EC
    mov mov dword ptr [esp + 24], edi
    mov mov edi, dword ptr [esp + 20]
    add add esi, 24
    lea lea esp, [esp]
    mov mov edx, dword ptr [esi + 16]
    mov mov cl, byte ptr [esp + 20]
    test test edx, edx
    setne setne bl
    cmp cmp cl, bl
    je sub_100345E0
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    test test eax, eax
    je sub_100345DF
    push push edi
    push push ebp
    push push 1
    push push eax
    call sub_100317F3
    add add esp, 16
    mov mov byte ptr [esp + 20], bl
    mov mov edi, dword ptr [esp + 20]
    xor xor eax, eax
    push push eax
    push push edi
    lea lea eax, [esi - 12]
    push push eax
    lea lea ecx, [esi - 24]
    push push ecx
    mov mov eax, ebp
    mov mov ecx, 0AA5h
    mov mov ebx, esi
    call sub_100340A8
    mov mov ecx, dword ptr [esp + 40]
    add add esp, 16
    add add esi, 44
    dec dec ecx
    mov mov dword ptr [esp + 24], ecx
    jne sub_100345F9
    jmp sub_1003465A
    mov mov edi, dword ptr [esp + 20]
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    test test eax, eax
    je sub_1003467D
    push push edi
    push push ebp
    push push 1
    push push eax
    call sub_10031842
    add add esp, 16
    push push ebp
    call dword ptr [fp_101D49E0]
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
FUN_10034500 ENDP
END
