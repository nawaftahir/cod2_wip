.686
.MODEL FLAT, C
EXTRN sub_100C4E33:PROC
EXTRN sub_100C9926:PROC
EXTRN sub_100CA85B:PROC
EXTRN sub_100CA87D:PROC
EXTRN sub_100CA894:PROC
EXTRN sub_100CA8C2:PROC
EXTRN sub_100CA8C4:PROC
EXTRN sub_100CA8E2:PROC
EXTRN sub_100CA8F6:PROC
EXTRN sub_100CA911:PROC
EXTRN sub_100CA91C:PROC
EXTRN sub_100CA927:PROC
EXTRN sub_100CA935:PROC
EXTRN sub_100CA951:PROC
EXTRN sub_100CA965:PROC
EXTRN sub_100CA98F:PROC
EXTRN sub_100CA997:PROC
EXTRN sub_100CA9B2:PROC
.CODE
FUN_100ca63f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push esi
    mov mov esi, ecx
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 52], ecx
    jne L0
    mov mov eax, 080004001h
    jmp L9
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax]
    push push ebx
    push push edi
    mov mov edi, eax
    and and eax, 0FFF00000h
    mov mov ebx, 010F00000h
    and and edi, 0FFFFFh
    cmp cmp eax, ebx
    je L1
    cmp cmp eax, 073500000h
    je L2
    cmp cmp eax, 073600000h
    je L3
    cmp cmp eax, 073700000h
    je L4
    cmp cmp eax, 073800000h
    jne L5
    push push 2
    jmp L6
    push push 4
    jmp L7
    push push 3
    jmp L8
    push push 5
    pop pop ecx
    shl shl ecx, 16
    or or ecx, 94
    push push ecx
    mov mov ecx, esi
    call sub_100C9926
    test test eax, eax
    jl L10
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 20]
    push push ecx
    push push 0
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    test test eax, eax
    jl sub_100CA85B
    push push dword ptr [ebp - 20]
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [esi]
    lea lea ecx, [ebp - 16]
L4:
    push push ecx
    push push dword ptr [eax + 12]
    mov mov ecx, esi
    push push dword ptr [eax + 16]
    call call dword ptr [edx + 112]
    test test eax, eax
    jl sub_100CA87D
    mov mov eax, dword ptr [esi]
    push push 0
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100CA894
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    mov mov edx, dword ptr [esi]
    and and ecx, 0FFF00000h
    cmp cmp ecx, ebx
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 20]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, esi
    jne sub_100CA8C2
    call call dword ptr [edx + 116]
    test test eax, eax
    jl sub_100CA8C4
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push dword ptr [eax + 12]
    push push dword ptr [eax + 8]
    call call dword ptr [edx + 120]
    test test eax, eax
    jl sub_100CA8E2
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CA8F6
    mov mov ecx, dword ptr [ebp - 12]
    push push dword ptr [ebp - 8]
    xor xor ecx, 01000000h
    push push ecx
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CA911
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CA91C
    mov mov ecx, esi
    call sub_100C4E33
    test test eax, eax
    jl sub_100CA927
    xor xor eax, eax
    pop pop edi
    pop pop ebx
    pop pop esi
    leave leave
    ret ret
    call call dword ptr [edx + 116]
    test test eax, eax
    jl sub_100CA935
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp - 16]
    mov mov ecx, dword ptr [esi + 0100h]
    push push edi
    push push dword ptr [ecx + 8]
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CA951
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CA965
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ebx, edi
    shl shl ebx, 2
    mov mov ecx, dword ptr [ebx + ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CA98F
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp - 16]
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    add add ecx, ebx
    push push edi
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CA9B2
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp - 12]
    jmp sub_100CA997
FUN_100ca63f ENDP
END
