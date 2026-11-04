.686
.MODEL FLAT, C
EXTRN sub_10101119:PROC
EXTRN sub_10101128:PROC
EXTRN sub_1010112E:PROC
EXTRN sub_10101140:PROC
EXTRN sub_1010118A:PROC
.CODE
__local_unwind2 PROC
    push push ebx
    push push esi
    push push edi
    mov mov eax, dword ptr [esp + 16]
    push push eax
    push push -2
    push push 010101080h
    push push dword ptr fs:[0]
    mov mov dword ptr fs:[0], esp
    mov mov eax, dword ptr [esp + 32]
    mov mov ebx, dword ptr [eax + 8]
    mov mov esi, dword ptr [eax + 12]
    cmp cmp esi, -1
    je sub_10101128
    cmp cmp esi, dword ptr [esp + 36]
    je sub_1010112E
    lea lea esi, [esi + esi*2]
    mov mov ecx, dword ptr [ebx + esi*4]
    mov mov dword ptr [esp + 8], ecx
    mov mov dword ptr [eax + 12], ecx
    cmp cmp dword ptr [ebx + esi*4 + 4], 0
    jne sub_10101140
    push push 0101h
    mov mov eax, dword ptr [ebx + esi*4 + 8]
    call sub_1010118A
    call call dword ptr [ebx + esi*4 + 8]
    jmp sub_10101119
    pop pop dword ptr fs:[0]
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
__local_unwind2 ENDP
END
