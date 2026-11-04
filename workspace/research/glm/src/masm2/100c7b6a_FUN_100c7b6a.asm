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
EXTRN sub_100C7CA1:PROC
EXTRN sub_100C7CBA:PROC
EXTRN sub_100C7CDE:PROC
EXTRN sub_100C7CE6:PROC
EXTRN sub_100C7D06:PROC
EXTRN sub_100C7D44:PROC
EXTRN sub_100C7D60:PROC
EXTRN sub_100C7D94:PROC
EXTRN sub_100F6856:PROC
.CODE
FUN_100c7b6a PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    and and dword ptr [ebp - 4], 0
    push push ebx
    push push esi
    mov mov esi, ecx
    push push 053455250h
    lea lea ecx, [ebp - 20]
    call sub_100840A3
    mov mov ecx, esi
    call sub_10093C30
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100C7CA1
    mov mov ecx, dword ptr [esi + 0E0h]
    mov mov eax, dword ptr [ecx]
    lea lea edx, [ebp - 4]
    push push edx
    call call dword ptr [eax + 8]
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100C7CBA
    jne L0
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push 0
    push push 1
    push push eax
    call call dword ptr [ecx + 16]
    push push eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    push push eax
    lea lea ecx, [ebp - 20]
    call sub_10084144
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100C7CE6
    push push edi
    lea lea ecx, [ebp - 20]
    call sub_10084290
    mov mov edi, eax
    cmp cmp edi, 08000h
    ja sub_100C7CDE
    push push edi
    mov mov ecx, esi
    call sub_100C418D
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100C7D06
    mov mov ecx, dword ptr [esi + 0110h]
    mov mov eax, dword ptr [esi + 010Ch]
    lea lea ecx, [ecx*4 - 4]
    push push ecx
    lea lea ecx, [eax + 4]
    push push ecx
    lea lea eax, [eax + edi*4 + 4]
    push push eax
    call sub_100F6856
    mov mov eax, dword ptr [esi + 010Ch]
L0:
    add add esp, 12
    push push edi
    add add eax, 4
    push push eax
    lea lea ecx, [ebp - 20]
    call sub_100842EC
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100C7D44
    add add dword ptr [esi + 0110h], edi
    mov mov eax, dword ptr [esi + 0110h]
    add add dword ptr [esi + 0120h], edi
    mov mov dword ptr [esi + 011Ch], eax
    xor xor ebx, ebx
    jmp sub_100C7D60
    push push 01011A5D4h
    push push 011C4h
    push push 0
    push push esi
    call sub_1008B1B5
    add add esp, 16
    mov mov ebx, 080004005h
    pop pop edi
    mov mov eax, dword ptr [ebp - 4]
    test test eax, eax
    je sub_100C7D94
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    and and dword ptr [ebp - 4], 0
    lea lea ecx, [ebp - 20]
    call sub_100841C5
    pop pop esi
    mov mov eax, ebx
    pop pop ebx
    leave leave
    ret ret
FUN_100c7b6a ENDP
END
