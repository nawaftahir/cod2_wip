; ___multtenpow12 @ 0x10109291 — auto-synthesized
    EXTRN g_101a50d0:DWORD
    sub_10100dd1 PROTO C
    sub_101090cf PROTO C
.CODE
___multtenpow12 PROC
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov eax, dword ptr [g_101a50d0]
    push ebx
    mov ebx, 0x101a5630
    xor ecx, ecx
    sub ebx, 0x60
    cmp dword ptr [ebp + 0xc], ecx
    mov dword ptr [ebp - 4], eax
    je L0
    jge L1
    neg dword ptr [ebp + 0xc]
    mov ebx, 0x101a5790
    sub ebx, 0x60
    cmp dword ptr [ebp + 0x10], ecx
    jne L2
    mov eax, dword ptr [ebp + 8]
    mov word ptr [eax], cx
    cmp dword ptr [ebp + 0xc], ecx
    je L0
    push esi
    push edi
    mov eax, dword ptr [ebp + 0xc]
    sar dword ptr [ebp + 0xc], 3
    and eax, 7
    add ebx, 0x54
    cmp eax, ecx
    je L3
    lea eax, [eax + eax*2]
    lea esi, [ebx + eax*4]
    cmp word ptr [esi], 0x8000
    jb L4
    lea edi, [ebp - 0x10]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    dec dword ptr [ebp - 0xe]
    lea esi, [ebp - 0x10]
    push esi
    push dword ptr [ebp + 8]
    call sub_101090cf
    pop ecx
    pop ecx
    xor ecx, ecx
    cmp dword ptr [ebp + 0xc], ecx
    jne L5
    pop edi
    pop esi
    mov ecx, dword ptr [ebp - 4]
    pop ebx
    call sub_10100dd1
    leave
    ret
___multtenpow12 ENDP
END