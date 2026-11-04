.686
.MODEL FLAT, C
EXTRN sub_10064CA1:PROC
EXTRN sub_10064CB5:PROC
EXTRN sub_10064CB9:PROC
EXTRN sub_10064CE2:PROC
EXTRN sub_10064CEA:PROC
EXTRN sub_10064CF4:PROC
EXTRN sub_10064CF6:PROC
EXTRN sub_10064CFE:PROC
EXTRN sub_10064D16:PROC
EXTRN sub_10064D28:PROC
EXTRN sub_10064D2A:PROC
EXTRN sub_10064D39:PROC
EXTRN sub_10064D48:PROC
EXTRN sub_10064D51:PROC
EXTRN sub_10064D5F:PROC
EXTRN sub_10064D65:PROC
EXTRN sub_10064D7B:PROC
EXTRN sub_10064D8B:PROC
EXTRN sub_10064D9F:PROC
EXTRN sub_10064DA3:PROC
EXTRN sub_10064DE0:PROC
EXTRN sub_10064E1C:PROC
EXTRN sub_10064E1E:PROC
EXTRN sub_10064E25:PROC
EXTRN sub_10064E70:PROC
EXTRN sub_10064E96:PROC
EXTRN sub_10064EA4:PROC
EXTRN sub_10064EA6:PROC
EXTRN sub_10064EB8:PROC
EXTRN sub_10064EBC:PROC
EXTRN sub_10064EE8:PROC
EXTRN sub_10064EF9:PROC
EXTRN sub_10064F08:PROC
EXTRN sub_10064F24:PROC
EXTRN sub_10064F25:PROC
EXTRN sub_10064F2C:PROC
EXTRN sub_10064F38:PROC
EXTRN sub_10064F76:PROC
EXTRN sub_10064F81:PROC
EXTRN sub_10064F86:PROC
EXTRN sub_10067A94:PROC
EXTRN sub_100686E4:PROC
EXTRN sub_10068726:PROC
EXTRN sub_1006875A:PROC
EXTRN sub_10068795:PROC
EXTRN sub_100687CF:PROC
EXTRN sub_10068810:PROC
EXTRN sub_1006884E:PROC
EXTRN sub_100688E8:PROC
EXTRN sub_10068929:PROC
EXTRN sub_100F7AEE:PROC
EXTRN sub_100F7BA2:PROC
EXTRN EXTRN g_1010C728:DWORD:DWORD
.CODE
FUN_1006497b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 52
    push push ebx
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebx + 026Ch]
    push push esi
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_100686E4
    test test eax, eax
    jl sub_10064CB5
    cmp cmp dword ptr [esi], 1
    push push edi
    jne sub_10064CA1
    push push 2
    lea lea esi, [ebx + 0280h]
    mov mov edi, 010195544h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10064CB9
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_10068726
    test test eax, eax
    jl sub_10064CF6
    cmp cmp dword ptr [esi], 9
    jne sub_10064CE2
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea edi, [ebx + 0278h]
    push push edi
    push push dword ptr [ebx + 0298h]
    lea lea esi, [ebx + 0280h]
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [ebp - 12], eax
    call sub_1006875A
    test test eax, eax
    jl sub_10064D2A
    cmp cmp dword ptr [edi], 1
    jne sub_10064D16
    push push 2
    mov mov edi, 01019581Ch
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10064D28
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_10068795
    test test eax, eax
    jl sub_10064D65
    cmp cmp dword ptr [esi], 9
    jne sub_10064D51
    mov mov eax, dword ptr [ebx + 0280h]
    and and dword ptr [ebp - 4], 0
    mov mov dword ptr [ebp - 16], eax
    mov mov ecx, dword ptr [ebx + 026Ch]
    and and dword ptr [ebp - 8], 0
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_100687CF
    test test eax, eax
    jl sub_10064D9F
    cmp cmp dword ptr [esi], 1
    jne sub_10064D8B
    push push 2
    mov mov edi, 01019581Ch
    lea lea esi, [ebx + 0280h]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10064DA3
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_10068810
    test test eax, eax
    jl sub_10064DE0
    xor xor eax, eax
    inc inc eax
    cmp cmp dword ptr [esi], eax
    jne L0
    push push 2
    mov mov edi, 01010C730h
    lea lea esi, [ebx + 0280h]
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    mov mov ecx, dword ptr [ebx + 026Ch]
    mov mov dword ptr [ebp - 8], eax
    lea lea eax, [ebx + 0278h]
    push push eax
    push push dword ptr [ebx + 0298h]
    call sub_1006884E
    test test eax, eax
    jl sub_10064E1E
    mov mov eax, dword ptr [ebx + 0278h]
    cmp cmp eax, 2
    je sub_10064CF4
    cmp cmp eax, 3
    je sub_10064CEA
    cmp cmp eax, 4
    je sub_10064CFE
    jle sub_10064E1C
    cmp cmp eax, 8
    jg sub_10064E25
    mov mov eax, dword ptr [ebp - 4]
    fld fld qword ptr [ebx + 0280h]
    lea lea eax, [ebp + eax*8 - 52]
    jmp sub_10064D39
    mov mov eax, dword ptr [ebp - 4]
    fild fild dword ptr [ebx + 0280h]
    lea lea eax, [ebp + eax*8 - 52]
    jmp sub_10064D48
    mov mov ecx, dword ptr [ebx + 0280h]
    fild fild dword ptr [ebx + 0280h]
    test test ecx, ecx
    mov mov eax, dword ptr [ebp - 4]
    lea lea eax, [ebp + eax*8 - 52]
    jge sub_10064D5F
    fadd fadd qword ptr [g_1010C728]
    cmp cmp dword ptr [ebp - 8], 0
    fstp fstp qword ptr [eax]
    je sub_10064D7B
    fld fld qword ptr [eax]
    fchs fchs
    fstp fstp qword ptr [eax]
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 4
    jb L1
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_100688E8
    test test eax, eax
    jl sub_10064EB8
    cmp cmp dword ptr [esi], 1
    jne sub_10064EA4
    push push 2
    mov mov edi, 010195540h
    lea lea esi, [ebx + 0280h]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10064EBC
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_10068929
    test test eax, eax
    jl sub_10064EF9
    mov mov esi, dword ptr [esi]
    cmp cmp esi, 12
    je sub_10064E70
    cmp cmp esi, 13
    jne sub_10064EE8
    push push 48
    call sub_100F7AEE
    test test eax, eax
    pop pop ecx
    je sub_10064E96
    and and dword ptr [eax + 40], 0
    mov mov dword ptr [ebp - 4], eax
    jmp sub_10064EA6
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [ebp - 4]
    test test eax, eax
    jne sub_10064EBC
    mov mov eax, 08007000Eh
    jmp sub_10064F2C
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [eax + 4], ecx
    push push 8
    lea lea edi, [eax + 8]
    pop pop ecx
    lea lea esi, [ebp - 52]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea esi, [ebx + 60]
    mov mov ecx, dword ptr [esi]
    test test ecx, ecx
    je sub_10064F25
    jmp sub_10064F08
    mov mov eax, dword ptr [ebp - 4]
    push push dword ptr [eax + 4]
    push push dword ptr [ecx + 4]
    call sub_100F7BA2
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jge sub_10064F38
    mov mov esi, dword ptr [esi]
    add add esi, 40
    mov mov ecx, dword ptr [esi]
    test test ecx, ecx
    jne sub_10064F24
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [eax + 40], ecx
    mov mov dword ptr [esi], eax
    jmp sub_10064F76
    mov mov eax, dword ptr [ebx + 0278h]
    cmp cmp eax, 12
    je sub_10064F81
    cmp cmp eax, 13
    je sub_10064F86
    mov mov ecx, dword ptr [ebx + 026Ch]
    call sub_10067A94
    xor xor eax, eax
    pop pop edi
    pop pop esi
    mov mov dword ptr [ebx + 64], 1
    pop pop ebx
    leave leave
    ret ret
FUN_1006497b ENDP
END
