.686
.MODEL FLAT, C
EXTRN sub_1010118A:PROC
.CODE
__local_unwind2 PROC
    push ebx
    push esi
    push edi
    mov eax, dword ptr [esp + 16]
    push eax
    push -2
    push 010101080h
    push dword ptr fs:[0]
    mov dword ptr fs:[0], esp
L0:
    mov eax, dword ptr [esp + 32]
    mov ebx, dword ptr [eax + 8]
    mov esi, dword ptr [eax + 12]
    cmp esi, -1
    je L2
    cmp esi, dword ptr [esp + 36]
    je L2
    lea esi, [esi + esi*2]
    mov ecx, dword ptr [ebx + esi*4]
    mov dword ptr [esp + 8], ecx
    mov dword ptr [eax + 12], ecx
    cmp dword ptr [ebx + esi*4 + 4], 0
    jne L1
    push 000000101h
    mov eax, dword ptr [ebx + esi*4 + 8]
    call sub_1010118A
    call dword ptr [ebx + esi*4 + 8]
L1:
    jmp L0
L2:
    pop dword ptr fs:[0]
    add esp, 12
    pop edi
    pop esi
    pop ebx
    ret
__local_unwind2 ENDP
END
