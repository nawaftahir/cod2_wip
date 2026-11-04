.686
.MODEL FLAT, C
EXTRN sub_100650A5:PROC
EXTRN sub_100650CC:PROC
EXTRN sub_10065127:PROC
EXTRN sub_100828B5:PROC
EXTRN sub_100828BB:PROC
EXTRN sub_10082937:PROC
EXTRN sub_10082CB8:PROC
EXTRN sub_10082E5F:PROC
EXTRN sub_10099686:PROC
EXTRN sub_1009ACD9:PROC
EXTRN sub_100A0A03:PROC
EXTRN sub_100A0A07:PROC
EXTRN sub_100A0A09:PROC
EXTRN sub_100A0A18:PROC
EXTRN sub_100A0A19:PROC
EXTRN sub_100A0A34:PROC
EXTRN sub_100A0A37:PROC
EXTRN sub_100A0A3F:PROC
EXTRN sub_100A0A63:PROC
EXTRN sub_100A0A92:PROC
EXTRN sub_100A0AB8:PROC
EXTRN sub_100A0AFB:PROC
EXTRN sub_100A0B04:PROC
EXTRN sub_100A0B0E:PROC
EXTRN sub_100A0B14:PROC
EXTRN sub_100A0B46:PROC
EXTRN sub_100A0B5E:PROC
EXTRN sub_100A0B64:PROC
EXTRN sub_100A0B73:PROC
.CODE
FUN_100a083c PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    push push esi
    xor xor esi, esi
    cmp cmp dword ptr [ebp + 12], esi
    push push edi
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 16], esi
    lea lea edi, [ebp - 16]
    je sub_100A0A07
    jmp L0
    mov mov edi, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp dword ptr [eax + 8], esi
    je sub_100A0A18
    push push 20
    call sub_100650A5
    cmp cmp eax, esi
    je L1
    push push 010114734h
    push push esi
    push push esi
    mov mov ecx, eax
    call sub_100828BB
    jmp L3
    xor xor eax, eax
    cmp cmp eax, esi
    mov mov dword ptr [edi], eax
    je sub_100A0A3F
    push push 48
    call sub_100650CC
    cmp cmp eax, esi
    je L4
    push push esi
    push push esi
    push push esi
    push push esi
    mov mov ecx, eax
    call sub_10082CB8
    mov mov ebx, eax
    jmp L5
    xor xor ebx, ebx
    cmp cmp ebx, esi
    je sub_100A0A63
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [eax + 8], ebx
    mov mov eax, dword ptr [edi]
    add add eax, 12
    cmp cmp dword ptr [ebp + 8], esi
    mov mov dword ptr [ebp - 20], eax
    mov mov dword ptr [ebp - 8], 1
    mov mov dword ptr [ebp - 12], esi
    je L6
    push push dword ptr [ebp + 8]
    call sub_100828B5
    cmp cmp eax, esi
    mov mov dword ptr [ebx + 24], eax
    je sub_100A0A92
    mov mov eax, dword ptr [ebp + 12]
    mov mov edi, dword ptr [eax + 8]
    jmp sub_100A0A03
    push push 24
    call sub_10065127
    cmp cmp eax, esi
    je L7
    mov mov ecx, eax
    call sub_10082E5F
    jmp L8
    xor xor eax, eax
    cmp cmp eax, esi
    je sub_100A0AB8
    mov mov ecx, dword ptr [ebx + 24]
L4:
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [ebx + 24], eax
    mov mov ecx, dword ptr [edi + 12]
    cmp cmp ecx, esi
    lea lea esi, [eax + 20]
    je sub_100A0A19
    push push esi
L5:
    push push ecx
    mov mov ecx, dword ptr [ebp - 4]
    call L2
    test test eax, eax
    jge sub_100A0A34
    mov mov dword ptr [ebp - 12], 0BF2h
    jmp sub_100A0A37
    mov mov dword ptr [ebp - 12], 0C00h
    mov mov dword ptr [esi], 1
    mov mov eax, dword ptr [esi]
    imul imul eax, dword ptr [ebp - 8]
    mov mov edi, dword ptr [edi + 8]
    mov mov dword ptr [ebp - 8], eax
    xor xor esi, esi
    cmp cmp dword ptr [edi + 4], 3
    jne sub_100A0A09
    push push edi
    call sub_10082937
    cmp cmp eax, esi
    mov mov dword ptr [ebx + 20], eax
    je sub_100A0B14
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, 0BF2h
    add add edi, 16
    sub sub ecx, eax
    je sub_100A0B0E
    sub sub ecx, 14
    je sub_100A0B04
    cmp cmp dword ptr [ebp - 8], 1
    jb sub_100A0AFB
    cmp cmp dword ptr [ebp - 8], 010000h
    ja sub_100A0B04
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    push push ebx
    call sub_1009ACD9
    test test eax, eax
    jl sub_100A0B46
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, esi
    mov mov dword ptr [ebp + 12], eax
    jne L9
    mov mov eax, dword ptr [ebp - 16]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
    push push dword ptr [edi + 8]
    push push 0101151B4h
    push push 0BF3h
    jmp sub_100A0B64
    push push dword ptr [edi + 8]
    push push 010115184h
L9:
    push push 0C00h
    jmp sub_100A0B73
    push push dword ptr [edi + 8]
    push push 010115148h
    push push eax
    push push edi
    push push dword ptr [ebp - 4]
    call sub_10099686
    add add esp, 20
    xor xor eax, eax
    jmp sub_100A0B5E
FUN_100a083c ENDP
END
