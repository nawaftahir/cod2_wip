.686
.MODEL FLAT, C
EXTRN sub_100F6BA6:PROC
EXTRN sub_100F6BC1:PROC
EXTRN sub_100FB531:PROC
EXTRN sub_100FB5E8:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC098:PROC
EXTRN g_1076ADB8:DWORD
EXTRN g_1076BDC0:DWORD
.CODE
flsall PROC
    push 20
    push 01017C440h
    call sub_100FB61C
    xor edi, edi
    mov dword ptr [ebp - 28], edi
    mov dword ptr [ebp - 36], edi
    push 1
    call sub_100FC098
    pop ecx
    mov dword ptr [ebp - 4], edi
    xor esi, esi
L0:
    mov dword ptr [ebp - 32], esi
    cmp esi, dword ptr [g_1076BDC0]
    jge L5
    mov eax, dword ptr [g_1076ADB8]
    mov eax, dword ptr [eax + esi*4]
    cmp eax, edi
    je L3
    test byte ptr [eax + 12], 000000083h
    je L3
    push eax
    push esi
    call sub_100FB531
    pop ecx
    pop ecx
    xor edx, edx
    inc edx
    mov dword ptr [ebp - 4], edx
    mov eax, dword ptr [g_1076ADB8]
    mov eax, dword ptr [eax + esi*4]
    mov ecx, dword ptr [eax + 12]
    test cl, 000000083h
    je L2
    cmp dword ptr [ebp + 8], edx
    jne L1
    push eax
    call sub_100F6BA6
    pop ecx
    cmp eax, -1
    je L2
    inc dword ptr [ebp - 28]
    jmp L2
L1:
    cmp dword ptr [ebp + 8], edi
    jne L2
    test cl, 2
    je L2
    push eax
    call sub_100F6BC1
    pop ecx
    cmp eax, -1
    jne L2
    or dword ptr [ebp - 36], eax
L2:
    mov dword ptr [ebp - 4], edi
    call L4
L3:
    inc esi
    jmp L0
    xor edi, edi
    mov esi, dword ptr [ebp - 32]
L4:
    mov eax, dword ptr [g_1076ADB8]
    push dword ptr [eax + esi*4]
    push esi
    call sub_100FB5E8
    pop ecx
    pop ecx
    ret
L5:
    or dword ptr [ebp - 4], 0FFFFFFFFh
flsall ENDP
END
