.686
.MODEL FLAT, C
EXTRN sub_10058C8B:PROC
EXTRN sub_10058CA8:PROC
.CODE
FUN_10058c10 PROC
    sub sub esp, 8
    push push ebx
    xor xor ebx, ebx
    cmp cmp esi, ebx
    jne L0
    xor xor al, al
    pop pop ebx
    add add esp, 8
    ret ret
    mov mov dword ptr [esp + 8], ebx
    xor xor cl, cl
    mov mov edx, 0101A5EDCh
    lea lea esp, [esp]
    fld fld dword ptr [edx - 4]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [edx + 4]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [edx]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fcomp fcomp dword ptr [esp + 8]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10058CA8
    mov mov eax, dword ptr [esp + 4]
    mov mov dword ptr [esp + 8], eax
    mov mov bl, cl
    inc inc cl
    add add edx, 12
    cmp cmp cl, 0A2h
    jb sub_10058C8B
    mov mov al, bl
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10058c10 ENDP
END
