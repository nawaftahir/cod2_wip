.686
.MODEL FLAT, C
EXTRN sub_100FBA59:PROC
EXTRN sub_10100E17:PROC
EXTRN sub_10101063:PROC
EXTRN g_101A50D0:DWORD
EXTRN g_1076ADB0:DWORD
EXTRN g_1076ADB4:DWORD
.CODE
___sse2_available_init PROC
    push ebp
    mov ebp, esp
    sub esp, 32
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    push ebx
    push esi
    mov dword ptr [ebp - 28], eax
    mov dword ptr [ebp - 24], eax
    mov byte ptr [ebp - 20], al
    push ebx
    pushfd
    pop eax
    mov ecx, eax
    xor eax, 000200000h
    push eax
    popfd
    pushfd
    pop edx
    sub edx, ecx
    je L0
    push ecx
    popfd
    xor eax, eax
    cpuid
    mov dword ptr [ebp - 32], eax
    mov dword ptr [ebp - 20], ebx
    mov dword ptr [ebp - 16], edx
    mov dword ptr [ebp - 12], ecx
    mov eax, 1
    cpuid
    mov dword ptr [ebp - 28], edx
    mov dword ptr [ebp - 24], eax
L0:
    pop ebx
    and dword ptr [g_1076ADB4], 0
    and dword ptr [g_1076ADB0], 0
    test byte ptr [ebp - 25], 4
    je L2
    call sub_100FBA59
    test eax, eax
    je L2
    push 12
    lea eax, [ebp - 20]
    xor esi, esi
    push eax
    inc esi
    push 01017C87Ch
    mov dword ptr [g_1076ADB4], esi
    call sub_10101063
    add esp, 12
    test eax, eax
    jne L1
    mov ecx, dword ptr [ebp - 24]
    mov eax, ecx
    sar eax, 8
    and eax, 15
    sar ecx, 20
    mov edx, eax
    sub edx, 15
    and ecx, 0000000FFh
    neg edx
    sbb edx, edx
    not edx
    and edx, ecx
    add edx, eax
    sub edx, 15
    neg edx
    sbb edx, edx
    inc edx
    mov dword ptr [ebp - 32], edx
    jne L2
L1:
    mov dword ptr [g_1076ADB0], esi
L2:
    mov ecx, dword ptr [ebp - 4]
    xor eax, eax
    call sub_10100E17
    pop esi
    pop ebx
    leave
    ret
___sse2_available_init ENDP
END
