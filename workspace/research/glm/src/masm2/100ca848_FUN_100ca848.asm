.686
.MODEL FLAT, C
EXTRN sub_100C4E78:PROC
EXTRN sub_100C9938:PROC
EXTRN sub_100CAA30:PROC
EXTRN sub_100CAA42:PROC
EXTRN sub_100CAA51:PROC
EXTRN sub_100CAA81:PROC
EXTRN sub_100CAAA1:PROC
EXTRN sub_100CAB15:PROC
EXTRN sub_100CAB37:PROC
EXTRN sub_100CAB4D:PROC
EXTRN sub_100CAB79:PROC
EXTRN sub_100CABA0:PROC
EXTRN sub_100CABB4:PROC
EXTRN sub_100CABBF:PROC
EXTRN sub_100CABCA:PROC
.CODE
FUN_100ca848 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 28
    push push esi
    mov mov esi, ecx
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 52], ecx
    jne L0
    mov mov eax, 080004001h
    jmp sub_100CAA30
    mov mov eax, dword ptr [esi + 0100h]
    cmp cmp dword ptr [eax + 12], ecx
    jne L1
    xor xor eax, eax
    jmp sub_100CAA42
L0:
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edx + eax*4]
    push push ebx
    mov mov dword ptr [ebp - 28], eax
    mov mov dword ptr [ebp - 4], ecx
    push push edi
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [ecx + 12]
    imul imul edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov edi, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [edi + 4]
    cmp cmp ecx, dword ptr [eax + 4]
    jne L2
    mov mov ecx, dword ptr [edi + 8]
    cmp cmp ecx, dword ptr [eax + 8]
    jne L3
    mov mov ecx, dword ptr [edi + 12]
    cmp cmp ecx, dword ptr [eax + 12]
    jne L4
    mov mov ecx, dword ptr [edi + 16]
    cmp cmp ecx, dword ptr [eax + 16]
    je sub_100CAA81
    push push 1
    mov mov ecx, esi
    call sub_100C9938
    test test eax, eax
    jl sub_100CAAA1
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ebx, dword ptr [eax + 12]
    mov mov eax, dword ptr [eax + 16]
    and and ebx, 07FFh
    xor xor ecx, ecx
    or or ebx, 0B0001000h
    sub sub eax, ecx
    je L7
    dec dec eax
    je L6
    dec dec eax
    je L5
    dec dec eax
    jne L8
    or or ebx, 0FF0000h
    jmp L9
    or or ebx, 0AA0000h
    jmp L10
    or or ebx, 0550000h
    cmp cmp dword ptr [edi + 24], ecx
    jne L11
    or or ebx, 0D000000h
    mov mov eax, dword ptr [esi]
    lea lea edx, [ebp - 16]
    push push edx
L2:
    mov mov edx, dword ptr [esi + 20]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
L3:
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    test test eax, eax
    jl sub_100CAB15
    push push dword ptr [ebp - 16]
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [eax + 12]
    mov mov ecx, esi
    push push dword ptr [eax + 16]
    call call dword ptr [edx + 112]
    test test eax, eax
    jl sub_100CAB37
    mov mov eax, dword ptr [esi]
    push push ebx
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 8]
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100CAB4D
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [esi]
    lea lea ecx, [ebp - 20]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    mov mov ecx, dword ptr [eax + 12]
    imul imul ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 20]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, esi
    call call dword ptr [edx + 116]
    test test eax, eax
    jl sub_100CAB79
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [ecx + 12]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [esi]
    lea lea edi, [ebp - 24]
    push push edi
    push push dword ptr [ebp - 12]
L6:
    push push eax
    imul imul eax, dword ptr [ebp - 4]
    lea lea eax, [ecx + eax*4]
    push push eax
    mov mov ecx, esi
    call call dword ptr [edx + 120]
    test test eax, eax
    jl sub_100CABA0
    push push dword ptr [ebp - 20]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 24]
    mov mov ecx, esi
L10:
    push push dword ptr [ebp - 8]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CABB4
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CABBF
    mov mov ecx, esi
    call sub_100C4E78
    test test eax, eax
    jl sub_100CABCA
    mov mov eax, dword ptr [ebp - 28]
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 2
    jb sub_100CAA51
    xor xor eax, eax
    pop pop edi
    pop pop ebx
    pop pop esi
    leave leave
    ret ret
FUN_100ca848 ENDP
END
