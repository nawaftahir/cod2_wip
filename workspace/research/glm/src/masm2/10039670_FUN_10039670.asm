.686
.MODEL FLAT, C
EXTRN sub_1001390A:PROC
EXTRN sub_10039639:PROC
EXTRN sub_100396E6:PROC
EXTRN sub_100396EA:PROC
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
.CODE
FUN_10039670 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    mov mov ebx, eax
    mov mov eax, dword ptr [ebx]
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 20]
    mov mov dword ptr [ebp], eax
    mov mov ecx, dword ptr [ebx + 4]
    xor xor esi, esi
    mov mov dword ptr [ebp + 4], ecx
    add add edi, 4
    mov mov edi, edi
    mov mov eax, dword ptr [edi]
    mov mov ecx, ebp
    call sub_10039639
    test test al, al
    jne sub_100396EA
    mov mov edx, dword ptr [g_1072D9BC]
    mov mov eax, dword ptr [edx]
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [ecx]
    push push eax
    push push esi
    push push edx
    push push 010198BA8h
    push push 0
    call sub_1001390A
    add add esp, 20
    inc inc esi
    add add edi, 4
    cmp cmp esi, 11
    jb sub_100396E6
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10039670 ENDP
END
