.686
.MODEL FLAT, C
EXTRN sub_100C9AF3:PROC
EXTRN sub_100C9B1A:PROC
EXTRN sub_100CAFCC:PROC
EXTRN sub_100CAFF3:PROC
EXTRN sub_100CAFF9:PROC
EXTRN sub_100CB01A:PROC
.CODE
FUN_100caeda PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 16]
    mov mov edx, dword ptr [esi + 20]
    push push edi
    mov mov edi, dword ptr [eax]
    mov mov eax, dword ptr [ecx]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [esi + 088h]
    and and edi, 0FFFFFh
    xor xor ebx, ebx
    cmp cmp edx, dword ptr [eax + 4]
    mov mov dword ptr [ebp - 4], ecx
    je L0
    mov mov eax, dword ptr [esi]
    push push ebx
    push push ebx
    push push edi
    lea lea ecx, [ebp - 20]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov ecx, esi
    call call dword ptr [eax + 080h]
    cmp cmp eax, ebx
    jl sub_100CAFCC
    lea lea eax, [ebp - 20]
    mov mov dword ptr [ebp - 4], eax
    mov mov ecx, eax
    mov mov eax, dword ptr [esi + 0100h]
    push push ebx
    push push ebx
    push push ebx
    push push ebx
    push push edi
    push push ebx
    push push ebx
    push push dword ptr [eax + 8]
    push push edi
    push push ecx
    push push 36
    mov mov ecx, esi
    call sub_100C9AF3
    cmp cmp eax, ebx
    jl sub_100CAFF3
    lea lea eax, [ebp - 20]
    cmp cmp dword ptr [ebp - 4], eax
    jne sub_100CAFF9
    push push ebx
    push push ebx
    push push ebx
    push push ebx
    push push edi
    push push ebx
    push push ebx
    push push eax
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
L0:
    push push dword ptr [eax + 16]
    mov mov ecx, esi
    push push 1
    call sub_100C9B1A
    cmp cmp eax, ebx
    jl sub_100CB01A
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100caeda ENDP
END
