.686
.MODEL FLAT, C
EXTRN sub_100858BD:PROC
EXTRN sub_100858D5:PROC
EXTRN sub_10086ACA:PROC
EXTRN sub_10086B17:PROC
EXTRN sub_1008A98A:PROC
EXTRN sub_1008ACAA:PROC
EXTRN sub_1008AF19:PROC
EXTRN sub_1008AF23:PROC
EXTRN sub_1008AF3B:PROC
EXTRN sub_1008AF43:PROC
EXTRN sub_1008AF47:PROC
EXTRN sub_1008AF65:PROC
EXTRN sub_1008AF6D:PROC
EXTRN sub_1008AF73:PROC
EXTRN sub_1008AFDD:PROC
EXTRN sub_1008B04B:PROC
EXTRN sub_1008B05C:PROC
EXTRN sub_1008B05F:PROC
EXTRN sub_1008B062:PROC
EXTRN sub_1008B081:PROC
EXTRN sub_1008B08D:PROC
EXTRN sub_1008B08F:PROC
EXTRN sub_1008B090:PROC
EXTRN sub_1008B0DC:PROC
EXTRN sub_1008B0F0:PROC
EXTRN sub_1008B0F6:PROC
.CODE
FUN_1008acd3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov edi, ecx
L0:
    call sub_1008A98A
    xor xor edx, edx
    xor xor ecx, ecx
    cmp cmp dword ptr [edi + 12], edx
    jbe L1
    mov mov eax, dword ptr [edi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    inc inc ecx
    mov mov dword ptr [eax + 24], edx
    mov mov dword ptr [eax + 32], edx
    mov mov dword ptr [eax + 20], edx
    mov mov dword ptr [eax + 28], edx
    cmp cmp ecx, dword ptr [edi + 12]
    jb L1
    cmp cmp dword ptr [edi + 12], edx
    mov mov dword ptr [ebp - 4], edx
    jbe L5
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov esi, dword ptr [eax + ecx*4]
    test test word ptr [esi + 2], 0FFF0h
    je L6
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 12], edx
    jbe L3
    mov mov eax, dword ptr [esi + 16]
    push push 0
    push push dword ptr [ebp - 4]
    mov mov ecx, edi
    push push dword ptr [eax + ebx*4]
    call sub_1008ACAA
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    jb L3
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 4], ebx
    jbe L8
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax + ebx*4]
    cmp cmp eax, -1
    je L7
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    je L9
    mov mov eax, ecx
    push push 1
    push push dword ptr [ebp - 4]
    mov mov ecx, edi
    push push eax
    call L0
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 4]
    jb L8
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    xor xor edx, edx
    cmp cmp eax, dword ptr [edi + 12]
    jb L5
    xor xor ebx, ebx
    cmp cmp dword ptr [edi + 12], edx
    jbe L11
    mov mov eax, dword ptr [edi + 24]
    mov mov esi, dword ptr [eax + ebx*4]
    mov mov eax, dword ptr [esi + 20]
L3:
    cmp cmp eax, edx
    je L10
    push push eax
    call sub_100858BD
    test test eax, eax
    mov mov dword ptr [esi + 24], eax
    je sub_1008AF23
L4:
    mov mov eax, dword ptr [esi + 28]
    test test eax, eax
    je L12
    push push eax
    call sub_100858D5
    test test eax, eax
    mov mov dword ptr [esi + 32], eax
    je sub_1008AF3B
    xor xor edx, edx
    inc inc ebx
    mov mov dword ptr [esi + 20], edx
    mov mov dword ptr [esi + 28], edx
    cmp cmp ebx, dword ptr [edi + 12]
    jb L11
    cmp cmp dword ptr [edi + 12], edx
    mov mov dword ptr [ebp - 4], edx
    jbe sub_1008AF43
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov esi, dword ptr [eax + ecx*4]
L7:
    test test word ptr [esi + 2], 0FFF0h
    je sub_1008AF47
L8:
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 12], ebx
    jbe sub_1008AF19
    mov mov eax, dword ptr [esi + 16]
    push push 0
    push push dword ptr [ebp - 4]
    mov mov ecx, edi
    push push dword ptr [eax + ebx*4]
    call L2
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    jb sub_1008AF19
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 4], ebx
    jbe sub_1008AF6D
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax + ebx*4]
    cmp cmp eax, -1
    je sub_1008AF65
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    je sub_1008AF73
    mov mov eax, ecx
    push push 1
    push push dword ptr [ebp - 4]
    mov mov ecx, edi
    push push eax
    call L4
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 4]
    jb sub_1008AF6D
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    xor xor edx, edx
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_1008AF43
    cmp cmp dword ptr [edi + 12], edx
    mov mov dword ptr [ebp - 8], edx
    jbe sub_1008B081
    jmp sub_1008AFDD
    mov mov eax, 08007000Eh
    jmp sub_1008B08F
    xor xor edx, edx
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 8]
L10:
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 20]
    cmp cmp eax, edx
    je sub_1008B04B
    push push edx
    push push eax
    push push dword ptr [esi + 24]
    push push 0100865C6h
    call sub_10086ACA
L11:
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp dword ptr [esi + 20], ebx
    mov mov dword ptr [ebp - 4], ebx
    mov mov edx, ebx
    jbe sub_1008B05F
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + edx*4]
    cmp cmp ecx, dword ptr [eax + edx*4 - 4]
L12:
    je sub_1008B062
    mov mov ebx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + ebx*4], ecx
    inc inc edx
    cmp cmp edx, dword ptr [esi + 20]
    jb sub_1008B05C
    xor xor ebx, ebx
    inc inc ebx
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [esi + 20], eax
    jmp sub_1008B090
    xor xor ebx, ebx
    inc inc ebx
    mov mov eax, dword ptr [esi + 28]
    test test eax, eax
    je sub_1008B0DC
    push push 0
    push push eax
    push push dword ptr [esi + 32]
    push push 0100865C6h
    call sub_10086B17
    cmp cmp dword ptr [esi + 28], ebx
    mov mov dword ptr [ebp - 4], ebx
    mov mov edx, ebx
    jbe sub_1008B0F0
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax + edx*4]
    cmp cmp ecx, dword ptr [eax + edx*4 - 4]
    je sub_1008B0F6
    mov mov ebx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + ebx*4], ecx
    inc inc edx
    cmp cmp edx, dword ptr [esi + 28]
    jb sub_1008B0F0
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [esi + 28], eax
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_1008B08D
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_1008acd3 ENDP
END
