.686
.MODEL FLAT, C
EXTRN sub_1008B070:PROC
EXTRN sub_100C513F:PROC
EXTRN sub_100F78F1:PROC
.CODE
FUN_100a59c7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 4]
    mov esi, ecx
    cmp eax, dword ptr [esi + 000000080h]
    je L0
    cmp eax, dword ptr [esi + 000000084h]
    jne L1
L0:
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    push eax
    push 0101A3C68h
    mov ecx, esi
    call sub_100C513F
    mov ebx, eax
    cmp dword ptr [ebx + 16], -1
    jne L2
L1:
    push dword ptr [ebp + 16]
    mov ecx, esi
    push dword ptr [ebp + 12]
    push edi
    call sub_1008B070
    jmp L3
L2:
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    mov ecx, dword ptr [esi + 16]
    mov esi, dword ptr [ebp + 16]
    push eax
    push dword ptr [ebx]
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [ecx + eax*4]
    push dword ptr [eax]
    mov edi, dword ptr [ebp + 12]
    push 010114770h
    push esi
    push edi
    call sub_100F78F1
    add esp, 24
    mov byte ptr [edi + esi - 1], 0
L3:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 12
FUN_100a59c7 ENDP
END
