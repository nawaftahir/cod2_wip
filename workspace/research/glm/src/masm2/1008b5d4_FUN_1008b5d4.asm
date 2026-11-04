.686
.MODEL FLAT, C
EXTRN sub_100863B2:PROC
EXTRN sub_10086C51:PROC
EXTRN sub_1008B731:PROC
EXTRN sub_1008B84B:PROC
EXTRN sub_1008B858:PROC
.CODE
FUN_1008b5d4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    push push edi
    mov mov esi, ecx
    call sub_100863B2
    test test eax, eax
    jl sub_1008B731
    mov mov eax, dword ptr [edi + 0C0h]
    mov mov dword ptr [esi + 0C0h], eax
    mov mov eax, dword ptr [edi + 0C4h]
    and and dword ptr [esi + 0D4h], 0
    and and dword ptr [esi + 0D8h], 0
    and and dword ptr [esi + 0DCh], 0
    mov mov dword ptr [esi + 0C4h], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [esi + 0C8h], eax
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [esi + 0CCh], eax
    mov mov eax, dword ptr [edi + 116]
    mov mov dword ptr [esi + 116], eax
    mov mov eax, dword ptr [edi + 120]
    mov mov dword ptr [esi + 120], eax
    mov mov eax, dword ptr [edi + 124]
    mov mov dword ptr [esi + 124], eax
    mov mov eax, dword ptr [edi + 080h]
    mov mov dword ptr [esi + 080h], eax
    mov mov eax, dword ptr [edi + 084h]
    mov mov dword ptr [esi + 084h], eax
    mov mov eax, dword ptr [edi + 088h]
    mov mov dword ptr [esi + 088h], eax
    mov mov eax, dword ptr [edi + 08Ch]
    mov mov dword ptr [esi + 08Ch], eax
    mov mov eax, dword ptr [edi + 090h]
    mov mov dword ptr [esi + 090h], eax
    mov mov eax, dword ptr [edi + 094h]
    mov mov dword ptr [esi + 094h], eax
    mov mov eax, dword ptr [edi + 098h]
    mov mov dword ptr [esi + 098h], eax
    mov mov eax, dword ptr [edi + 09Ch]
    mov mov dword ptr [esi + 09Ch], eax
    mov mov eax, dword ptr [edi + 0A0h]
    mov mov dword ptr [esi + 0A0h], eax
    mov mov eax, dword ptr [edi + 0A4h]
    mov mov dword ptr [esi + 0A4h], eax
    mov mov eax, dword ptr [edi + 0A8h]
    mov mov dword ptr [esi + 0A8h], eax
    mov mov eax, dword ptr [edi + 0ACh]
    mov mov dword ptr [esi + 0ACh], eax
    mov mov eax, dword ptr [edi + 0B0h]
    mov mov dword ptr [esi + 0B0h], eax
    mov mov eax, dword ptr [edi + 0B4h]
    mov mov dword ptr [esi + 0B4h], eax
    mov mov eax, dword ptr [edi + 0B8h]
    mov mov dword ptr [esi + 0B8h], eax
    push push 19
    xor xor eax, eax
    pop pop ecx
    lea lea edi, [esi + 40]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 12]
    test test eax, eax
    jl sub_1008B84B
    push push 0
    mov mov ecx, esi
    call sub_10086C51
    test test eax, eax
    jl sub_1008B858
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 12
FUN_1008b5d4 ENDP
END
