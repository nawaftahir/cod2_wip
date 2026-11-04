.686
.MODEL FLAT, C
EXTRN sub_100677EE:PROC
EXTRN sub_10067D0B:PROC
EXTRN sub_100680D3:PROC
EXTRN sub_100680DA:PROC
EXTRN sub_100680E2:PROC
EXTRN sub_100680E8:PROC
EXTRN sub_100680EC:PROC
EXTRN sub_100680EE:PROC
EXTRN sub_100680EF:PROC
EXTRN sub_100680F2:PROC
EXTRN sub_100680F6:PROC
EXTRN sub_100680F7:PROC
EXTRN sub_10068104:PROC
EXTRN sub_10068110:PROC
EXTRN sub_10068128:PROC
EXTRN sub_1006815C:PROC
EXTRN sub_10068173:PROC
EXTRN sub_10068185:PROC
EXTRN sub_1006818A:PROC
EXTRN sub_10068190:PROC
EXTRN sub_100681AA:PROC
EXTRN sub_100681AB:PROC
EXTRN sub_100681C2:PROC
EXTRN sub_100681CA:PROC
EXTRN sub_100681D0:PROC
EXTRN sub_100681D5:PROC
.CODE
FUN_10067fa7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    and and dword ptr [ebp - 4], 0
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi]
    cmp cmp eax, dword ptr [esi + 4]
    jae sub_100680E2
    push push edi
    mov mov eax, dword ptr [esi]
    mov mov dl, byte ptr [eax]
    cmp cmp dl, 10
    jne L0
    inc inc eax
    inc inc dword ptr [esi + 28]
    mov mov dword ptr [ebp - 4], 1
    jmp sub_100680EE
    cmp cmp dl, 32
    je sub_100680F6
    cmp cmp dl, 9
    jl L1
    cmp cmp dl, 13
    jle sub_10068104
    cmp cmp dl, 47
    jne L4
    lea lea ecx, [eax + 1]
    cmp cmp ecx, dword ptr [esi + 4]
    jae L2
    cmp cmp byte ptr [ecx], dl
    jne L3
    mov mov ecx, esi
    call sub_100677EE
    jmp sub_10068128
    cmp cmp dl, 47
    jne sub_100680E8
    mov mov edi, dword ptr [esi + 4]
    lea lea ecx, [eax + 1]
    cmp cmp ecx, edi
    jae sub_100680F2
    cmp cmp byte ptr [ecx], 42
    jne sub_100680F7
    add add eax, 2
    cmp cmp eax, edi
    mov mov dword ptr [esi], eax
    jae sub_100680DA
    mov mov eax, dword ptr [esi]
L1:
    mov mov dl, byte ptr [eax]
    cmp cmp dl, 42
    jne sub_100680D3
    lea lea ecx, [eax + 1]
    cmp cmp ecx, edi
    jae sub_100680DA
    cmp cmp byte ptr [ecx], 47
    je sub_100680EF
    cmp cmp dl, 10
    jne sub_100680EC
    inc inc dword ptr [esi + 28]
    inc inc eax
    mov mov dword ptr [esi], eax
    cmp cmp eax, dword ptr [esi + 4]
    jb sub_100680DA
    mov mov eax, dword ptr [esi]
    cmp cmp eax, edi
    jae sub_10068110
    add add eax, 2
    jmp sub_10068173
    push push 01010CAF4h
    push push 03E9h
    lea lea eax, [esi + 8]
L2:
    push push eax
    push push dword ptr [esi + 48]
L3:
    call sub_10067D0B
    add add esp, 16
    jmp sub_10068190
    test test byte ptr [esi + 40], 2
    je sub_1006815C
    cmp cmp dl, 59
    je sub_100680E2
    cmp cmp dl, 92
    jne sub_100681AB
    lea lea ecx, [eax + 1]
    cmp cmp ecx, dword ptr [esi + 4]
    jae sub_10068185
    cmp cmp byte ptr [ecx], 10
    jne sub_1006818A
    add add eax, 2
    jmp sub_100681AA
    cmp cmp dl, 92
    jne sub_100681C2
    lea lea ecx, [eax + 2]
    cmp cmp ecx, dword ptr [esi + 4]
    jae sub_100681CA
    cmp cmp byte ptr [eax + 1], 13
    jne sub_100681D0
    cmp cmp byte ptr [ecx], 10
    jne sub_100681D5
    add add eax, 3
    inc inc dword ptr [esi + 28]
    jmp sub_100681D0
    inc inc eax
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [esi]
    cmp cmp eax, dword ptr [esi + 4]
    jb sub_100680E2
    pop pop edi
    mov mov eax, dword ptr [ebp - 4]
    pop pop esi
    leave leave
    ret ret
FUN_10067fa7 ENDP
END
