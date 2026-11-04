.686
.MODEL FLAT, C
EXTRN sub_10067CF3:PROC
EXTRN sub_100683C3:PROC
EXTRN sub_100686CD:PROC
EXTRN sub_100686D1:PROC
EXTRN sub_100686E4:PROC
EXTRN sub_100686EE:PROC
EXTRN sub_1006876E:PROC
EXTRN sub_10068774:PROC
EXTRN sub_10068779:PROC
EXTRN sub_1006877E:PROC
EXTRN sub_10068784:PROC
EXTRN sub_10068787:PROC
EXTRN sub_10068788:PROC
EXTRN sub_1006878E:PROC
EXTRN sub_10068798:PROC
EXTRN sub_1006879D:PROC
EXTRN sub_100687A2:PROC
EXTRN sub_100687D0:PROC
EXTRN sub_100687FA:PROC
EXTRN sub_10082788:PROC
.CODE
FUN_10068576 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov ecx, dword ptr [edi + 4]
    cmp cmp ebx, ecx
    jae sub_100686D1
    mov mov al, byte ptr [ebx]
    cmp cmp al, 34
    jne L0
    mov mov byte ptr [ebp + 11], al
    jmp L1
    cmp cmp al, 60
    jne sub_100686E4
    test test byte ptr [edi + 40], 8
    je sub_100686EE
    mov mov byte ptr [ebp + 11], 62
    lea lea esi, [ebx + 1]
    cmp cmp esi, ecx
    mov mov dword ptr [ebp - 4], esi
    jae L2
L0:
    lea lea ecx, [esi + 1]
    mov mov al, byte ptr [esi]
    cmp cmp byte ptr [ebp + 11], al
    je L4
    cmp cmp al, 10
    je L6
    cmp cmp al, 92
    jne L5
    test test byte ptr [edi + 40], 4
    jne L7
    mov mov edx, dword ptr [edi + 4]
L1:
    inc inc esi
    inc inc ecx
    cmp cmp esi, edx
    jae L8
    mov mov al, byte ptr [esi]
    cmp cmp al, 10
    je L9
    cmp cmp al, 13
    jne L10
    cmp cmp ecx, edx
    jae L11
    cmp cmp byte ptr [ecx], 10
    jne L12
    inc inc esi
    inc inc ecx
    inc inc dword ptr [edi + 28]
    inc inc esi
    inc inc ecx
    cmp cmp esi, dword ptr [edi + 4]
    jb L3
    mov mov eax, dword ptr [edi + 4]
    cmp cmp esi, eax
    jb L13
    push push 01010CBC8h
    mov mov esi, eax
    push push 03EEh
    jmp L14
    cmp cmp byte ptr [esi], 10
    jne sub_100686CD
    push push 01010CBA4h
    push push 03EDh
    lea lea eax, [edi + 8]
    push push eax
    push push dword ptr [edi + 48]
    call sub_10067CF3
    add add esp, 16
    mov mov ecx, dword ptr [edi + 44]
    mov mov dword ptr [ebp + 8], esi
    sub sub esi, ebx
    push push 1
    push push esi
    mov mov dword ptr [ebp - 8], esi
    call sub_10082788
    mov mov ebx, eax
L3:
    test test ebx, ebx
    je sub_10068788
    mov mov eax, dword ptr [ebp + 12]
L4:
    mov mov esi, dword ptr [ebp - 4]
    mov mov dword ptr [eax], ebx
    lea lea eax, [esi + 1]
    cmp cmp eax, dword ptr [ebp + 8]
    jae sub_10068774
    mov mov edx, eax
    lea lea eax, [esi + 2]
    cmp cmp byte ptr [esi], 92
    jne sub_1006877E
    test test byte ptr [edi + 40], 4
    jne sub_10068784
    mov mov cl, byte ptr [edx]
    cmp cmp cl, 10
    jne sub_1006876E
    inc inc esi
    inc inc esi
    inc inc eax
    inc inc eax
    inc inc edx
    inc inc edx
    jmp sub_1006878E
    cmp cmp cl, 13
    jne sub_10068798
    cmp cmp eax, dword ptr [ebp + 8]
    jae sub_1006879D
    cmp cmp byte ptr [eax], 10
    jne sub_100687A2
    add add esi, 3
    add add eax, 3
    add add edx, 3
    cmp cmp edx, dword ptr [ebp + 8]
    jb sub_10068779
    cmp cmp esi, dword ptr [ebp + 8]
    jae sub_100687D0
    lea lea eax, [ebp + 12]
    push push eax
L13:
    push push esi
    mov mov ecx, edi
    call sub_100683C3
    add add esi, eax
    mov mov al, byte ptr [ebp + 12]
    mov mov byte ptr [ebx], al
    inc inc ebx
    jmp sub_10068787
    mov mov eax, dword ptr [ebp - 8]
    mov mov byte ptr [ebx], 0
    inc inc eax
    jmp sub_100687FA
    xor xor eax, eax
L14:
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_10068576 ENDP
END
