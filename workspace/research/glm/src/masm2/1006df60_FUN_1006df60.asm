.686
.MODEL FLAT, C
EXTRN sub_1006C66F:PROC
EXTRN sub_1006DCFA:PROC
EXTRN sub_1006E181:PROC
EXTRN sub_1006E186:PROC
EXTRN sub_1006E187:PROC
EXTRN sub_1006E19A:PROC
EXTRN sub_1006E1A0:PROC
EXTRN sub_1006E1A6:PROC
EXTRN sub_1006E1B8:PROC
EXTRN sub_1006E1E6:PROC
EXTRN sub_1006E1F9:PROC
EXTRN sub_1006E215:PROC
EXTRN sub_1006E294:PROC
EXTRN sub_1006E2D1:PROC
EXTRN sub_1006E329:PROC
EXTRN sub_1006E351:PROC
EXTRN sub_1006E361:PROC
EXTRN sub_1006EC0C:PROC
EXTRN sub_10086195:PROC
EXTRN sub_10086209:PROC
.CODE
FUN_1006df60 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 32], ebx
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 8], ebx
    jne L0
    lea lea eax, [ebp - 8]
    mov mov dword ptr [ebp + 32], eax
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp esi, ebx
    je sub_1006E181
    mov mov eax, dword ptr [esi + 4]
    dec dec eax
    je L11
    sub sub eax, 5
    je L9
    dec dec eax
    dec dec eax
    je L3
    dec dec eax
    je L2
    dec dec eax
    dec dec eax
    je L1
    push push 01010F7B0h
    push push ebx
    push push ebx
    push push edi
    call sub_1006DCFA
    add add esp, 16
    jmp sub_1006E1B8
    lea lea eax, [ebp - 4]
    push push eax
    push push dword ptr [esi + 48]
    mov mov ecx, edi
    push push dword ptr [esi + 44]
    push push dword ptr [ebp + 32]
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [esi + 32]
    call sub_1006EC0C
    cmp cmp eax, ebx
    jge sub_1006E1E6
    jmp sub_1006E1F9
    cmp cmp dword ptr [esi + 16], 3
    jne L5
    cmp cmp dword ptr [ebp + 24], ebx
    jne L4
    mov mov ecx, dword ptr [edi + 8]
    push push 4
    push push -1
    push push 02D1h
    push push 01010E8DCh
    call sub_10086195
    mov mov dword ptr [ebp + 16], eax
    jmp L7
    mov mov eax, dword ptr [edi + 8]
    mov mov eax, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    or or byte ptr [eax + 4], 080h
    lea lea eax, [ebp - 4]
    push push eax
    push push dword ptr [ebp + 28]
    mov mov ecx, edi
    push push dword ptr [ebp + 32]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
L2:
    push push dword ptr [esi + 32]
    push push dword ptr [esi + 28]
    push push dword ptr [esi + 24]
    push push dword ptr [esi + 16]
    call sub_1006C66F
    jmp L6
    cmp cmp dword ptr [ebp + 24], ebx
    jne sub_1006E187
    mov mov eax, esi
    cmp cmp dword ptr [eax + 4], 8
    jne L14
    mov mov eax, dword ptr [eax + 16]
    cmp cmp eax, ebx
    jne L13
    cmp cmp eax, ebx
    je sub_1006E19A
    cmp cmp dword ptr [eax + 4], 9
    jne sub_1006E1A0
    cmp cmp dword ptr [eax + 16], 3
    jne sub_1006E1A6
    mov mov ecx, dword ptr [edi + 8]
    push push 4
    push push -1
    push push 02D1h
    push push 01010E8DCh
    call sub_10086209
    mov mov dword ptr [ebp + 16], eax
    mov mov dword ptr [ebp + 24], 1
    cmp cmp dword ptr [esi + 20], 0
    jbe sub_1006E294
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp + 8]
    push push eax
    push push dword ptr [ebp + 32]
    mov mov eax, dword ptr [ebp + 12]
    push push dword ptr [ebp + 28]
    lea lea eax, [eax + ecx*4]
    push push dword ptr [ebp + 24]
    mov mov ecx, edi
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push eax
    push push dword ptr [esi + 16]
    call L5
L5:
    test test eax, eax
    jl sub_1006E2D1
    mov mov eax, dword ptr [ebp + 8]
    add add dword ptr [ebp - 4], eax
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 20]
L6:
    jb sub_1006E215
    jmp sub_1006E2D1
    lea lea eax, [ebp - 4]
    push push eax
    push push dword ptr [ebp + 32]
    mov mov ecx, edi
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [esi + 24]
    call L8
L8:
    jmp sub_1006E186
    mov mov ebx, dword ptr [ebp + 12]
    lea lea eax, [ebp + 12]
    push push eax
    push push dword ptr [ebp + 32]
    mov mov ecx, edi
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
L9:
    push push ebx
    push push dword ptr [esi + 8]
    call L10
L10:
    test test eax, eax
    jl sub_1006E329
    lea lea eax, [ebp + 8]
    push push eax
    push push dword ptr [ebp + 32]
    mov mov eax, dword ptr [ebp + 12]
    push push dword ptr [ebp + 28]
    lea lea eax, [ebx + eax*4]
    push push dword ptr [ebp + 24]
    mov mov ecx, edi
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push eax
    push push dword ptr [esi + 12]
    call L12
L12:
    test test eax, eax
    jl sub_1006E351
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp + 8]
    add add ecx, eax
    mov mov dword ptr [ebp - 4], ecx
    mov mov eax, dword ptr [ebp + 36]
    test test eax, eax
    je sub_1006E361
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [eax], ecx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 32
FUN_1006df60 ENDP
END
