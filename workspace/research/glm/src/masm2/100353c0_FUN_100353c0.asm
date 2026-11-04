.686
.MODEL FLAT, C
EXTRN sub_10035436:PROC
EXTRN sub_10035439:PROC
EXTRN sub_1003545F:PROC
.CODE
FUN_100353c0 PROC
    mov mov eax, dword ptr [ecx + 20]
    sub sub esp, 8
    xor xor edx, edx
    test test eax, eax
    jle sub_10035436
    push push ebx
    push push ebp
    push push esi
    mov mov ebx, 01072DC1Ch
    sub sub ebx, ecx
    push push edi
    mov mov dword ptr [esp + 20], ebx
    mov mov esi, 01072DC14h
    mov mov edi, 01072DC18h
    mov mov ebx, 01072DC10h
    sub sub esi, ecx
    sub sub edi, ecx
    sub sub ebx, ecx
    lea lea eax, [ecx + 32]
    mov mov dword ptr [esp + 16], ebx
    jmp sub_10035439
    mov mov ebx, dword ptr [esp + 16]
    lea lea ecx, [ecx]
    mov mov ebp, dword ptr [eax - 8]
    mov mov dword ptr [ebx + eax], ebp
    mov mov ebx, dword ptr [eax - 4]
    mov mov ebp, dword ptr [esp + 20]
    mov mov dword ptr [esi + eax], ebx
    mov mov ebx, dword ptr [eax]
    mov mov dword ptr [edi + eax], ebx
    mov mov ebx, dword ptr [eax + 4]
    mov mov dword ptr [eax + ebp], ebx
    mov mov ebx, dword ptr [ecx + 20]
    inc inc edx
    add add eax, 16
    cmp cmp edx, ebx
    jl sub_1003545F
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_100353c0 ENDP
END
