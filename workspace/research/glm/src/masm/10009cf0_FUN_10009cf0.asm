.686
.MODEL FLAT, C
EXTRN sub_100092FF:PROC
EXTRN sub_1000942B:PROC
EXTRN sub_10009BEB:PROC
EXTRN sub_100F883A:PROC
EXTRN g_101CE5EC:DWORD
EXTRN g_101D7E9C:DWORD
EXTRN g_10678500:DWORD
.CODE
FUN_10009cf0 PROC
    mov eax, 000001C08h
    call sub_100F883A
    push ebp
    push esi
    push 0
    lea eax, [esp + 000000C14h]
    push eax
    mov eax, dword ptr [esp + 000001C1Ch]
    lea ecx, [esp + 24]
    push ecx
    push edi
    push ebx
    push edx
    push eax
    call sub_10009BEB
    xor ebp, ebp
    add esp, 28
    test eax, eax
    mov dword ptr [esp + 12], eax
    mov dword ptr [esp + 8], ebp
    jle L4
    lea esp, [esp]
L0:
    mov esi, dword ptr [esp + ebp*4 + 000000C10h]
    push edi
    push ebx
    push esi
    call sub_100092FF
    mov al, byte ptr [g_101CE5EC]
    add esp, 12
    test al, al
    je L3
    mov eax, dword ptr [esi + 40]
    test eax, eax
    mov esi, dword ptr [esi + 44]
    je L3
    mov ebp, eax
    jmp L1
    lea esp, [esp]
L1:
    mov ecx, dword ptr [g_101D7E9C]
    mov eax, dword ptr [esi]
    mov edx, dword ptr [ecx + eax*4]
    cmp edx, dword ptr [g_10678500]
    je L2
    push edi
    mov ecx, ebx
    call sub_1000942B
    add esp, 4
L2:
    add esi, 4
    dec ebp
    jne L1
    mov ebp, dword ptr [esp + 8]
L3:
    mov eax, dword ptr [esp + 12]
    inc ebp
    cmp ebp, eax
    mov dword ptr [esp + 8], ebp
    jl L0
L4:
    pop esi
    pop ebp
FUN_10009cf0 ENDP
END
