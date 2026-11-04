.686
.MODEL FLAT, C
EXTRN sub_1008642B:PROC
EXTRN sub_100864B9:PROC
EXTRN sub_10087064:PROC
EXTRN sub_100870EE:PROC
EXTRN sub_1008B2C8:PROC
EXTRN sub_1008D795:PROC
EXTRN sub_100B6684:PROC
EXTRN sub_100B767C:PROC
EXTRN sub_100BA8B7:PROC
EXTRN sub_100BA8EF:PROC
EXTRN sub_100BA935:PROC
EXTRN sub_100BAAAC:PROC
EXTRN sub_100BAD57:PROC
EXTRN sub_100BB344:PROC
EXTRN sub_100BB3BA:PROC
EXTRN sub_100BE2C1:PROC
EXTRN sub_100C7A74:PROC
.CODE
FUN_100b7c5d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    push edi
    mov esi, ecx
    xor edi, edi
    cmp dword ptr [esi + 92], edi
    mov ebx, 0FFF00000h
    je L2
    cmp dword ptr [esi + 12], edi
    mov dword ptr [esi + 0000000FCh], edi
    jbe L2
L0:
    mov eax, dword ptr [esi + 0000000FCh]
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 020800000h
    jne L1
    mov ecx, esi
    call sub_100BAD57
    test eax, eax
    jl L23
    xor ecx, ecx
    test eax, eax
    sete cl
    or edi, ecx
L1:
    inc dword ptr [esi + 0000000FCh]
    mov eax, dword ptr [esi + 0000000FCh]
    cmp eax, dword ptr [esi + 12]
    jb L0
    test edi, edi
    je L2
    mov ecx, esi
    call sub_100BA8B7
L2:
    test byte ptr [esi + 0000000CCh], 4
    jne L12
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    jbe L5
L3:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], edi
    mov eax, dword ptr [eax + edi*4]
    mov ecx, esi
    mov dword ptr [esi + 000000100h], eax
    call sub_100B767C
    test eax, eax
    jne L4
    mov ecx, esi
    call sub_100BA8EF
L4:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L3
L5:
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    jbe L8
L6:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], edi
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 050000000h
    jne L7
    mov ecx, esi
    call sub_100B6684
    test eax, eax
    jl L23
L7:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L6
L8:
    mov ecx, esi
    call sub_100BA935
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    jbe L12
L9:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], edi
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 010300000h
    je L10
    cmp eax, 010500000h
    je L10
    cmp eax, 010600000h
    je L10
    cmp eax, 010700000h
    je L10
    cmp eax, 050000000h
    jne L11
L10:
    mov ecx, esi
    call sub_100BE2C1
    test eax, eax
    jl L23
L11:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L9
L12:
    cmp dword ptr [esi + 48], 0
    je L21
    and dword ptr [ebp - 8], 0
L13:
    cmp dword ptr [ebp - 8], 16
    jae L17
    mov ebx, dword ptr [esi + 12]
    xor edi, edi
    test ebx, ebx
    mov dword ptr [ebp - 4], 1
    jbe L16
L14:
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + edi*4]
    mov ecx, esi
    mov dword ptr [esi + 000000100h], eax
    call sub_100BB344
    test eax, eax
    jl L23
    jne L15
    and dword ptr [ebp - 4], 0
L15:
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_1008642B
    test eax, eax
    jl L23
    mov eax, dword ptr [esi + 000000100h]
    and dword ptr [eax], 0
    inc edi
    cmp edi, ebx
    jb L14
L16:
    mov ecx, esi
    call sub_10087064
    test eax, eax
    jl L23
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 4], 0
    je L13
    cmp dword ptr [ebp - 8], 16
    jb L21
L17:
    mov ebx, dword ptr [esi + 12]
    xor edi, edi
    test ebx, ebx
    mov dword ptr [ebp - 4], 1
    jbe L20
L18:
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + edi*4]
    mov ecx, esi
    mov dword ptr [esi + 000000100h], eax
    call sub_100BB3BA
    test eax, eax
    jl L23
    jne L19
    mov eax, dword ptr [esi + 000000100h]
    push 010115C5Ch
    push 0000011C9h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B2C8
    add esp, 16
    and dword ptr [ebp - 4], 0
L19:
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_100864B9
    test eax, eax
    jl L23
    mov eax, dword ptr [esi + 000000100h]
    and dword ptr [eax], 0
    inc edi
    cmp edi, ebx
    jb L18
L20:
    mov ecx, esi
    call sub_100870EE
    test eax, eax
    jl L23
    cmp dword ptr [ebp - 4], 0
    jne L21
    mov eax, 080004005h
    jmp L23
L21:
    cmp dword ptr [esi + 96], 0
    je L22
    mov ecx, esi
    call sub_100C7A74
    test eax, eax
    jl L23
    mov ecx, esi
    call sub_100BAAAC
    mov ecx, esi
    call sub_1008D795
    test eax, eax
    jl L23
L22:
    xor eax, eax
L23:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b7c5d ENDP
END
