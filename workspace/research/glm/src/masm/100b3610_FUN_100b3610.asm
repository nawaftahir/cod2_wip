.686
.MODEL FLAT, C
EXTRN sub_100C9B36:PROC
EXTRN sub_100C9B56:PROC
.CODE
FUN_100b3610 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 80
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 12]
    push edi
    mov edi, dword ptr [eax]
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 8]
    xor ebx, ebx
    push ebx
    push ebx
    mov dword ptr [ebp - 16], ecx
    push 4
    lea ecx, [ebp - 48]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    and edi, 0000FFFFFh
    call dword ptr [eax + 0x80]
    cmp eax, ebx
    jl L2
    mov dword ptr [ebp - 4], ebx
L0:
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 000000220h]
    mov eax, edx
    shl eax, 2
    cmp edx, dword ptr [ebp - 8]
    mov dword ptr [ebp + eax - 64], ecx
    mov ecx, dword ptr [esi + 000000224h]
    mov dword ptr [ebp + eax - 80], ecx
    jae L1
    mov ecx, dword ptr [ebp - 16]
    mov ecx, dword ptr [eax + ecx]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ebp + ecx*4 - 48]
    mov dword ptr [ebp + eax - 32], ecx
L1:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 4
    jb L0
    mov eax, dword ptr [ebp - 12]
    push ebx
    push ebx
    push 001000000h
    push ebx
    push edi
    push ebx
    lea eax, [eax + edi*4]
    push eax
    push dword ptr [ebp - 12]
    lea eax, [ebp - 32]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push eax
    push 2
    call sub_100C9B36
    push ebx
    push ebx
    push ebx
    push ebx
    push edi
    lea eax, [ebp - 64]
    push eax
    lea eax, [ebp - 80]
    push eax
    lea eax, [ebp - 32]
    push eax
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 16]
    push 88
    call sub_100C9B56
L2:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b3610 ENDP
END
