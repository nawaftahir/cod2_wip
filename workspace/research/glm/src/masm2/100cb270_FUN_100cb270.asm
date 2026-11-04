.686
.MODEL FLAT, C
EXTRN sub_10085402:PROC
EXTRN sub_10085413:PROC
EXTRN sub_10085424:PROC
EXTRN sub_100C9B51:PROC
EXTRN sub_100CB37F:PROC
EXTRN sub_100CB382:PROC
EXTRN sub_100CB387:PROC
EXTRN sub_100CB389:PROC
EXTRN sub_100CB38F:PROC
EXTRN sub_100CB390:PROC
EXTRN sub_100CB3A0:PROC
EXTRN sub_100CB3BB:PROC
.CODE
FUN_100cb270 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ecx + 16]
    push push edi
    mov mov edi, dword ptr [ecx]
    mov mov dword ptr [ebp - 20], eax
    lea lea eax, [ebp - 32]
    push push eax
    xor xor ebx, ebx
    push push ebx
    and and edi, 0FFFFFh
    call sub_10085402
    mov mov ecx, dword ptr [esi + 0100h]
    lea lea eax, [ebp - 28]
    push push eax
    push push 1
    call sub_10085413
    mov mov ecx, dword ptr [esi + 0100h]
    lea lea eax, [ebp - 24]
    push push eax
    push push 2
    call sub_10085424
    cmp cmp dword ptr [ebp + 12], ebx
    mov mov dword ptr [ebp - 12], ebx
    je sub_100CB37F
    mov mov dword ptr [ebp + 12], ebx
    cmp cmp dword ptr [ebp - 12], ebx
    jne sub_100CB387
    mov mov eax, dword ptr [ebp + 12]
    mov mov edx, dword ptr [ebp + eax*4 - 32]
    cmp cmp edx, ebx
    je sub_100CB389
    cmp cmp edi, ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_100CB390
    mov mov eax, dword ptr [esi + 20]
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 4], edx
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [edx]
    mov mov edx, dword ptr [eax + edx*4]
    test test byte ptr [ecx + edx + 3], 1
    jne sub_100CB3A0
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], 4
    add add ecx, 080h
    cmp cmp dword ptr [ebp - 8], edi
    jb sub_100CB38F
    jmp sub_100CB3BB
    mov mov dword ptr [ebp - 12], 1
    inc inc dword ptr [ebp + 12]
    cmp cmp dword ptr [ebp + 12], 3
    jb sub_100CB382
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push ebx
    push push ebx
    push push ebx
    push push edi
    push push dword ptr [ebp - 24]
    push push dword ptr [ebp - 28]
    push push dword ptr [ebp - 32]
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp - 20]
    push push dword ptr [ebp + 8]
    call sub_100C9B51
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100cb270 ENDP
END
