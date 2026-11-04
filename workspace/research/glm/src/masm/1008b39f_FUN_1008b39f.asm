.686
.MODEL FLAT, C
EXTRN sub_10086145:PROC
EXTRN sub_1008615B:PROC
EXTRN sub_10086171:PROC
EXTRN sub_10086184:PROC
EXTRN sub_1008619A:PROC
EXTRN sub_100861B0:PROC
EXTRN sub_100861C6:PROC
EXTRN sub_100861DC:PROC
EXTRN sub_100861F5:PROC
EXTRN sub_1008620E:PROC
EXTRN sub_10086227:PROC
EXTRN sub_10086240:PROC
EXTRN sub_10086259:PROC
EXTRN sub_10086273:PROC
EXTRN sub_1008628C:PROC
EXTRN sub_100862A5:PROC
EXTRN sub_100862BE:PROC
EXTRN sub_100862D7:PROC
EXTRN sub_10086D3C:PROC
.CODE
FUN_1008b39f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 12]
    push esi
    mov esi, ecx
    xor ecx, ecx
    cmp eax, ecx
    jne L0
    mov eax, 080004005h
    jmp L3
L0:
    mov edx, dword ptr [ebp + 8]
    push ebx
    push edi
    push 4
    pop edi
    push edi
    mov dword ptr [esi + 0000000C4h], eax
    mov eax, dword ptr [ebp + 16]
    or ebx, 0FFFFFFFFh
    push ebx
    push ecx
    mov dword ptr [esi + 0000000C8h], eax
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [esi + 0000000D4h], ecx
    mov dword ptr [esi + 0000000D8h], ecx
    mov dword ptr [esi + 0000000DCh], ecx
    push 010110474h
    mov ecx, esi
    mov dword ptr [esi + 0000000C0h], edx
    mov dword ptr [esi + 0000000CCh], eax
    call sub_10086145
    push edi
    push ebx
    push 000000311h
    push 01010E8C0h
    mov ecx, esi
    mov dword ptr [esi + 116], eax
    call sub_1008615B
    push edi
    push ebx
    push 000000251h
    push 01010E914h
    mov ecx, esi
    mov dword ptr [esi + 120], eax
    call sub_10086171
    push edi
    push ebx
    push 81
    push 01010E91Ch
    mov ecx, esi
    mov dword ptr [esi + 124], eax
    call sub_10086184
    push edi
    push ebx
    push 98
    push 01010E8B8h
    mov ecx, esi
    mov dword ptr [esi + 000000080h], eax
    call sub_1008619A
    push edi
    push ebx
    push 3
    push 01010E918h
    mov ecx, esi
    mov dword ptr [esi + 000000084h], eax
    call sub_100861B0
    push edi
    push ebx
    push 6
    push 010194F18h
    mov ecx, esi
    mov dword ptr [esi + 000000088h], eax
    call sub_100861C6
    push edi
    push ebx
    push 10
    push 01010E8BCh
    mov ecx, esi
    mov dword ptr [esi + 00000008Ch], eax
    call sub_100861DC
    push edi
    push ebx
    push 0000002D1h
    push 01010E8DCh
    mov ecx, esi
    mov dword ptr [esi + 000000090h], eax
    call sub_100861F5
    push edi
    push ebx
    mov dword ptr [esi + 000000094h], eax
    push 000001003h
    push 01010E8ECh
    mov ecx, esi
    call sub_1008620E
    push edi
    push ebx
    push 000002251h
    push 01010E914h
    mov ecx, esi
    mov dword ptr [esi + 000000098h], eax
    call sub_10086227
    push edi
    push ebx
    push 00000400Ah
    push 01010E8BCh
    mov ecx, esi
    mov dword ptr [esi + 00000009Ch], eax
    call sub_10086240
    push edi
    push ebx
    push 00000C00Ah
    push 010110470h
    mov ecx, esi
    mov dword ptr [esi + 0000000A0h], eax
    call sub_10086259
    push edi
    push 0
    push 000010042h
    push 01011046Ch
    mov ecx, esi
    mov dword ptr [esi + 0000000A4h], eax
    call sub_10086273
    push edi
    push ebx
    push 000020003h
    push 010110468h
    mov ecx, esi
    mov dword ptr [esi + 0000000A8h], eax
    call sub_1008628C
    push edi
    push ebx
    push 000040211h
    push 01010E8ECh
    mov ecx, esi
    mov dword ptr [esi + 0000000ACh], eax
    call sub_100862A5
    push edi
    push ebx
    push 000002062h
    push 010110464h
    mov ecx, esi
    mov dword ptr [esi + 0000000B0h], eax
    call sub_100862BE
    push edi
    push ebx
    push 000040062h
    push 010110460h
    mov ecx, esi
    mov dword ptr [esi + 0000000B4h], eax
    call sub_100862D7
    cmp dword ptr [esi + 4], 18
    mov dword ptr [esi + 0000000B8h], eax
    je L1
    mov eax, 08007000Eh
    jmp L2
L1:
    push 19
    xor eax, eax
    pop ecx
    lea edi, [esi + 40]
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0xc]
    test eax, eax
    jl L2
    push 0
    mov ecx, esi
    call sub_10086D3C
    test eax, eax
    jl L2
    xor eax, eax
L2:
    pop edi
    pop ebx
L3:
    pop esi
    pop ebp
    ret 16
FUN_1008b39f ENDP
END
