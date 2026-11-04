.686
.MODEL FLAT, C
EXTRN sub_100F61E4:PROC
.CODE
_StringVPrintfWorkerA@16 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 12]
    push ebx
    xor ebx, ebx
    test eax, eax
    jne L0
    mov ebx, 080070057h
    jmp L4
L0:
    push esi
    push edi
    push dword ptr [ebp + 20]
    mov edi, dword ptr [ebp + 8]
    push dword ptr [ebp + 16]
    lea esi, [eax - 1]
    push esi
    push edi
    call sub_100F61E4
    add esp, 16
    test eax, eax
    jl L1
    cmp eax, esi
    ja L1
    jne L3
    jmp L2
L1:
    mov ebx, 08007007Ah
L2:
    mov byte ptr [esi + edi], 0
L3:
    pop edi
    pop esi
L4:
    mov eax, ebx
    pop ebx
    pop ebp
    ret 16
_StringVPrintfWorkerA@16 ENDP
END
