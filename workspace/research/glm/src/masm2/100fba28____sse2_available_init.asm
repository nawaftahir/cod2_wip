.686
.MODEL FLAT, C
EXTRN sub_100FBB49:PROC
EXTRN sub_100FBB52:PROC
EXTRN sub_100FBB6C:PROC
EXTRN sub_100FBBA2:PROC
EXTRN sub_10100E17:PROC
EXTRN sub_10101063:PROC
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_1076ADB0:DWORD:DWORD
EXTRN EXTRN g_1076ADB4:DWORD:DWORD
.CODE
___sse2_available_init PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp - 4], eax
    xor xor eax, eax
    push push ebx
    push push esi
    mov mov dword ptr [ebp - 28], eax
    mov mov dword ptr [ebp - 24], eax
    mov mov byte ptr [ebp - 20], al
    push push ebx
    pushfd pushfd
    pop pop eax
    mov mov ecx, eax
    xor xor eax, 0200000h
    push push eax
    popfd popfd
    pushfd pushfd
    pop pop edx
    sub sub edx, ecx
    je L1
    push push ecx
    popfd popfd
    xor xor eax, eax
L0:
    cpuid cpuid
    mov mov dword ptr [ebp - 32], eax
    mov mov dword ptr [ebp - 20], ebx
    mov mov dword ptr [ebp - 16], edx
    mov mov dword ptr [ebp - 12], ecx
    mov mov eax, 1
    cpuid cpuid
    mov mov dword ptr [ebp - 28], edx
    mov mov dword ptr [ebp - 24], eax
    pop pop ebx
    and and dword ptr [g_1076ADB4], 0
    and and dword ptr [g_1076ADB0], 0
    test test byte ptr [ebp - 25], 4
    je sub_100FBB49
    call L0
    test test eax, eax
    je sub_100FBB52
    push push 12
    lea lea eax, [ebp - 20]
    xor xor esi, esi
    push push eax
    inc inc esi
    push push 01017C87Ch
    mov mov dword ptr [g_1076ADB4], esi
    call sub_10101063
    add add esp, 12
    test test eax, eax
    jne sub_100FBB6C
    mov mov ecx, dword ptr [ebp - 24]
    mov mov eax, ecx
    sar sar eax, 8
    and and eax, 15
    sar sar ecx, 20
    mov mov edx, eax
    sub sub edx, 15
    and and ecx, 0FFh
    neg neg edx
    sbb sbb edx, edx
    not not edx
    and and edx, ecx
    add add edx, eax
    sub sub edx, 15
    neg neg edx
    sbb sbb edx, edx
    inc inc edx
    mov mov dword ptr [ebp - 32], edx
    jne sub_100FBBA2
    mov mov dword ptr [g_1076ADB0], esi
    mov mov ecx, dword ptr [ebp - 4]
    xor xor eax, eax
    call sub_10100E17
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
___sse2_available_init ENDP
END
