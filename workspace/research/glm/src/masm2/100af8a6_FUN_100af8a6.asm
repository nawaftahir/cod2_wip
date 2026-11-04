.686
.MODEL FLAT, C
EXTRN sub_100AFA11:PROC
EXTRN sub_100AFA3B:PROC
EXTRN sub_100AFA71:PROC
EXTRN sub_100AFA94:PROC
EXTRN sub_100AFAAA:PROC
EXTRN sub_100AFAAD:PROC
EXTRN sub_100AFABE:PROC
EXTRN sub_100AFAE0:PROC
EXTRN sub_100AFAF6:PROC
EXTRN sub_100AFB0A:PROC
EXTRN sub_100AFB15:PROC
EXTRN sub_100AFB20:PROC
EXTRN sub_100C4DFC:PROC
EXTRN sub_100C9900:PROC
.CODE
FUN_100af8a6 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ebx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 8]
    mov mov edx, dword ptr [esi + 0100h]
    push push edi
    push push dword ptr [ebp + 8]
    and and ebx, 0FFFFFh
    mov mov edi, ebx
    sub sub edi, dword ptr [eax + 4]
    lea lea eax, [ecx + ebx*4]
    neg neg edi
    sbb sbb edi, edi
    and and edi, eax
    lea lea eax, [ebx + ebx]
    cmp cmp eax, dword ptr [edx + 4]
    mov mov dword ptr [ebp - 12], ecx
    lea lea ecx, [ecx + ebx*8]
    sbb sbb eax, eax
    and and eax, ecx
    mov mov ecx, esi
    mov mov dword ptr [ebp - 16], eax
    call sub_100C9900
    test test eax, eax
    jl sub_100AFA3B
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    movzx movzx eax, byte ptr [eax + 109]
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [ebp + 8], eax
    push push 0
    and and eax, 07FFh
    or or eax, 0B0000000h
    push push 0F0000h
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [ebp - 4], eax
    call call dword ptr [edx + 100]
    test test eax, eax
    jl sub_100AFA71
    test test edi, edi
    je sub_100AFA11
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp + 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100AFA94
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    push push 0F0000h
    push push ebx
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100AFAAA
    push push dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100AFABE
    mov mov edi, dword ptr [ebp - 16]
    test test edi, edi
    je sub_100AFAAD
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp + 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100AFAE0
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    push push 0F0000h
    push push ebx
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100AFAF6
    push push dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100AFB0A
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100AFB15
    mov mov ecx, esi
    call sub_100C4DFC
    test test eax, eax
    jl sub_100AFB20
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_100af8a6 ENDP
END
