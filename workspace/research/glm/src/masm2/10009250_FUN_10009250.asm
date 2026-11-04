.686
.MODEL FLAT, C
EXTRN sub_100087D5:PROC
EXTRN sub_10009214:PROC
EXTRN sub_100092B4:PROC
EXTRN sub_100092BA:PROC
EXTRN sub_100092C3:PROC
EXTRN sub_100092CB:PROC
EXTRN sub_100092D3:PROC
EXTRN EXTRN g_1067850C:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10009250 PROC
    push push ecx
    mov mov eax, dword ptr [g_1067850C]
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    xor xor esi, esi
    test test eax, eax
    push push edi
    mov mov dword ptr [esp + 12], eax
    jle sub_100092BA
    xor xor edi, edi
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_10678510]
    mov mov eax, dword ptr [edi + eax]
    cmp cmp eax, 1
    jg sub_100092B4
    push push ebx
    push push ebp
    push push esi
    call sub_100087D5
    jmp sub_100092CB
    cmp cmp eax, 3
    jne sub_100092D3
    push push ebx
    push push ebp
    push push esi
    call sub_10009214
    add add esp, 12
    mov mov eax, dword ptr [esp + 12]
    inc inc esi
    add add edi, 116
    cmp cmp esi, eax
    jl sub_100092C3
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ecx
    ret ret
FUN_10009250 ENDP
END
