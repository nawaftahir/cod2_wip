.686
.MODEL FLAT, C
EXTRN sub_100B36F5:PROC
EXTRN sub_100B370D:PROC
EXTRN sub_100B3736:PROC
EXTRN sub_100C9B36:PROC
EXTRN sub_100C9B56:PROC
.CODE
FUN_100b3610 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 80
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    push push edi
    mov mov edi, dword ptr [eax]
    mov mov dword ptr [ebp - 8], ecx
    mov mov ecx, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + 8]
    xor xor ebx, ebx
    push push ebx
    push push ebx
    mov mov dword ptr [ebp - 16], ecx
    push push 4
    lea lea ecx, [ebp - 48]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    and and edi, 0FFFFFh
    call call dword ptr [eax + 080h]
    cmp cmp eax, ebx
    jl sub_100B3736
    mov mov dword ptr [ebp - 4], ebx
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 0220h]
    mov mov eax, edx
    shl shl eax, 2
    cmp cmp edx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp + eax - 64], ecx
    mov mov ecx, dword ptr [esi + 0224h]
    mov mov dword ptr [ebp + eax - 80], ecx
    jae sub_100B370D
    mov mov ecx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ebp + ecx*4 - 48]
    mov mov dword ptr [ebp + eax - 32], ecx
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 4
    jb sub_100B36F5
    mov mov eax, dword ptr [ebp - 12]
    push push ebx
    push push ebx
    push push 01000000h
    push push ebx
    push push edi
    push push ebx
    lea lea eax, [eax + edi*4]
    push push eax
    push push dword ptr [ebp - 12]
    lea lea eax, [ebp - 32]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push eax
    push push 2
    call sub_100C9B36
    push push ebx
    push push ebx
    push push ebx
    push push ebx
    push push edi
    lea lea eax, [ebp - 64]
    push push eax
    lea lea eax, [ebp - 80]
    push push eax
    lea lea eax, [ebp - 32]
    push push eax
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 16]
    push push 88
    call sub_100C9B56
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b3610 ENDP
END
