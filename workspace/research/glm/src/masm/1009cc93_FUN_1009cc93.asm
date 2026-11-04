.686
.MODEL FLAT, C
EXTRN sub_1006507F:PROC
EXTRN sub_1008285C:PROC
EXTRN sub_10082899:PROC
EXTRN sub_1009962F:PROC
EXTRN sub_1009B61A:PROC
.CODE
FUN_1009cc93 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push 20
    mov ebx, ecx
    call sub_1006507F
    xor esi, esi
    cmp eax, esi
    je L0
    push 010114B18h
    push dword ptr [ebx + 20]
    mov ecx, eax
    push esi
    call sub_10082899
    mov edi, eax
    jmp L1
L0:
    xor edi, edi
L1:
    cmp edi, esi
    jne L2
    push esi
    mov ecx, ebx
    jmp L3
L2:
    cmp dword ptr [ebp + 8], esi
    mov dword ptr [ebx + 20], edi
    je L5
    push dword ptr [ebp + 8]
    call sub_1008285C
    mov esi, eax
    test esi, esi
    mov dword ptr [edi + 8], esi
    mov ecx, ebx
    jne L4
    push eax
L3:
    call sub_1009962F
    mov eax, 08007000Eh
    jmp L6
L4:
    push dword ptr [esi + 24]
    push esi
    call sub_1009B61A
    test eax, eax
    jl L6
    and byte ptr [esi + 17], 0000000F1h
L5:
    xor eax, eax
L6:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_1009cc93 ENDP
END
