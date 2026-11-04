.686
.MODEL FLAT, C
EXTRN sub_1006C49C:PROC
EXTRN sub_1006DB8D:PROC
EXTRN sub_10085E13:PROC
EXTRN sub_100F789F:PROC
EXTRN sub_100F78CB:PROC
EXTRN sub_100F78F7:PROC
.CODE
FUN_10086309 PROC
    mov edi, edi
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    cmp dword ptr [esi + 16], ebx
    push edi
    mov dword ptr [esi], 0101103F8h
    je L3
    xor edi, edi
    cmp dword ptr [esi + 4], ebx
    jbe L2
L0:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + edi*4]
    cmp ecx, ebx
    je L1
    push 1
    call sub_10085E13
L1:
    inc edi
    cmp edi, dword ptr [esi + 4]
    jb L0
L2:
    push dword ptr [esi + 16]
    call sub_100F789F
    pop ecx
L3:
    cmp dword ptr [esi + 20], ebx
    je L7
    xor edi, edi
    cmp dword ptr [esi + 8], ebx
    jbe L6
L4:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + edi*4]
    cmp ecx, ebx
    je L5
    push 1
    call sub_1006DB8D
L5:
    inc edi
    cmp edi, dword ptr [esi + 8]
    jb L4
L6:
    push dword ptr [esi + 20]
    call sub_100F78CB
    pop ecx
L7:
    cmp dword ptr [esi + 24], ebx
    je L11
    xor edi, edi
    cmp dword ptr [esi + 12], ebx
    jbe L10
L8:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + edi*4]
    cmp ecx, ebx
    je L9
    push 1
    call sub_1006C49C
L9:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L8
L10:
    push dword ptr [esi + 24]
    call sub_100F78F7
    pop ecx
L11:
    pop edi
    pop esi
    pop ebx
    ret
FUN_10086309 ENDP
END
