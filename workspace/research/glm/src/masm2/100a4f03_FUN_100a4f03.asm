.686
.MODEL FLAT, C
EXTRN sub_10086356:PROC
EXTRN sub_100863E8:PROC
EXTRN sub_10086F8F:PROC
EXTRN sub_1008701D:PROC
EXTRN sub_1008B1F7:PROC
EXTRN sub_1008D6D9:PROC
EXTRN sub_100A5102:PROC
EXTRN sub_100A5117:PROC
EXTRN sub_100A5175:PROC
EXTRN sub_100A5177:PROC
EXTRN sub_100A5179:PROC
EXTRN sub_100A517F:PROC
EXTRN sub_100A5194:PROC
EXTRN sub_100A51B1:PROC
EXTRN sub_100A51EF:PROC
EXTRN sub_100A51FC:PROC
EXTRN sub_100A5221:PROC
EXTRN sub_100A5222:PROC
EXTRN sub_100A523B:PROC
EXTRN sub_100A5248:PROC
EXTRN sub_100A525E:PROC
EXTRN sub_100A5261:PROC
EXTRN sub_100A526E:PROC
EXTRN sub_100A5280:PROC
EXTRN sub_100A528B:PROC
EXTRN sub_100BA8B7:PROC
EXTRN sub_100BA9F0:PROC
EXTRN sub_100BAD57:PROC
EXTRN sub_100BB26F:PROC
EXTRN sub_100BB2E5:PROC
EXTRN sub_100C2FFF:PROC
EXTRN sub_100C79B8:PROC
.CODE
FUN_100a4f03 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    mov mov esi, ecx
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 92], ebx
    push push edi
    je L0
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [esi + 0FCh], ebx
    jbe L2
    mov mov eax, dword ptr [esi + 0FCh]
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov dword ptr [esi + 0100h], eax
    mov mov eax, dword ptr [eax]
    and and eax, 0FFF00000h
    cmp cmp eax, 020800000h
    jne L3
    mov mov ecx, esi
    call sub_100BAD57
    cmp cmp eax, ebx
    jl sub_100A5117
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    or or edi, ecx
    inc inc dword ptr [esi + 0FCh]
    mov mov eax, dword ptr [esi + 0FCh]
    cmp cmp eax, dword ptr [esi + 12]
    jb L1
    cmp cmp edi, ebx
    je L4
    mov mov ecx, esi
    call sub_100BA8B7
    cmp cmp dword ptr [esi + 48], ebx
    je sub_100A5102
    mov mov dword ptr [ebp - 8], ebx
    cmp cmp dword ptr [ebp - 8], 16
    jae L8
    mov mov ebx, dword ptr [esi + 12]
L1:
    xor xor edi, edi
    test test ebx, ebx
    mov mov dword ptr [ebp - 4], 1
L2:
    jbe L6
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, esi
    mov mov dword ptr [esi + 0100h], eax
    call sub_100BB26F
    test test eax, eax
    jl sub_100A5179
    jne L5
    and and dword ptr [ebp - 4], 0
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call sub_10086356
    test test eax, eax
    jl sub_100A5194
    mov mov eax, dword ptr [esi + 0100h]
    and and dword ptr [eax], 0
    inc inc edi
    cmp cmp edi, ebx
    jb L6
    mov mov ecx, esi
    call sub_10086F8F
L4:
    test test eax, eax
    jl sub_100A51B1
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 4], 0
    je L7
    cmp cmp dword ptr [ebp - 8], 16
    jb sub_100A517F
    mov mov ebx, dword ptr [esi + 12]
    xor xor edi, edi
    test test ebx, ebx
    mov mov dword ptr [ebp - 4], 1
    jbe sub_100A5177
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, esi
    mov mov dword ptr [esi + 0100h], eax
    call sub_100BB2E5
    test test eax, eax
    jl sub_100A51EF
    jne sub_100A5175
    mov mov eax, dword ptr [esi + 0100h]
    push push 010115C5Ch
    push push 011C9h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B1F7
    add add esp, 16
    and and dword ptr [ebp - 4], 0
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call sub_100863E8
    test test eax, eax
    jl sub_100A5222
    mov mov eax, dword ptr [esi + 0100h]
    and and dword ptr [eax], 0
    inc inc edi
    cmp cmp edi, ebx
    jb sub_100A5177
    mov mov ecx, esi
L5:
    call sub_1008701D
    test test eax, eax
    jl sub_100A523B
    cmp cmp dword ptr [ebp - 4], 0
    jne sub_100A51FC
    mov mov eax, 080004005h
    jmp sub_100A5248
    xor xor ebx, ebx
L8:
    test test byte ptr [esi + 112], 64
    jne sub_100A5221
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 098h]
    cmp cmp eax, ebx
    jl sub_100A525E
    cmp cmp dword ptr [esi + 96], ebx
    je sub_100A5261
    mov mov ecx, esi
    call sub_100C79B8
    cmp cmp eax, ebx
    jl sub_100A526E
    mov mov ecx, esi
    call sub_100BA9F0
    mov mov ecx, esi
    call sub_1008D6D9
    cmp cmp eax, ebx
    jl sub_100A5280
    mov mov ecx, esi
    call sub_100C2FFF
    cmp cmp eax, ebx
    jl sub_100A528B
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100a4f03 ENDP
END
