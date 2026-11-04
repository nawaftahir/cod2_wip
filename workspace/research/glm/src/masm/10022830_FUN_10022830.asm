.686
.MODEL FLAT, C
EXTRN sub_10022803:PROC
EXTRN sub_10061D53:PROC
EXTRN sub_100EFEB0:PROC
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4814:DWORD
EXTRN g_101D4828:DWORD
EXTRN g_101D4924:DWORD
.CODE
FUN_10022830 PROC
    mov eax, dword ptr [g_101D4924]
    sub esp, 8
    test eax, eax
    jne L0
    mov eax, dword ptr [g_101D4814]
    test eax, eax
    jne L1
    mov eax, dword ptr [g_101D4828]
    test eax, eax
    mov dword ptr [g_101D4924], eax
    je L1
L0:
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 4]
    mov eax, dword ptr [g_101D4924]
    add esp, 8
    ret
L1:
    push esi
    push edi
    lea edx, [esp + 8]
    push edx
    lea eax, [esp + 16]
    push eax
    call sub_10022803
    mov esi, dword ptr [esp + 16]
    mov eax, dword ptr [g_101D1BF8]
    mov edi, dword ptr [esp + 20]
    mov ecx, dword ptr [eax]
    add esp, 8
    push 0
    push 0101D4924h
    push 0
    push 0
    push 0
    push 75
    push esi
    push edi
    push eax
    call dword ptr [ecx + 0x74]
    test eax, eax
    jge L2
    push eax
    call sub_100EFEB0
    push eax
    push esi
    push edi
    push 010196B6Ch
    push 0
    call sub_10061D53
    add esp, 20
L2:
    mov eax, dword ptr [g_101D4924]
    pop edi
    pop esi
    add esp, 8
    ret
FUN_10022830 ENDP
END
