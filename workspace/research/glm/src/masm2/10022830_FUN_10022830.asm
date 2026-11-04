.686
.MODEL FLAT, C
EXTRN sub_10022803:PROC
EXTRN sub_10022924:PROC
EXTRN sub_10061D53:PROC
EXTRN sub_100EFEB0:PROC
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4814:DWORD:DWORD
EXTRN EXTRN g_101D4828:DWORD:DWORD
EXTRN EXTRN g_101D4924:DWORD:DWORD
.CODE
FUN_10022830 PROC
    mov mov eax, dword ptr [g_101D4924]
    sub sub esp, 8
    test test eax, eax
    jne L0
    mov mov eax, dword ptr [g_101D4814]
    test test eax, eax
    jne L1
    mov mov eax, dword ptr [g_101D4828]
    test test eax, eax
    mov mov dword ptr [g_101D4924], eax
    je L2
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 4]
    mov mov eax, dword ptr [g_101D4924]
    add add esp, 8
    ret ret
    push push esi
    push push edi
    lea lea edx, [esp + 8]
    push push edx
    lea lea eax, [esp + 16]
    push push eax
    call sub_10022803
    mov mov esi, dword ptr [esp + 16]
L1:
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edi, dword ptr [esp + 20]
    mov mov ecx, dword ptr [eax]
    add add esp, 8
L2:
    push push 0
    push push 0101D4924h
    push push 0
    push push 0
    push push 0
    push push 75
    push push esi
    push push edi
    push push eax
    call call dword ptr [ecx + 116]
    test test eax, eax
    jge sub_10022924
    push push eax
    call sub_100EFEB0
    push push eax
    push push esi
    push push edi
    push push 010196B6Ch
    push push 0
    call sub_10061D53
    add add esp, 20
    mov mov eax, dword ptr [g_101D4924]
    pop pop edi
    pop pop esi
    add add esp, 8
    ret ret
FUN_10022830 ENDP
END
