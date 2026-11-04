.686
.MODEL FLAT, C
EXTRN sub_10002EDC:PROC
EXTRN sub_10002F4F:PROC
EXTRN sub_10002F6D:PROC
EXTRN sub_10002F85:PROC
EXTRN sub_10003052:PROC
EXTRN sub_10003058:PROC
EXTRN sub_10003077:PROC
EXTRN sub_1000308E:PROC
EXTRN sub_10003445:PROC
EXTRN sub_1000345C:PROC
EXTRN sub_10003470:PROC
EXTRN sub_10003472:PROC
EXTRN sub_10003482:PROC
EXTRN sub_100034E9:PROC
EXTRN sub_100034ED:PROC
EXTRN sub_1000351F:PROC
EXTRN sub_10003587:PROC
EXTRN sub_10003597:PROC
EXTRN sub_10003603:PROC
EXTRN sub_10013AB8:PROC
EXTRN sub_10013AEE:PROC
EXTRN sub_1002A769:PROC
EXTRN sub_1002A7D5:PROC
EXTRN sub_1002A892:PROC
EXTRN sub_1002A8B3:PROC
EXTRN sub_1002A8D5:PROC
EXTRN sub_1002AAC1:PROC
EXTRN EXTRN fp_101D4B60:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101AE37C:DWORD:DWORD
EXTRN EXTRN g_101AE380:DWORD:DWORD
EXTRN EXTRN g_101CE658:DWORD:DWORD
.CODE
FUN_100031b0 PROC
    sub sub esp, 09Ch
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 0A8h]
    push push edi
    lea lea eax, [esp + 24]
    push push eax
    lea lea ecx, [esp + 20]
    push push ecx
    push push esi
    mov mov ebx, ebp
    call sub_10003052
    add add esp, 12
    test test al, al
    je sub_10003445
    mov mov ecx, dword ptr [g_101AE37C]
    mov mov ebx, dword ptr [g_101AE380]
    lea lea eax, [ecx + ecx*2]
    shl shl eax, 5
    add add eax, ebx
    inc inc ecx
    push push 0
    push push 010191804h
    mov mov ebx, esi
    mov mov edi, ebp
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [g_101AE37C], ecx
    call sub_10002EDC
    fld fld dword ptr [g_1019BC84]
    fld fld st(1)
    add add esp, 8
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L0
    fstp fstp dword ptr [esp + 52]
    mov mov dword ptr [esp + 48], 0
    mov mov dword ptr [esp + 56], 0
    jmp L1
    push push esi
    fstp fstp st(0)
    push push ebp
    push push 0101918E8h
    push push 0101917FCh
    lea lea edi, [esp + 64]
    call sub_10002F6D
    add add esp, 16
    push push esi
    push push ebp
    push push 0101917F4h
    push push 0101917E4h
    lea lea edi, [esp + 76]
    call sub_10002F85
    add add esp, 16
    test test al, al
    jne L2
    push push 03F800000h
    push push 0101917D8h
    mov mov ebx, esi
    mov mov edi, ebp
    call sub_10002F4F
    fst fst dword ptr [esp + 68]
    fst fst dword ptr [esp + 72]
    add add esp, 8
    fstp fstp dword ptr [esp + 68]
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 68]
    mov mov edi, dword ptr [esp + 16]
    push push edx
    push push eax
    lea lea ecx, [esp + 56]
    push push ecx
    lea lea edx, [esp + 36]
    push push edx
L0:
    push push edi
    push push 0101AE288h
    call sub_1002AAC1
    push push edi
    call dword ptr [fp_101D4B60]
    mov mov bl, al
    add add esp, 28
    lea lea eax, [esp + 24]
    push push eax
    push push ebp
    push push 0101917CCh
    mov mov edi, esi
    mov mov eax, 0101917C4h
    and and bl, 1
    call sub_10003077
    mov mov ecx, dword ptr [g_101CE658]
    mov mov dl, byte ptr [ecx + 8]
    add add esp, 12
    test test dl, dl
    je sub_10003472
    test test bl, bl
    mov mov dword ptr [esp + 32], 0
    mov mov dword ptr [esp + 36], 0
    je sub_1000345C
    test test al, al
    mov mov dword ptr [esp + 28], 03F800000h
    je sub_10003470
    mov mov dword ptr [esp + 24], 0
    jmp sub_10003482
    mov mov dword ptr [esp + 28], 0
    mov mov dword ptr [esp + 24], 03F800000h
    lea lea edx, [esp + 16]
    push push edx
    lea lea ecx, [esp + 76]
    lea lea edx, [esp + 28]
    call sub_1002A8B3
    add add esp, 4
    jmp sub_10003587
    test test bl, bl
    je sub_100034E9
    test test al, al
    je sub_100034ED
    lea lea eax, [esp + 16]
    push push eax
    lea lea ecx, [esp + 76]
    lea lea edx, [esp + 28]
    call sub_1002A8D5
    add add esp, 4
    jmp sub_1000351F
    mov mov eax, dword ptr [esp + 20]
    lea lea ecx, [esp + 72]
    push push ecx
    lea lea edx, [esp + 20]
    push push edx
    mov mov edx, 0101AE288h
    call sub_1002A892
    add add esp, 8
    push push 03F800000h
    push push 0101917B0h
    mov mov ebx, esi
    mov mov edi, ebp
    call sub_10003058
    fst fst dword ptr [esp + 48]
    fcomp fcomp dword ptr [g_1019BC84]
    add add esp, 8
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10003597
    push push 010191784h
    push push 1
    call sub_10013AB8
    add add esp, 8
    push push 03F800000h
    push push 010191770h
    mov mov ebx, esi
    mov mov edi, ebp
    call sub_1000308E
    fst fst dword ptr [esp + 52]
    fcomp fcomp dword ptr [g_1019BC84]
    add add esp, 8
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10003603
    push push 010191744h
    push push 1
    call sub_10013AEE
    add add esp, 8
    mov mov ecx, dword ptr [esp + 44]
    mov mov edx, dword ptr [esp + 40]
    lea lea eax, [esp + 72]
    push push eax
    push push ecx
    push push edx
    lea lea eax, [esp + 28]
    call sub_1002A769
    add add esp, 12
    mov mov ecx, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 20]
    lea lea eax, [esp + 72]
    push push eax
    push push ecx
    push push edx
    mov mov edx, 0101AE288h
    call sub_1002A7D5
    add add esp, 12
    pop pop edi
    pop pop ebp
    pop pop ebx
    add add esp, 09Ch
    ret ret
FUN_100031b0 ENDP
END
