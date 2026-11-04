.686
.MODEL FLAT, C
EXTRN sub_1006C49C:PROC
EXTRN sub_1006DB8D:PROC
EXTRN sub_10085E13:PROC
EXTRN sub_100863AE:PROC
EXTRN sub_100863B0:PROC
EXTRN sub_100863B2:PROC
EXTRN sub_10086406:PROC
EXTRN sub_10086408:PROC
EXTRN sub_1008640A:PROC
EXTRN sub_100F789F:PROC
EXTRN sub_100F78CB:PROC
EXTRN sub_100F78F7:PROC
.CODE
FUN_10086309 PROC
    mov mov edi, edi
    push push ebx
    push push esi
    mov mov esi, ecx
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 16], ebx
    push push edi
    mov mov dword ptr [esi], 0101103F8h
    je L1
    xor xor edi, edi
    cmp cmp dword ptr [esi + 4], ebx
    jbe L0
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + edi*4]
    cmp cmp ecx, ebx
    je L2
    push push 1
    call sub_10085E13
    inc inc edi
    cmp cmp edi, dword ptr [esi + 4]
    jb L0
    push push dword ptr [esi + 16]
    call sub_100F789F
    pop pop ecx
    cmp cmp dword ptr [esi + 20], ebx
    je sub_100863B0
    xor xor edi, edi
    cmp cmp dword ptr [esi + 8], ebx
    jbe sub_100863AE
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + edi*4]
L0:
    cmp cmp ecx, ebx
L1:
    je sub_100863B2
L2:
    push push 1
    call sub_1006DB8D
    inc inc edi
    cmp cmp edi, dword ptr [esi + 8]
    jb sub_100863AE
    push push dword ptr [esi + 20]
    call sub_100F78CB
    pop pop ecx
    cmp cmp dword ptr [esi + 24], ebx
    je sub_10086408
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], ebx
    jbe sub_10086406
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + edi*4]
    cmp cmp ecx, ebx
    je sub_1008640A
    push push 1
    call sub_1006C49C
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    jb sub_10086406
    push push dword ptr [esi + 24]
    call sub_100F78F7
    pop pop ecx
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_10086309 ENDP
END
