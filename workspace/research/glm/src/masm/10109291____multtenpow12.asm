.686
.MODEL FLAT, C
EXTRN sub_10100DD1:PROC
EXTRN sub_101090CF:PROC
EXTRN g_101A50D0:DWORD
.CODE
___multtenpow12 PROC
    push ebp
    mov ebp, esp
    sub esp, 16
    mov eax, dword ptr [g_101A50D0]
    push ebx
    mov ebx, 0101A5630h
    xor ecx, ecx
    sub ebx, 96
    cmp dword ptr [ebp + 12], ecx
    mov dword ptr [ebp - 4], eax
    je L5
    jge L0
    neg dword ptr [ebp + 12]
    mov ebx, 0101A5790h
    sub ebx, 96
L0:
    cmp dword ptr [ebp + 16], ecx
    jne L1
    mov eax, dword ptr [ebp + 8]
    mov word ptr [eax], cx
L1:
    cmp dword ptr [ebp + 12], ecx
    je L5
    push esi
    push edi
L2:
    mov eax, dword ptr [ebp + 12]
    sar dword ptr [ebp + 12], 3
    and eax, 7
    add ebx, 84
    cmp eax, ecx
    je L4
    lea eax, [eax + eax*2]
    lea esi, [ebx + eax*4]
    cmp word ptr [esi], 000008000h
    jb L3
    lea edi, [ebp - 16]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    dec dword ptr [ebp - 14]
    lea esi, [ebp - 16]
L3:
    push esi
    push dword ptr [ebp + 8]
    call sub_101090CF
    pop ecx
    pop ecx
    xor ecx, ecx
L4:
    cmp dword ptr [ebp + 12], ecx
    jne L2
    pop edi
    pop esi
L5:
    mov ecx, dword ptr [ebp - 4]
    pop ebx
    call sub_10100DD1
    leave
    ret
___multtenpow12 ENDP
END
