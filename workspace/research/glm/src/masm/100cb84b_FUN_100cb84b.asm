.686
.MODEL FLAT, C
EXTRN sub_100C9AE7:PROC
EXTRN sub_100C9B0F:PROC
EXTRN sub_100CB31F:PROC
.CODE
FUN_100cb84b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax]
    and eax, 0000FFFFFh
    dec eax
    push edi
    je L2
    dec eax
    dec eax
    je L1
    dec eax
    je L0
    mov eax, dword ptr [esi]
    xor edi, edi
    push edi
    push edi
    push 2
    lea ecx, [ebp - 8]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    cmp eax, edi
    jl L4
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    push edi
    push edi
    push edi
    push edi
    push 2
    push edi
    lea ecx, [eax + 8]
    push ecx
    push eax
    push 2
    lea eax, [ebp - 8]
    push eax
    push 5
    mov ecx, esi
    call sub_100C9AE7
    cmp eax, edi
    jl L4
    mov eax, dword ptr [esi + 000000100h]
    push edi
    push edi
    push edi
    push edi
    push 1
    push edi
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    push dword ptr [eax + 12]
    mov ecx, esi
    push dword ptr [eax + 16]
    push 2
    call sub_100C9B0F
    cmp eax, edi
    jl L4
    xor eax, eax
    jmp L4
L0:
    push 0
    push 9
    jmp L3
L1:
    push 0
    push 8
    jmp L3
L2:
    push 0
    push 5
L3:
    mov ecx, esi
    call sub_100CB31F
L4:
    pop edi
    pop esi
    leave
    ret
FUN_100cb84b ENDP
END
