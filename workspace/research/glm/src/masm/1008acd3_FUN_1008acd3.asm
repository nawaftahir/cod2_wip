.686
.MODEL FLAT, C
EXTRN sub_100858BD:PROC
EXTRN sub_100858D5:PROC
EXTRN sub_10086ACA:PROC
EXTRN sub_10086B17:PROC
EXTRN sub_1008A98A:PROC
EXTRN sub_1008ACAA:PROC
EXTRN sub_1008ACDF:PROC
EXTRN sub_1008AD6F:PROC
EXTRN sub_1008ADA4:PROC
.CODE
FUN_1008acd3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    push edi
    mov edi, ecx
    call sub_1008A98A
    xor edx, edx
    xor ecx, ecx
    cmp dword ptr [edi + 12], edx
    jbe L1
L0:
    mov eax, dword ptr [edi + 24]
    mov eax, dword ptr [eax + ecx*4]
    inc ecx
    mov dword ptr [eax + 24], edx
    mov dword ptr [eax + 32], edx
    mov dword ptr [eax + 20], edx
    mov dword ptr [eax + 28], edx
    cmp ecx, dword ptr [edi + 12]
    jb L0
L1:
    cmp dword ptr [edi + 12], edx
    mov dword ptr [ebp - 4], edx
    jbe L8
L2:
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 4]
    mov esi, dword ptr [eax + ecx*4]
    test word ptr [esi + 2], 00000FFF0h
    je L7
    xor ebx, ebx
    cmp dword ptr [esi + 12], edx
    jbe L4
L3:
    mov eax, dword ptr [esi + 16]
    push 0
    push dword ptr [ebp - 4]
    mov ecx, edi
    push dword ptr [eax + ebx*4]
    call sub_1008ACAA
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L3
L4:
    xor ebx, ebx
    cmp dword ptr [esi + 4], ebx
    jbe L7
L5:
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + ebx*4]
    cmp eax, -1
    je L6
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    je L6
    mov eax, ecx
L6:
    push 1
    push dword ptr [ebp - 4]
    mov ecx, edi
    push eax
    call sub_1008ACDF
    inc ebx
    cmp ebx, dword ptr [esi + 4]
    jb L5
L7:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    xor edx, edx
    cmp eax, dword ptr [edi + 12]
    jb L2
L8:
    xor ebx, ebx
    cmp dword ptr [edi + 12], edx
    jbe L12
L9:
    mov eax, dword ptr [edi + 24]
    mov esi, dword ptr [eax + ebx*4]
    mov eax, dword ptr [esi + 20]
    cmp eax, edx
    je L10
    push eax
    call sub_100858BD
    test eax, eax
    mov dword ptr [esi + 24], eax
    je L20
L10:
    mov eax, dword ptr [esi + 28]
    test eax, eax
    je L11
    push eax
    call sub_100858D5
    test eax, eax
    mov dword ptr [esi + 32], eax
    je L20
L11:
    xor edx, edx
    inc ebx
    mov dword ptr [esi + 20], edx
    mov dword ptr [esi + 28], edx
    cmp ebx, dword ptr [edi + 12]
    jb L9
L12:
    cmp dword ptr [edi + 12], edx
    mov dword ptr [ebp - 4], edx
    jbe L19
L13:
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 4]
    mov esi, dword ptr [eax + ecx*4]
    test word ptr [esi + 2], 00000FFF0h
    je L18
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L15
L14:
    mov eax, dword ptr [esi + 16]
    push 0
    push dword ptr [ebp - 4]
    mov ecx, edi
    push dword ptr [eax + ebx*4]
    call sub_1008AD6F
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L14
L15:
    xor ebx, ebx
    cmp dword ptr [esi + 4], ebx
    jbe L18
L16:
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + ebx*4]
    cmp eax, -1
    je L17
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    je L17
    mov eax, ecx
L17:
    push 1
    push dword ptr [ebp - 4]
    mov ecx, edi
    push eax
    call sub_1008ADA4
    inc ebx
    cmp ebx, dword ptr [esi + 4]
    jb L16
L18:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    xor edx, edx
    cmp eax, dword ptr [edi + 12]
    jb L13
L19:
    cmp dword ptr [edi + 12], edx
    mov dword ptr [ebp - 8], edx
    jbe L32
    jmp L22
L20:
    mov eax, 08007000Eh
    jmp L33
L21:
    xor edx, edx
L22:
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 20]
    cmp eax, edx
    je L26
    push edx
    push eax
    push dword ptr [esi + 24]
    push 0100865C6h
    call sub_10086ACA
    xor ebx, ebx
    inc ebx
    cmp dword ptr [esi + 20], ebx
    mov dword ptr [ebp - 4], ebx
    mov edx, ebx
    jbe L25
L23:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + edx*4]
    cmp ecx, dword ptr [eax + edx*4 - 4]
    je L24
    mov ebx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + ebx*4], ecx
L24:
    inc edx
    cmp edx, dword ptr [esi + 20]
    jb L23
    xor ebx, ebx
    inc ebx
L25:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [esi + 20], eax
    jmp L27
L26:
    xor ebx, ebx
    inc ebx
L27:
    mov eax, dword ptr [esi + 28]
    test eax, eax
    je L31
    push 0
    push eax
    push dword ptr [esi + 32]
    push 0100865C6h
    call sub_10086B17
    cmp dword ptr [esi + 28], ebx
    mov dword ptr [ebp - 4], ebx
    mov edx, ebx
    jbe L30
L28:
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax + edx*4]
    cmp ecx, dword ptr [eax + edx*4 - 4]
    je L29
    mov ebx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + ebx*4], ecx
L29:
    inc edx
    cmp edx, dword ptr [esi + 28]
    jb L28
L30:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [esi + 28], eax
L31:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 12]
    jb L21
L32:
    xor eax, eax
L33:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_1008acd3 ENDP
END
