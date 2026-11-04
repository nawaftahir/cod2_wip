.686
.MODEL FLAT, C
EXTRN sub_10109503:PROC
EXTRN sub_1010A380:PROC
EXTRN sub_1010A384:PROC
EXTRN EXTRN g_101AE02C:DWORD:DWORD
.CODE
findenv PROC
    push push esi
    mov mov esi, dword ptr [g_101AE02C]
    jmp L0
    push push edi
    push push eax
    push push dword ptr [esp + 16]
    call sub_10109503
    add add esp, 12
    test test eax, eax
    jne L2
    mov mov eax, dword ptr [esi]
    mov mov al, byte ptr [edi + eax]
    cmp cmp al, 61
    je sub_1010A380
    test test al, al
    je sub_1010A384
    add add esi, 4
    mov mov eax, dword ptr [esi]
    test test eax, eax
    jne L1
    mov mov eax, esi
    sub sub eax, dword ptr [g_101AE02C]
    pop pop esi
L1:
    sar sar eax, 2
    neg neg eax
    ret ret
    mov mov eax, esi
    sub sub eax, dword ptr [g_101AE02C]
    pop pop esi
    sar sar eax, 2
    ret ret
findenv ENDP
END
