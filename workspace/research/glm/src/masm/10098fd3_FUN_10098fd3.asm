.686
.MODEL FLAT, C
EXTRN sub_10086EEC:PROC
EXTRN sub_1008710C:PROC
EXTRN sub_1008B336:PROC
EXTRN sub_1008B72C:PROC
EXTRN sub_1008BC97:PROC
EXTRN sub_1008BEE4:PROC
EXTRN sub_1008BFAE:PROC
EXTRN sub_1008C4BB:PROC
EXTRN sub_1008C9C8:PROC
EXTRN sub_1008CCEA:PROC
EXTRN sub_1008D4B5:PROC
EXTRN sub_1008D572:PROC
EXTRN sub_1008D78E:PROC
EXTRN sub_1008F711:PROC
EXTRN sub_10093948:PROC
EXTRN sub_10093D33:PROC
EXTRN sub_1009483F:PROC
EXTRN sub_10094A63:PROC
EXTRN sub_10094AE4:PROC
EXTRN sub_10094FDB:PROC
EXTRN sub_1009529E:PROC
EXTRN sub_10096B47:PROC
.CODE
FUN_10098fd3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, ecx
    call sub_1008B72C
    xor ebx, ebx
    cmp eax, ebx
    jl L29
    mov ecx, esi
    call sub_1008BEE4
    cmp eax, ebx
    jl L29
    mov ecx, esi
    call sub_1009483F
    cmp eax, ebx
    jl L29
    mov ecx, esi
    call sub_10086EEC
    cmp eax, ebx
    jl L29
    mov ecx, esi
    call sub_1008D572
    cmp eax, ebx
    jl L29
    xor ecx, ecx
    cmp dword ptr [esi + 12], ebx
    jbe L2
L0:
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax]
    and edx, 0FFF00000h
    cmp edx, 010200000h
    jne L1
    mov edx, dword ptr [eax + 12]
    and edx, 0000FFFFFh
    or edx, 010000000h
    mov dword ptr [eax], edx
L1:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    jb L0
L2:
    test byte ptr [esi + 0000000CCh], 4
    je L3
    mov dword ptr [esi + 0000000D8h], 1
    xor eax, eax
    jmp L29
L3:
    mov ecx, esi
    call sub_1008F711
    cmp eax, ebx
    jl L29
    mov ecx, esi
    call sub_1008BC97
    cmp eax, ebx
    jl L29
    mov dword ptr [ebp - 4], ebx
    push edi
L4:
    mov ecx, esi
    call sub_10093D33
    cmp eax, ebx
    jne L5
    xor eax, eax
    jmp L6
L5:
    jl L28
L6:
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    mov edi, ecx
    mov ecx, esi
    call sub_1008BFAE
    cmp eax, ebx
    jne L7
    xor eax, eax
    jmp L8
L7:
    jl L28
L8:
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    or edi, ecx
    mov ecx, esi
    call sub_10094AE4
    cmp eax, ebx
    jne L9
    xor eax, eax
    jmp L10
L9:
    jl L28
L10:
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    push ebx
    or edi, ecx
    mov ecx, esi
    call sub_10094FDB
    cmp eax, ebx
    jne L11
    xor eax, eax
    jmp L12
L11:
    jl L28
L12:
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    or edi, ecx
    mov ecx, esi
    call sub_1008C4BB
    cmp eax, ebx
    jne L13
    xor eax, eax
    jmp L14
L13:
    jl L28
L14:
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    or edi, ecx
    mov ecx, esi
    call sub_1009529E
    cmp eax, ebx
    jne L15
    xor eax, eax
    jmp L16
L15:
    jl L28
L16:
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    or edi, ecx
    mov ecx, esi
    call sub_1008C9C8
    cmp eax, ebx
    jne L17
    xor eax, eax
    jmp L18
L17:
    jl L28
L18:
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    or edi, ecx
    mov ecx, esi
    call sub_1008CCEA
    cmp eax, ebx
    jne L19
    xor eax, eax
    jmp L20
L19:
    jl L28
L20:
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    or edi, ecx
    mov ecx, esi
    call sub_10096B47
    cmp eax, ebx
    jne L21
    xor eax, eax
    jmp L22
L21:
    jl L28
L22:
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    or ecx, edi
    je L23
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 000000100h
    jb L4
L23:
    cmp dword ptr [ebp - 4], 000000100h
    jne L24
    push 0101106E4h
    push ebx
    push ebx
    push esi
    call sub_1008B336
    add esp, 16
L24:
    xor edx, edx
    cmp dword ptr [esi + 8], ebx
    jbe L27
L25:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + 4]
    mov edi, dword ptr [esi + 16]
    mov ecx, dword ptr [edi + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 1
    je L26
    test ch, 12
    jne L26
    mov ecx, dword ptr [esi + 120]
    or dword ptr [eax + 12], 0FFFFFFFFh
    or dword ptr [eax + 16], 0FFFFFFFFh
    mov dword ptr [eax + 4], ecx
L26:
    inc edx
    cmp edx, dword ptr [esi + 8]
    jb L25
L27:
    mov ecx, esi
    call sub_10093948
    cmp eax, ebx
    jl L28
    mov ecx, esi
    call sub_1008D4B5
    cmp eax, ebx
    jl L28
    mov ecx, esi
    call sub_10094A63
    cmp eax, ebx
    jl L28
    mov ecx, esi
    call sub_1008710C
    cmp eax, ebx
    jl L28
    mov ecx, esi
    call sub_1008D78E
    cmp eax, ebx
    jl L28
    mov dword ptr [esi + 0000000D8h], 1
    xor eax, eax
L28:
    pop edi
L29:
    pop esi
    pop ebx
    leave
    ret
FUN_10098fd3 ENDP
END
