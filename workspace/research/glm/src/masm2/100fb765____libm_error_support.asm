.686
.MODEL FLAT, C
EXTRN sub_100FB9FE:PROC
EXTRN sub_100FBA19:PROC
EXTRN sub_100FBA36:PROC
EXTRN sub_100FBA38:PROC
EXTRN sub_100FBA3D:PROC
EXTRN sub_100FBA46:PROC
EXTRN sub_100FBA49:PROC
EXTRN sub_100FBA51:PROC
EXTRN sub_100FBA5C:PROC
EXTRN sub_100FBA81:PROC
EXTRN sub_100FBA9E:PROC
EXTRN sub_100FBAA1:PROC
EXTRN sub_100FBAB7:PROC
EXTRN sub_100FBAB9:PROC
EXTRN sub_100FBAC9:PROC
EXTRN sub_100FBAD8:PROC
EXTRN sub_100FBB09:PROC
EXTRN sub_100FBB10:PROC
EXTRN sub_100FBB19:PROC
EXTRN sub_100FBB25:PROC
EXTRN sub_100FBB4F:PROC
EXTRN sub_100FBB8B:PROC
EXTRN sub_100FBB97:PROC
EXTRN sub_100FBB9D:PROC
EXTRN sub_100FBBA3:PROC
EXTRN sub_100FBBBF:PROC
EXTRN sub_100FBBC7:PROC
EXTRN sub_100FBBD7:PROC
EXTRN sub_100FBBD8:PROC
EXTRN sub_100FBBE0:PROC
EXTRN sub_100FBBF8:PROC
EXTRN sub_100FBC56:PROC
EXTRN sub_100FC3FF:PROC
EXTRN sub_100FC48E:PROC
EXTRN sub_10100FD9:PROC
EXTRN EXTRN fp_101A4B20:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
___libm_error_support PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp + 20]
    mov mov ecx, 0A1h
    cmp cmp eax, ecx
    push push esi
    jg L8
    je L7
    cmp cmp eax, 24
    jg L6
    je L5
    push push 2
    pop pop ecx
    sub sub eax, ecx
    je L4
    dec dec eax
    je L3
    sub sub eax, 5
    je L2
    dec dec eax
    je L1
    sub sub eax, 5
    je L0
    dec dec eax
    jne sub_100FBA36
    mov mov dword ptr [ebp - 32], 01010EB1Ch
    jmp L8
    mov mov dword ptr [ebp - 36], 3
    mov mov dword ptr [ebp - 32], 01010EB1Ch
    jmp L13
    mov mov dword ptr [ebp - 32], 0101145BCh
    jmp sub_100FB9FE
    mov mov dword ptr [ebp - 36], ecx
    mov mov dword ptr [ebp - 32], 0101145BCh
    jmp L14
    mov mov dword ptr [ebp - 32], 01010EB18h
    jmp sub_100FBA19
    mov mov dword ptr [ebp - 36], ecx
    mov mov dword ptr [ebp - 32], 01010EB18h
    jmp L15
    mov mov dword ptr [ebp - 36], 3
    mov mov dword ptr [ebp - 32], 01010EAACh
    jmp L16
    sub sub eax, 25
    je L12
    dec dec eax
    je L11
    dec dec eax
    je L10
    dec dec eax
L3:
    je sub_100FBA46
    dec dec eax
    jne sub_100FBAB7
    mov mov dword ptr [ebp - 32], 01010EAACh
    jmp sub_100FBA81
    mov mov dword ptr [ebp - 36], 2
    jmp L9
L6:
    mov mov eax, dword ptr [ebp + 16]
    fld1 fld1
    fstp fstp qword ptr [eax]
    jmp sub_100FBAD8
    mov mov dword ptr [ebp - 32], 01010EAACh
    mov mov eax, dword ptr [ebp + 8]
    fld fld qword ptr [eax]
    mov mov eax, dword ptr [ebp + 12]
    mov mov esi, dword ptr [ebp + 16]
    fstp fstp qword ptr [ebp - 28]
    fld fld qword ptr [eax]
    lea lea eax, [ebp - 36]
    fstp fstp qword ptr [ebp - 20]
    push push eax
    fld fld qword ptr [esi]
    mov mov dword ptr [ebp - 36], 4
    fstp fstp qword ptr [ebp - 12]
    call dword ptr [fp_101A4B20]
    pop pop ecx
    jmp sub_100FBB09
    mov mov dword ptr [ebp - 36], 3
    jmp sub_100FBA49
    mov mov ecx, 03EAh
    cmp cmp eax, ecx
    jg sub_100FBAA1
    je sub_100FBA9E
    sub sub eax, 0A2h
    je sub_100FBA5C
    sub sub eax, 4
    je sub_100FBA51
L8:
    sub sub eax, 4
    je sub_100FBA46
    dec dec eax
    je sub_100FBA3D
    sub sub eax, 033Dh
    je sub_100FBA38
    dec dec eax
    jne sub_100FBB4F
    mov mov dword ptr [ebp - 32], 0101145BCh
    jmp sub_100FBB19
    mov mov dword ptr [ebp - 32], 01010EB18h
    jmp sub_100FBB25
    mov mov dword ptr [ebp - 32], 0101145B4h
    jmp sub_100FBB10
    mov mov dword ptr [ebp - 36], 2
    mov mov dword ptr [ebp - 32], 0101145B4h
    jmp sub_100FBAB9
    mov mov dword ptr [ebp - 36], 3
L11:
    mov mov dword ptr [ebp - 32], 01017C868h
    jmp sub_100FBAC9
L12:
    mov mov dword ptr [ebp - 36], 4
    mov mov dword ptr [ebp - 32], 010114638h
    mov mov eax, dword ptr [ebp + 8]
    fld fld qword ptr [eax]
    mov mov eax, dword ptr [ebp + 12]
    mov mov esi, dword ptr [ebp + 16]
    fstp fstp qword ptr [ebp - 28]
    fld fld qword ptr [eax]
    lea lea eax, [ebp - 36]
    fstp fstp qword ptr [ebp - 20]
    push push eax
    fld fld qword ptr [esi]
    fstp fstp qword ptr [ebp - 12]
    call dword ptr [fp_101A4B20]
    test test eax, eax
    pop pop ecx
    jne sub_100FBBC7
    call sub_100FC3FF
    mov mov dword ptr [eax], 34
    jmp sub_100FBBD7
    mov mov dword ptr [ebp - 32], 01010EB1Ch
    jmp sub_100FBBA3
    sub sub eax, 03EBh
    je sub_100FBBA3
    dec dec eax
    je sub_100FBB9D
    dec dec eax
    je sub_100FBB97
    dec dec eax
    je sub_100FBB8B
    dec dec eax
    jne sub_100FBBF8
    mov mov dword ptr [ebp - 32], 0101145ACh
    jmp sub_100FBBBF
    mov mov dword ptr [ebp - 32], 01010EAACh
    mov mov eax, dword ptr [ebp + 8]
    mov mov esi, dword ptr [ebp + 16]
L13:
    jmp sub_100FBBD8
    mov mov dword ptr [ebp - 32], 010114618h
    jmp sub_100FBBD7
    mov mov dword ptr [ebp - 32], 010114690h
    jmp sub_100FBBE0
    mov mov dword ptr [ebp - 32], 0101146A0h
L14:
    mov mov eax, dword ptr [ebp + 8]
    fld fld qword ptr [eax]
    mov mov esi, dword ptr [ebp + 16]
    fstp fstp qword ptr [esi]
    fld fld qword ptr [eax]
    mov mov eax, dword ptr [ebp + 12]
    fstp fstp qword ptr [ebp - 28]
    mov mov dword ptr [ebp - 36], 1
    fld fld qword ptr [eax]
L15:
    lea lea eax, [ebp - 36]
    fstp fstp qword ptr [ebp - 20]
    push push eax
    fld fld qword ptr [esi]
    fstp fstp qword ptr [ebp - 12]
    call dword ptr [fp_101A4B20]
    test test eax, eax
    pop pop ecx
    jne sub_100FBC56
    call sub_100FC48E
    mov mov dword ptr [eax], 33
    fld fld qword ptr [ebp - 12]
    fstp fstp qword ptr [esi]
    mov mov ecx, dword ptr [ebp - 4]
    pop pop esi
    call sub_10100FD9
    leave leave
    ret ret
___libm_error_support ENDP
END
