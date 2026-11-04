.686
.MODEL FLAT, C
EXTRN sub_100863B2:PROC
EXTRN sub_10086C51:PROC
.CODE
FUN_1008b5d4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov esi, ecx
    call sub_100863B2
    test eax, eax
    jl L0
    mov eax, dword ptr [edi + 0000000C0h]
    mov dword ptr [esi + 0000000C0h], eax
    mov eax, dword ptr [edi + 0000000C4h]
    and dword ptr [esi + 0000000D4h], 0
    and dword ptr [esi + 0000000D8h], 0
    and dword ptr [esi + 0000000DCh], 0
    mov dword ptr [esi + 0000000C4h], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [esi + 0000000C8h], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [esi + 0000000CCh], eax
    mov eax, dword ptr [edi + 116]
    mov dword ptr [esi + 116], eax
    mov eax, dword ptr [edi + 120]
    mov dword ptr [esi + 120], eax
    mov eax, dword ptr [edi + 124]
    mov dword ptr [esi + 124], eax
    mov eax, dword ptr [edi + 000000080h]
    mov dword ptr [esi + 000000080h], eax
    mov eax, dword ptr [edi + 000000084h]
    mov dword ptr [esi + 000000084h], eax
    mov eax, dword ptr [edi + 000000088h]
    mov dword ptr [esi + 000000088h], eax
    mov eax, dword ptr [edi + 00000008Ch]
    mov dword ptr [esi + 00000008Ch], eax
    mov eax, dword ptr [edi + 000000090h]
    mov dword ptr [esi + 000000090h], eax
    mov eax, dword ptr [edi + 000000094h]
    mov dword ptr [esi + 000000094h], eax
    mov eax, dword ptr [edi + 000000098h]
    mov dword ptr [esi + 000000098h], eax
    mov eax, dword ptr [edi + 00000009Ch]
    mov dword ptr [esi + 00000009Ch], eax
    mov eax, dword ptr [edi + 0000000A0h]
    mov dword ptr [esi + 0000000A0h], eax
    mov eax, dword ptr [edi + 0000000A4h]
    mov dword ptr [esi + 0000000A4h], eax
    mov eax, dword ptr [edi + 0000000A8h]
    mov dword ptr [esi + 0000000A8h], eax
    mov eax, dword ptr [edi + 0000000ACh]
    mov dword ptr [esi + 0000000ACh], eax
    mov eax, dword ptr [edi + 0000000B0h]
    mov dword ptr [esi + 0000000B0h], eax
    mov eax, dword ptr [edi + 0000000B4h]
    mov dword ptr [esi + 0000000B4h], eax
    mov eax, dword ptr [edi + 0000000B8h]
    mov dword ptr [esi + 0000000B8h], eax
    push 19
    xor eax, eax
    pop ecx
    lea edi, [esi + 40]
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0xc]
    test eax, eax
    jl L0
    push 0
    mov ecx, esi
    call sub_10086C51
    test eax, eax
    jl L0
    xor eax, eax
L0:
    pop edi
    pop esi
    pop ebp
    ret 12
FUN_1008b5d4 ENDP
END
