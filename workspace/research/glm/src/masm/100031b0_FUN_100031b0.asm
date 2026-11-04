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
EXTRN sub_10013AB8:PROC
EXTRN sub_10013AEE:PROC
EXTRN sub_1002A769:PROC
EXTRN sub_1002A7D5:PROC
EXTRN sub_1002A892:PROC
EXTRN sub_1002A8B3:PROC
EXTRN sub_1002A8D5:PROC
EXTRN sub_1002AAC1:PROC
EXTRN fp_101D4B60:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_101AE37C:DWORD
EXTRN g_101AE380:DWORD
EXTRN g_101CE658:DWORD
.CODE
FUN_100031b0 PROC
    sub esp, 00000009Ch
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0000000A8h]
    push edi
    lea eax, [esp + 24]
    push eax
    lea ecx, [esp + 20]
    push ecx
    push esi
    mov ebx, ebp
    call sub_10003052
    add esp, 12
    test al, al
    je L12
    mov ecx, dword ptr [g_101AE37C]
    mov ebx, dword ptr [g_101AE380]
    lea eax, [ecx + ecx*2]
    shl eax, 5
    add eax, ebx
    inc ecx
    push 0
    push 010191804h
    mov ebx, esi
    mov edi, ebp
    mov dword ptr [esp + 28], eax
    mov dword ptr [g_101AE37C], ecx
    call sub_10002EDC
    fld dword ptr [g_1019BC84]
    fld st(1)
    add esp, 8
    fucompp
    fnstsw ax
    test ah, 68
    jnp L0
    fstp dword ptr [esp + 52]
    mov dword ptr [esp + 48], 0
    mov dword ptr [esp + 56], 0
    jmp L1
L0:
    push esi
    fstp st(0)
    push ebp
    push 0101918E8h
    push 0101917FCh
    lea edi, [esp + 64]
    call sub_10002F6D
    add esp, 16
L1:
    push esi
    push ebp
    push 0101917F4h
    push 0101917E4h
    lea edi, [esp + 76]
    call sub_10002F85
    add esp, 16
    test al, al
    jne L2
    push 03F800000h
    push 0101917D8h
    mov ebx, esi
    mov edi, ebp
    call sub_10002F4F
    fst dword ptr [esp + 68]
    fst dword ptr [esp + 72]
    add esp, 8
    fstp dword ptr [esp + 68]
L2:
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 68]
    mov edi, dword ptr [esp + 16]
    push edx
    push eax
    lea ecx, [esp + 56]
    push ecx
    lea edx, [esp + 36]
    push edx
    push edi
    push 0101AE288h
    call sub_1002AAC1
    push edi
    call dword ptr [fp_101D4B60]
    mov bl, al
    add esp, 28
    lea eax, [esp + 24]
    push eax
    push ebp
    push 0101917CCh
    mov edi, esi
    mov eax, 0101917C4h
    and bl, 1
    call sub_10003077
    mov ecx, dword ptr [g_101CE658]
    mov dl, byte ptr [ecx + 8]
    add esp, 12
    test dl, dl
    je L6
    test bl, bl
    mov dword ptr [esp + 32], 0
    mov dword ptr [esp + 36], 0
    je L3
    test al, al
    mov dword ptr [esp + 28], 03F800000h
    je L4
    mov dword ptr [esp + 24], 0
    jmp L5
L3:
    mov dword ptr [esp + 28], 0
L4:
    mov dword ptr [esp + 24], 03F800000h
L5:
    lea edx, [esp + 16]
    push edx
    lea ecx, [esp + 76]
    lea edx, [esp + 28]
    call sub_1002A8B3
    add esp, 4
    jmp L11
L6:
    test bl, bl
    je L7
    test al, al
    je L7
    lea eax, [esp + 16]
    push eax
    lea ecx, [esp + 76]
    lea edx, [esp + 28]
    call sub_1002A8D5
    add esp, 4
    jmp L8
L7:
    mov eax, dword ptr [esp + 20]
    lea ecx, [esp + 72]
    push ecx
    lea edx, [esp + 20]
    push edx
    mov edx, 0101AE288h
    call sub_1002A892
    add esp, 8
L8:
    push 03F800000h
    push 0101917B0h
    mov ebx, esi
    mov edi, ebp
    call sub_10003058
    fst dword ptr [esp + 48]
    fcomp dword ptr [g_1019BC84]
    add esp, 8
    fnstsw ax
    test ah, 5
    jp L9
    push 010191784h
    push 1
    call sub_10013AB8
    add esp, 8
L9:
    push 03F800000h
    push 010191770h
    mov ebx, esi
    mov edi, ebp
    call sub_1000308E
    fst dword ptr [esp + 52]
    fcomp dword ptr [g_1019BC84]
    add esp, 8
    fnstsw ax
    test ah, 5
    jp L10
    push 010191744h
    push 1
    call sub_10013AEE
    add esp, 8
L10:
    mov ecx, dword ptr [esp + 44]
    mov edx, dword ptr [esp + 40]
    lea eax, [esp + 72]
    push eax
    push ecx
    push edx
    lea eax, [esp + 28]
    call sub_1002A769
    add esp, 12
L11:
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 20]
    lea eax, [esp + 72]
    push eax
    push ecx
    push edx
    mov edx, 0101AE288h
    call sub_1002A7D5
    add esp, 12
L12:
    pop edi
    pop ebp
    pop ebx
    add esp, 00000009Ch
    ret
FUN_100031b0 ENDP
END
