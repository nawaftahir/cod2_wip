.686
.MODEL FLAT, C
EXTRN sub_100840A3:PROC
EXTRN sub_10084144:PROC
EXTRN sub_100841C5:PROC
EXTRN sub_10084290:PROC
EXTRN sub_100842EC:PROC
EXTRN sub_1008B1B5:PROC
EXTRN sub_10093C30:PROC
EXTRN sub_100C418D:PROC
EXTRN sub_100F6856:PROC
.CODE
FUN_100c7b6a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    and dword ptr [ebp - 4], 0
    push ebx
    push esi
    mov esi, ecx
    push 053455250h
    lea ecx, [ebp - 20]
    call sub_100840A3
    mov ecx, esi
    call sub_10093C30
    mov ebx, eax
    test ebx, ebx
    jl L3
    mov ecx, dword ptr [esi + 0000000E0h]
    mov eax, dword ptr [ecx]
    lea edx, [ebp - 4]
    push edx
    call dword ptr [eax + 8]
    mov ebx, eax
    test ebx, ebx
    jl L3
    jne L0
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push 0
    push 1
    push eax
    call dword ptr [ecx + 0x10]
    push eax
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    push eax
    lea ecx, [ebp - 20]
    call sub_10084144
    mov ebx, eax
    test ebx, ebx
    jl L3
L0:
    push edi
    lea ecx, [ebp - 20]
    call sub_10084290
    mov edi, eax
    cmp edi, 000008000h
    ja L1
    push edi
    mov ecx, esi
    call sub_100C418D
    mov ebx, eax
    test ebx, ebx
    jl L2
    mov ecx, dword ptr [esi + 000000110h]
    mov eax, dword ptr [esi + 00000010Ch]
    lea ecx, [ecx*4 - 4]
    push ecx
    lea ecx, [eax + 4]
    push ecx
    lea eax, [eax + edi*4 + 4]
    push eax
    call sub_100F6856
    mov eax, dword ptr [esi + 00000010Ch]
    add esp, 12
    push edi
    add eax, 4
    push eax
    lea ecx, [ebp - 20]
    call sub_100842EC
    mov ebx, eax
    test ebx, ebx
    jl L2
    add dword ptr [esi + 000000110h], edi
    mov eax, dword ptr [esi + 000000110h]
    add dword ptr [esi + 000000120h], edi
    mov dword ptr [esi + 00000011Ch], eax
    xor ebx, ebx
    jmp L2
L1:
    push 01011A5D4h
    push 0000011C4h
    push 0
    push esi
    call sub_1008B1B5
    add esp, 16
    mov ebx, 080004005h
L2:
    pop edi
L3:
    mov eax, dword ptr [ebp - 4]
    test eax, eax
    je L4
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [ebp - 4], 0
L4:
    lea ecx, [ebp - 20]
    call sub_100841C5
    pop esi
    mov eax, ebx
    pop ebx
    leave
    ret
FUN_100c7b6a ENDP
END
