; __local_unwind2 @ 0x101010a2 — auto-synthesized
    sub_1010118a PROTO C
.CODE
__local_unwind2 PROC
    push ebx
    push esi
    push edi
    mov eax, dword ptr [esp + 0x10]
    push eax
    push -2
    push 0x10101080
    push dword ptr fs:[0]
    mov dword ptr fs:[0], esp
    mov eax, dword ptr [esp + 0x20]
    mov ebx, dword ptr [eax + 8]
    mov esi, dword ptr [eax + 0xc]
    cmp esi, -1
    je L0
    cmp esi, dword ptr [esp + 0x24]
    je L0
    lea esi, [esi + esi*2]
    mov ecx, dword ptr [ebx + esi*4]
    mov dword ptr [esp + 8], ecx
    mov dword ptr [eax + 0xc], ecx
    cmp dword ptr [ebx + esi*4 + 4], 0
    jne L1
    push 0x101
    mov eax, dword ptr [ebx + esi*4 + 8]
    call sub_1010118a
    call dword ptr [ebx + esi*4 + 8]
    jmp L2
    pop dword ptr fs:[0]
    add esp, 0xc
    pop edi
    pop esi
    pop ebx
    ret
__local_unwind2 ENDP
END