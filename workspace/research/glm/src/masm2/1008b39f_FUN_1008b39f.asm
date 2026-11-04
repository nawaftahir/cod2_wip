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
EXTRN sub_1008B5EA:PROC
EXTRN sub_1008B7AC:PROC
EXTRN sub_1008B7D7:PROC
EXTRN sub_1008B7EC:PROC
EXTRN sub_1008B7F9:PROC
.CODE
FUN_1008b39f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 12]
    push push esi
    mov mov esi, ecx
    xor xor ecx, ecx
    cmp cmp eax, ecx
    jne L0
    mov mov eax, 080004005h
    jmp sub_1008B5EA
    mov mov edx, dword ptr [ebp + 8]
    push push ebx
    push push edi
    push push 4
    pop pop edi
    push push edi
    mov mov dword ptr [esi + 0C4h], eax
    mov mov eax, dword ptr [ebp + 16]
    or or ebx, -1
    push push ebx
    push push ecx
    mov mov dword ptr [esi + 0C8h], eax
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [esi + 0D4h], ecx
    mov mov dword ptr [esi + 0D8h], ecx
    mov mov dword ptr [esi + 0DCh], ecx
    push push 010110474h
    mov mov ecx, esi
    mov mov dword ptr [esi + 0C0h], edx
    mov mov dword ptr [esi + 0CCh], eax
    call sub_10086145
    push push edi
    push push ebx
    push push 0311h
    push push 01010E8C0h
    mov mov ecx, esi
    mov mov dword ptr [esi + 116], eax
    call sub_1008615B
    push push edi
    push push ebx
    push push 0251h
    push push 01010E914h
    mov mov ecx, esi
    mov mov dword ptr [esi + 120], eax
    call sub_10086171
    push push edi
    push push ebx
    push push 81
    push push 01010E91Ch
    mov mov ecx, esi
    mov mov dword ptr [esi + 124], eax
    call sub_10086184
    push push edi
    push push ebx
    push push 98
    push push 01010E8B8h
    mov mov ecx, esi
    mov mov dword ptr [esi + 080h], eax
    call sub_1008619A
    push push edi
    push push ebx
    push push 3
    push push 01010E918h
    mov mov ecx, esi
    mov mov dword ptr [esi + 084h], eax
    call sub_100861B0
    push push edi
    push push ebx
    push push 6
    push push 010194F18h
    mov mov ecx, esi
    mov mov dword ptr [esi + 088h], eax
    call sub_100861C6
    push push edi
    push push ebx
    push push 10
    push push 01010E8BCh
    mov mov ecx, esi
    mov mov dword ptr [esi + 08Ch], eax
    call sub_100861DC
    push push edi
    push push ebx
    push push 02D1h
    push push 01010E8DCh
    mov mov ecx, esi
    mov mov dword ptr [esi + 090h], eax
    call sub_100861F5
    push push edi
    push push ebx
    mov mov dword ptr [esi + 094h], eax
    push push 01003h
    push push 01010E8ECh
    mov mov ecx, esi
    call sub_1008620E
    push push edi
    push push ebx
    push push 02251h
    push push 01010E914h
    mov mov ecx, esi
    mov mov dword ptr [esi + 098h], eax
    call sub_10086227
    push push edi
    push push ebx
    push push 0400Ah
    push push 01010E8BCh
    mov mov ecx, esi
    mov mov dword ptr [esi + 09Ch], eax
    call sub_10086240
    push push edi
    push push ebx
    push push 0C00Ah
    push push 010110470h
    mov mov ecx, esi
    mov mov dword ptr [esi + 0A0h], eax
    call sub_10086259
    push push edi
    push push 0
    push push 010042h
    push push 01011046Ch
    mov mov ecx, esi
    mov mov dword ptr [esi + 0A4h], eax
    call sub_10086273
    push push edi
    push push ebx
    push push 020003h
    push push 010110468h
    mov mov ecx, esi
    mov mov dword ptr [esi + 0A8h], eax
    call sub_1008628C
    push push edi
    push push ebx
    push push 040211h
    push push 01010E8ECh
    mov mov ecx, esi
    mov mov dword ptr [esi + 0ACh], eax
    call sub_100862A5
    push push edi
    push push ebx
    push push 02062h
    push push 010110464h
    mov mov ecx, esi
    mov mov dword ptr [esi + 0B0h], eax
    call sub_100862BE
    push push edi
    push push ebx
    push push 040062h
    push push 010110460h
    mov mov ecx, esi
    mov mov dword ptr [esi + 0B4h], eax
    call sub_100862D7
    cmp cmp dword ptr [esi + 4], 18
    mov mov dword ptr [esi + 0B8h], eax
    je sub_1008B7AC
    mov mov eax, 08007000Eh
    jmp sub_1008B7D7
    push push 19
    xor xor eax, eax
    pop pop ecx
    lea lea edi, [esi + 40]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 12]
    test test eax, eax
    jl sub_1008B7EC
    push push 0
    mov mov ecx, esi
    call sub_10086D3C
    test test eax, eax
    jl sub_1008B7F9
    xor xor eax, eax
    pop pop edi
    pop pop ebx
    pop pop esi
    pop pop ebp
    ret ret 16
FUN_1008b39f ENDP
END
