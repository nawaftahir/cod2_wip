.686
.MODEL FLAT, C
EXTRN sub_10109503:PROC
EXTRN g_101AE02C:DWORD
.CODE
findenv PROC
    push esi
    mov esi, dword ptr [g_101AE02C]
    jmp L2
L0:
    push edi
    push eax
    push dword ptr [esp + 16]
    call sub_10109503
    add esp, 12
    test eax, eax
    jne L1
    mov eax, dword ptr [esi]
    mov al, byte ptr [edi + eax]
    cmp al, 61
    je L3
    test al, al
    je L3
L1:
    add esi, 4
L2:
    mov eax, dword ptr [esi]
    test eax, eax
    jne L0
    mov eax, esi
    sub eax, dword ptr [g_101AE02C]
    pop esi
    sar eax, 2
    neg eax
    ret
L3:
    mov eax, esi
    sub eax, dword ptr [g_101AE02C]
    pop esi
    sar eax, 2
    ret
findenv ENDP
END
