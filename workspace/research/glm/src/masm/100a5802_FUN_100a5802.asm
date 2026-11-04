.686
.MODEL FLAT, C
EXTRN sub_100C4940:PROC
.CODE
FUN_100a5802 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ecx, dword ptr [edi]
    mov ecx, dword ptr [edx + ecx*4]
    push dword ptr [ecx + 108]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    cmp eax, 17
    jne L0
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [eax], 000E40000h
    xor eax, eax
    jmp L1
L0:
    push dword ptr [ebp + 20]
    mov ecx, esi
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push edi
    call sub_100C4940
L1:
    pop edi
    pop esi
    pop ebp
    ret 16
FUN_100a5802 ENDP
END
