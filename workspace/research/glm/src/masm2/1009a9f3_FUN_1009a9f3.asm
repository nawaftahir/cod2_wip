.686
.MODEL FLAT, C
EXTRN sub_100650BD:PROC
EXTRN sub_1008275E:PROC
EXTRN sub_10082AD6:PROC
EXTRN sub_1009AAD1:PROC
EXTRN sub_1009AADB:PROC
EXTRN sub_1009AAE6:PROC
EXTRN sub_1009AAE7:PROC
EXTRN sub_1009AAF2:PROC
EXTRN sub_1009AAFC:PROC
EXTRN sub_1009AB02:PROC
EXTRN sub_1009AB06:PROC
EXTRN sub_1009AB24:PROC
EXTRN sub_1009AB61:PROC
EXTRN sub_1009AB83:PROC
EXTRN sub_100F792F:PROC
.CODE
FUN_1009a9f3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    test test edi, edi
    mov mov dword ptr [ebp - 4], ecx
    je sub_1009AAD1
    cmp cmp dword ptr [edi + 4], 3
    jne sub_1009AADB
    lea lea ebx, [edi + 16]
    cmp cmp dword ptr [ebx], 10
    jne sub_1009AAE7
    mov mov esi, dword ptr [ebp + 12]
    test test esi, esi
    je sub_1009AAF2
    cmp cmp dword ptr [esi + 4], 3
    jne sub_1009AAFC
    cmp cmp dword ptr [esi + 16], 10
    jne sub_1009AB02
    push push 48
    call sub_100650BD
    test test eax, eax
    je L0
    push push ebx
    mov mov ecx, eax
    call sub_10082AD6
    mov mov dword ptr [ebp + 8], eax
    jmp L1
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [ebp + 8], 0
    je sub_1009AB24
    mov mov eax, dword ptr [edi + 24]
    mov mov ebx, dword ptr [esi + 24]
    mov mov dword ptr [ebp + 12], eax
    lea lea ecx, [eax + 1]
    mov mov dl, byte ptr [eax]
    inc inc eax
    test test dl, dl
    jne sub_1009AAE6
    sub sub eax, ecx
    mov mov ecx, eax
    mov mov eax, ebx
    lea lea esi, [eax + 1]
    mov mov dl, byte ptr [eax]
    inc inc eax
    test test dl, dl
    jne sub_1009AB06
    sub sub eax, esi
    lea lea edi, [eax + ecx + 1]
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + 4]
    push push 1
    push push edi
    call sub_1008275E
    mov mov esi, eax
    test test esi, esi
    je sub_1009AB61
    push push ebx
    push push dword ptr [ebp + 12]
    push push 010194930h
    push push edi
    push push esi
    call sub_100F792F
    mov mov eax, dword ptr [ebp + 8]
    mov mov byte ptr [esi + edi - 1], 0
    add add esp, 20
    mov mov dword ptr [eax + 24], esi
    jmp sub_1009AB83
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_1009a9f3 ENDP
END
