.686
.MODEL FLAT, C
EXTRN sub_1006507F:PROC
EXTRN sub_1008285C:PROC
EXTRN sub_10082899:PROC
EXTRN sub_1009962F:PROC
EXTRN sub_1009B61A:PROC
EXTRN sub_1009CD1B:PROC
EXTRN sub_1009CD40:PROC
EXTRN sub_1009CD42:PROC
EXTRN sub_1009CD62:PROC
EXTRN sub_1009CD6F:PROC
.CODE
FUN_1009cc93 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push edi
    push push 20
    mov mov ebx, ecx
    call sub_1006507F
    xor xor esi, esi
    cmp cmp eax, esi
    je L0
    push push 010114B18h
    push push dword ptr [ebx + 20]
    mov mov ecx, eax
    push push esi
    call sub_10082899
    mov mov edi, eax
    jmp L1
    xor xor edi, edi
    cmp cmp edi, esi
    jne L2
    push push esi
    mov mov ecx, ebx
    jmp sub_1009CD1B
    cmp cmp dword ptr [ebp + 8], esi
    mov mov dword ptr [ebx + 20], edi
    je sub_1009CD40
    push push dword ptr [ebp + 8]
    call sub_1008285C
    mov mov esi, eax
    test test esi, esi
    mov mov dword ptr [edi + 8], esi
    mov mov ecx, ebx
    jne sub_1009CD42
    push push eax
    call sub_1009962F
    mov mov eax, 08007000Eh
    jmp sub_1009CD62
    push push dword ptr [esi + 24]
    push push esi
    call sub_1009B61A
L2:
    test test eax, eax
    jl sub_1009CD6F
    and and byte ptr [esi + 17], 0F1h
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 4
FUN_1009cc93 ENDP
END
