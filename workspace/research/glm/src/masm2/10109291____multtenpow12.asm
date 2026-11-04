.686
.MODEL FLAT, C
EXTRN sub_10100DD1:PROC
EXTRN sub_101090CF:PROC
EXTRN sub_1010932A:PROC
EXTRN sub_10109347:PROC
EXTRN sub_10109353:PROC
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
___multtenpow12 PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    mov mov eax, dword ptr [g_101A50D0]
    push push ebx
    mov mov ebx, 0101A5630h
    xor xor ecx, ecx
    sub sub ebx, 96
    cmp cmp dword ptr [ebp + 12], ecx
    mov mov dword ptr [ebp - 4], eax
    je sub_1010932A
    jge L0
    neg neg dword ptr [ebp + 12]
    mov mov ebx, 0101A5790h
    sub sub ebx, 96
    cmp cmp dword ptr [ebp + 16], ecx
    jne L1
    mov mov eax, dword ptr [ebp + 8]
    mov mov word ptr [eax], cx
    cmp cmp dword ptr [ebp + 12], ecx
    je sub_10109347
    push push esi
    push push edi
    mov mov eax, dword ptr [ebp + 12]
    sar sar dword ptr [ebp + 12], 3
    and and eax, 7
    add add ebx, 84
    cmp cmp eax, ecx
    je sub_10109353
    lea lea eax, [eax + eax*2]
    lea lea esi, [ebx + eax*4]
    cmp cmp word ptr [esi], 08000h
    jb sub_10109353
    lea lea edi, [ebp - 16]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    dec dec dword ptr [ebp - 14]
    lea lea esi, [ebp - 16]
    push push esi
    push push dword ptr [ebp + 8]
    call sub_101090CF
    pop pop ecx
    pop pop ecx
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 12], ecx
    jne sub_10109347
    pop pop edi
    pop pop esi
    mov mov ecx, dword ptr [ebp - 4]
    pop pop ebx
    call sub_10100DD1
    leave leave
    ret ret
___multtenpow12 ENDP
END
