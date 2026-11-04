; _StringVPrintfWorkerA@16 @ 0x100cc712 — auto-synthesized
    sub_100f61e4 PROTO C
.CODE
_StringVPrintfWorkerA@16 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    push ebx
    xor ebx, ebx
    test eax, eax
    jne L0
    mov ebx, 0x80070057
    jmp L1
    push esi
    push edi
    push dword ptr [ebp + 0x14]
    mov edi, dword ptr [ebp + 8]
    push dword ptr [ebp + 0x10]
    lea esi, [eax - 1]
    push esi
    push edi
    call sub_100f61e4
    add esp, 0x10
    test eax, eax
    jl L2
    cmp eax, esi
    ja L2
    jne L3
    jmp L4
    mov ebx, 0x8007007a
    mov byte ptr [esi + edi], 0
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    pop ebp
    ret 0x10
_StringVPrintfWorkerA@16 ENDP
END