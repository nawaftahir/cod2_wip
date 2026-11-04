.686
.MODEL FLAT, C
EXTRN sub_10067CCF:PROC
EXTRN sub_1006829C:PROC
EXTRN sub_100682A3:PROC
EXTRN sub_100682B1:PROC
EXTRN sub_100682B5:PROC
EXTRN sub_100682D8:PROC
EXTRN sub_10068301:PROC
EXTRN sub_1006832A:PROC
EXTRN sub_100F8613:PROC
EXTRN sub_100F862E:PROC
.CODE
FUN_100681f2 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push edi
    mov mov edi, ecx
    cmp cmp ebx, dword ptr [edi + 4]
    jae sub_100682A3
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F8613
    test test eax, eax
    pop pop ecx
    je sub_100682B1
    push push esi
    xor xor esi, esi
    mov mov eax, ebx
    cmp cmp eax, dword ptr [edi + 4]
    mov mov dword ptr [ebp - 4], esi
    jae L1
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F862E
    test test eax, eax
    pop pop ecx
    je sub_1006829C
    cmp cmp esi, 019999999h
    jbe L0
    mov mov dword ptr [ebp - 4], 1
    movsx movsx ecx, byte ptr [ebx]
    lea lea eax, [esi + esi*4]
    shl shl eax, 1
    lea lea esi, [ecx + eax - 48]
    cmp cmp esi, eax
    jae sub_100682B5
    mov mov dword ptr [ebp - 4], 1
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 4]
    jb L1
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_100682D8
    mov mov dword ptr [eax], esi
    cmp cmp dword ptr [ebp - 4], 0
    pop pop esi
    je sub_10068301
    push push 01010CB58h
    push push 03ECh
    lea lea eax, [edi + 8]
    push push eax
    push push dword ptr [edi + 48]
    call sub_10067CCF
    add add esp, 16
    mov mov eax, ebx
    sub sub eax, dword ptr [ebp + 8]
    jmp sub_1006832A
    xor xor eax, eax
    pop pop edi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100681f2 ENDP
END
