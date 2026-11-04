.686
.MODEL FLAT, C
EXTRN sub_1006515C:PROC
EXTRN sub_100651C8:PROC
EXTRN sub_1006531B:PROC
EXTRN sub_1006531E:PROC
EXTRN sub_10065361:PROC
EXTRN sub_100653D4:PROC
EXTRN sub_10065449:PROC
EXTRN sub_1006633B:PROC
EXTRN sub_1006661E:PROC
EXTRN sub_10066626:PROC
EXTRN sub_1006663F:PROC
EXTRN sub_10066642:PROC
EXTRN sub_10066659:PROC
EXTRN sub_10066689:PROC
EXTRN sub_1006668A:PROC
EXTRN sub_10066698:PROC
EXTRN sub_10066699:PROC
EXTRN sub_100666B5:PROC
EXTRN sub_100666F9:PROC
EXTRN sub_1006670A:PROC
EXTRN sub_10066712:PROC
EXTRN sub_10066752:PROC
EXTRN sub_10066763:PROC
EXTRN sub_100667A0:PROC
EXTRN sub_100667A4:PROC
EXTRN sub_100667A7:PROC
EXTRN sub_100667B4:PROC
EXTRN sub_100667BA:PROC
EXTRN sub_100667CB:PROC
EXTRN sub_10066804:PROC
EXTRN sub_10066815:PROC
EXTRN sub_100678A5:PROC
EXTRN sub_100678D7:PROC
EXTRN sub_1006792E:PROC
EXTRN sub_10067955:PROC
EXTRN sub_10082B78:PROC
EXTRN sub_10082BE4:PROC
EXTRN sub_100F7894:PROC
EXTRN sub_100F78D9:PROC
EXTRN sub_100F7929:PROC
EXTRN sub_100F7999:PROC
.CODE
FUN_100663c0 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 100
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 026Ch]
    push push 8
    mov mov dword ptr [ebp - 12], eax
    pop pop ecx
    xor xor eax, eax
    lea lea edi, [ebp - 44]
    push push 20
    mov mov dword ptr [ebp - 8], esi
    rep stosd rep stosd dword ptr es:[edi], eax
    call sub_100F7894
    xor xor ebx, ebx
    cmp cmp eax, ebx
    pop pop ecx
    je L0
    mov mov dword ptr [eax], 01010C91Ch
    mov mov dword ptr [eax + 4], ebx
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax + 16], ebx
    mov mov dword ptr [ebp - 4], eax
    jmp L1
    mov mov dword ptr [ebp - 4], ebx
    cmp cmp dword ptr [ebp - 4], ebx
    je L6
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call sub_1006531E
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L10
    push push 20
    call sub_100F78D9
    cmp cmp eax, ebx
    pop pop ecx
    je L2
    mov mov dword ptr [eax], 01010C914h
    mov mov dword ptr [eax + 4], ebx
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax + 16], ebx
    mov mov dword ptr [ebp - 4], eax
    jmp L3
    mov mov dword ptr [ebp - 4], ebx
    cmp cmp dword ptr [ebp - 4], ebx
    je L9
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call sub_10065361
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10066626
    push push 2
    pop pop esi
    push push 20
    mov mov dword ptr [ebp - 44], esi
    mov mov dword ptr [ebp - 36], 0900h
    call sub_100F7929
    cmp cmp eax, ebx
    pop pop ecx
    je L4
    mov mov dword ptr [eax], 01010C900h
    mov mov dword ptr [eax + 4], ebx
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax + 16], ebx
    mov mov dword ptr [ebp - 4], eax
    jmp L5
    mov mov dword ptr [ebp - 4], ebx
    cmp cmp dword ptr [ebp - 4], ebx
    je sub_1006661E
    push push 48
    call sub_1006515C
    cmp cmp eax, ebx
    je L7
    lea lea ecx, [ebp - 44]
    push push ecx
    mov mov ecx, eax
    call sub_10082B78
    jmp L8
L2:
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 8], eax
    je sub_10066642
    push push ecx
    mov mov ecx, dword ptr [ebp - 8]
    call sub_100653D4
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10066699
    push push 20
    mov mov dword ptr [ebp - 44], esi
    mov mov dword ptr [ebp - 36], 0902h
    call sub_100F7999
    cmp cmp eax, ebx
    pop pop ecx
    je sub_1006663F
    mov mov dword ptr [eax], 01010C8F0h
    mov mov dword ptr [eax + 4], ebx
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax + 16], ebx
    mov mov dword ptr [ebp - 4], eax
    jmp sub_10066659
    mov mov dword ptr [ebp - 4], ebx
    cmp cmp dword ptr [ebp - 4], ebx
    je sub_1006668A
    push push 48
    call sub_100651C8
    cmp cmp eax, ebx
    je sub_10066689
    lea lea ecx, [ebp - 44]
    push push ecx
    mov mov ecx, eax
    call sub_10082BE4
    jmp sub_10066698
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 8], eax
    jne sub_100666B5
    mov mov edi, 08007000Eh
    jmp sub_100666F9
    push push dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 8]
    call sub_10065449
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006670A
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp esi, ebx
    mov mov dword ptr [ebp - 4], ebx
    je sub_10066712
    lea lea ecx, [ebp - 100]
    call sub_100678A5
    mov mov edi, dword ptr [ebp - 8]
    lea lea eax, [ebp - 100]
    mov mov dword ptr [edi + 026Ch], eax
    cmp cmp dword ptr [esi], ebx
    jne sub_10066752
    lea lea ecx, [ebp - 100]
    call sub_100678D7
L5:
    xor xor edi, edi
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [ecx + 026Ch], eax
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, ebx
    je sub_10066763
    push push 1
    call sub_1006531B
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
    mov mov edi, dword ptr [ebp - 8]
    mov mov edx, dword ptr [esi + 4]
    cmp cmp edx, ebx
    je sub_100667A4
    mov mov eax, edx
    lea lea ecx, [eax + 1]
    mov mov dword ptr [ebp + 8], ecx
    mov mov cl, byte ptr [eax]
    inc inc eax
    cmp cmp cl, bl
    jne sub_100667A7
    sub sub eax, dword ptr [ebp + 8]
    jmp sub_100667BA
    xor xor eax, eax
    lea lea ecx, [edi + 24]
    push push ecx
    push push edi
    push push ebx
    push push ebx
    push push eax
    push push edx
    lea lea ecx, [ebp - 100]
    call sub_1006792E
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10066804
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [esi]
    call sub_1006633B
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10066815
    add add esi, 8
    cmp cmp dword ptr [esi], ebx
    jne sub_100667CB
    jmp sub_100667A0
    lea lea ecx, [ebp - 100]
    call sub_10067955
    jmp sub_100667B4
FUN_100663c0 ENDP
END
