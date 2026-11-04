.686
.MODEL FLAT, C
EXTRN sub_1001D06F:PROC
EXTRN sub_1001D076:PROC
EXTRN sub_1001D07B:PROC
EXTRN sub_1001D080:PROC
EXTRN sub_1001D084:PROC
EXTRN sub_1001D088:PROC
EXTRN sub_1001D092:PROC
EXTRN sub_1001D09C:PROC
EXTRN sub_1001D0B2:PROC
EXTRN sub_1001D0B6:PROC
EXTRN sub_1001D590:PROC
EXTRN sub_1001D5C6:PROC
.CODE
FUN_1001cfd0 PROC
    mov mov eax, dword ptr [esp + 8]
    push push edi
    mov mov edi, dword ptr [esp + 8]
    cmp cmp edi, eax
    je sub_1001D06F
    push push esi
    lea lea esi, [edi + 12]
    cmp cmp esi, eax
    je sub_1001D076
    push push ebx
    push push ebp
    lea lea ebp, [esi + 12]
    mov mov edi, edi
    mov mov ebx, dword ptr [esp + 28]
    push push edi
    push push esi
    call call ebx
    add add esp, 8
    test test al, al
    je L0
    cmp cmp edi, esi
    je sub_1001D080
    cmp cmp esi, ebp
    je sub_1001D084
    push push ebp
    push push edi
    mov mov eax, esi
    call sub_1001D590
    add add esp, 8
    jmp sub_1001D092
    lea lea edi, [ebp - 24]
    push push edi
    push push esi
    call call ebx
    add add esp, 8
    test test al, al
    je sub_1001D09C
    mov mov ebx, edi
    sub sub edi, 12
    push push edi
    push push esi
    call call dword ptr [esp + 36]
    add add esp, 8
    test test al, al
    jne sub_1001D088
    cmp cmp ebx, esi
    je sub_1001D0B2
    cmp cmp esi, ebp
    je sub_1001D0B6
    push push ebp
    push push ebx
    mov mov eax, esi
    call sub_1001D5C6
    add add esp, 8
    mov mov edi, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 24]
    add add esi, 12
    add add ebp, 12
    cmp cmp esi, eax
    jne sub_1001D07B
    pop pop ebp
    pop pop ebx
    pop pop esi
    pop pop edi
    ret ret
FUN_1001cfd0 ENDP
END
