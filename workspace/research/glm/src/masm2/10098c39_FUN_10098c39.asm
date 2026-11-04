.686
.MODEL FLAT, C
EXTRN sub_10087239:PROC
EXTRN sub_10089F93:PROC
EXTRN sub_10089FB1:PROC
EXTRN sub_10089FCD:PROC
EXTRN sub_1008A005:PROC
EXTRN sub_1008A030:PROC
EXTRN sub_1008A04C:PROC
EXTRN sub_1008A06B:PROC
EXTRN sub_1008A08A:PROC
EXTRN sub_1008A0AD:PROC
EXTRN sub_1008A0F2:PROC
EXTRN sub_1008A7FA:PROC
EXTRN sub_1008A817:PROC
EXTRN sub_1008A853:PROC
EXTRN sub_1008A899:PROC
EXTRN sub_1008B159:PROC
EXTRN sub_1008B293:PROC
EXTRN sub_1008D8A1:PROC
EXTRN sub_10092AE2:PROC
EXTRN sub_10092B50:PROC
EXTRN sub_10092B8E:PROC
EXTRN sub_100931BD:PROC
EXTRN sub_100931F8:PROC
EXTRN sub_1009322E:PROC
EXTRN sub_10093270:PROC
EXTRN sub_10098FDE:PROC
EXTRN sub_10098FF3:PROC
EXTRN sub_10099140:PROC
EXTRN sub_1009914D:PROC
EXTRN sub_1009915C:PROC
EXTRN sub_10099163:PROC
EXTRN sub_100991E7:PROC
EXTRN sub_100991EB:PROC
EXTRN sub_100991EF:PROC
EXTRN sub_100991F6:PROC
EXTRN sub_100991F7:PROC
EXTRN sub_100991FF:PROC
EXTRN sub_10099204:PROC
EXTRN sub_10099207:PROC
EXTRN sub_1009920F:PROC
EXTRN sub_10099210:PROC
EXTRN sub_10099216:PROC
EXTRN sub_1009921A:PROC
EXTRN sub_1009921B:PROC
EXTRN sub_10099226:PROC
EXTRN sub_10099251:PROC
EXTRN sub_100992BC:PROC
EXTRN sub_10099334:PROC
.CODE
FUN_10098c39 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 124
    push push ebx
    push push esi
    push push 020400h
    mov mov esi, ecx
    push push 3
    push push dword ptr [esi + 088h]
    call sub_10089F93
    xor xor ebx, ebx
    cmp cmp eax, ebx
    jl L3
    push push 0401h
    push push 6
    push push dword ptr [esi + 08Ch]
    mov mov ecx, esi
    call sub_10089FB1
    cmp cmp eax, ebx
    jl L4
    push push 04401h
    push push 10
    push push dword ptr [esi + 090h]
    mov mov ecx, esi
    call sub_10089FCD
    cmp cmp eax, ebx
    jl L5
    mov mov eax, dword ptr [esi + 0C8h]
    push push edi
    mov mov edi, 0FFFF0000h
    and and eax, edi
    cmp cmp eax, 046580000h
    je L0
    cmp cmp eax, 054580000h
    jne L1
    push push 031028h
    push push 2
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    call sub_1008A005
    cmp cmp eax, ebx
    jl L6
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, edi
    cmp cmp eax, 0FFFE0000h
    je L2
    push push 0200h
    push push 16
    push push dword ptr [esi + 080h]
    mov mov ecx, esi
    call sub_1008A030
    cmp cmp eax, ebx
    jl L7
    push push 042000h
    push push 32
    push push dword ptr [esi + 084h]
    mov mov ecx, esi
    call sub_1008A04C
    cmp cmp eax, ebx
    jl L9
    push push 040000h
    push push 02020h
    push push dword ptr [esi + 0B4h]
    mov mov ecx, esi
L0:
    call sub_1008A06B
    cmp cmp eax, ebx
    jl L10
    push push 02000h
    push push 040020h
    push push dword ptr [esi + 0B8h]
    mov mov ecx, esi
    call sub_1008A08A
    cmp cmp eax, ebx
    jl L11
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, edi
    cmp cmp eax, edi
    je L8
    push push ebx
    push push 080h
    push push dword ptr [esi + 094h]
    mov mov ecx, esi
    call sub_1008A0AD
    cmp cmp eax, ebx
    jl L12
    mov mov eax, dword ptr [esi + 48]
    cmp cmp eax, ebx
    je L14
    push push eax
    push push dword ptr [esi + 08Ch]
    lea lea eax, [ebp - 124]
    push push eax
    mov mov ecx, esi
    call sub_10092AE2
    cmp cmp eax, ebx
    jl L13
    push push ebx
    lea lea eax, [ebp - 124]
    push push eax
    mov mov ecx, esi
    call sub_100931BD
    test test eax, eax
    mov mov ecx, esi
    jge L15
    push push 030028h
    push push 2
    push push dword ptr [esi + 088h]
    call sub_1008A0F2
    mov mov edi, eax
    cmp cmp edi, ebx
    jge L16
    lea lea eax, [ebp - 124]
    mov mov ecx, esi
    push push eax
    call sub_1008A7FA
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    push push 1
    lea lea eax, [ebp - 124]
    push push eax
    call sub_100931F8
    lea lea eax, [ebp - 124]
    push push eax
    mov mov ecx, esi
    call sub_1008A817
    cmp cmp eax, ebx
    jl L17
    push push dword ptr [esi + 44]
    lea lea eax, [ebp - 124]
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    push push eax
    call sub_10092B50
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L18
    push push 1
    lea lea eax, [ebp - 124]
    push push eax
    mov mov ecx, esi
    call sub_1009322E
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L19
    lea lea eax, [ebp - 124]
    push push eax
    mov mov ecx, esi
    call sub_1008A853
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L20
    push push dword ptr [esi + 52]
    lea lea eax, [ebp - 124]
    push push dword ptr [esi + 090h]
    mov mov ecx, esi
    push push eax
    call sub_10092B8E
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L21
    push push 1
    lea lea eax, [ebp - 124]
    push push eax
    mov mov ecx, esi
    call sub_10093270
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10098FDE
    lea lea eax, [ebp - 124]
    push push eax
    mov mov ecx, esi
L6:
    call sub_1008A899
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10098FF3
    test test byte ptr [esi + 0CCh], 4
    jne sub_10099210
    mov mov ecx, esi
    mov mov dword ptr [ebp - 16], ebx
    call sub_1008B159
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_10099226
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 010000000h
    jne sub_10099204
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 12], ebx
    mov mov dword ptr [ebp - 12], ecx
    mov mov dword ptr [ebp - 4], ebx
    jbe sub_100991EB
    mov mov edi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + 16]
L10:
    mov mov ebx, dword ptr [eax + 8]
    shl shl edi, 2
    mov mov edx, dword ptr [ecx + edi]
    mov mov ecx, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 24], edi
    mov mov edi, dword ptr [edi + ebx]
    mov mov dword ptr [ebp - 20], edx
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [ecx + edi*4]
L11:
    mov mov ebx, dword ptr [edx + 4]
    cmp cmp ebx, dword ptr [ecx + 4]
    jne sub_100991E7
    mov mov ebx, dword ptr [edx + 8]
    cmp cmp ebx, dword ptr [ecx + 8]
    jne sub_100991EF
    mov mov ebx, dword ptr [edx + 12]
    cmp cmp ebx, dword ptr [ecx + 12]
    jne sub_100991F7
    mov mov ebx, dword ptr [edx + 16]
    cmp cmp ebx, dword ptr [ecx + 16]
    jne sub_100991FF
    mov mov ebx, dword ptr [edx + 20]
L12:
    cmp cmp ebx, dword ptr [ecx + 20]
    jne sub_10099207
    mov mov ebx, dword ptr [edx + 24]
    cmp cmp ebx, dword ptr [ecx + 24]
    jne sub_1009920F
    xor xor ebx, ebx
    cmp cmp dword ptr [edx + 60], ebx
    jne sub_10099216
    cmp cmp dword ptr [ecx + 60], ebx
    jne sub_1009921B
    or or ecx, -1
    cmp cmp edi, ecx
    je sub_1009921A
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + edi*4]
L14:
    mov mov ecx, dword ptr [ecx + 48]
    mov mov dword ptr [edx + 48], ecx
    mov mov ecx, dword ptr [ebp - 12]
    jmp sub_10099251
    mov mov ecx, dword ptr [ebp - 12]
L15:
    mov mov edx, dword ptr [eax + 16]
    mov mov edi, dword ptr [ebp - 20]
    mov mov dword ptr [edx + ecx*4], edi
    mov mov edx, dword ptr [eax + 8]
    mov mov edi, dword ptr [ebp - 24]
    mov mov edi, dword ptr [edx + edi]
    mov mov dword ptr [edx + ecx*4], edi
    inc inc ecx
    mov mov dword ptr [ebp - 12], ecx
    xor xor ebx, ebx
    inc inc dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp - 4]
    cmp cmp edx, dword ptr [eax + 12]
    jb sub_100991EB
    cmp cmp ecx, dword ptr [eax + 12]
    je sub_100992BC
    mov mov edi, ecx
    and and edi, 0FFFFFh
    mov mov edx, ecx
    or or edi, 010000000h
L17:
    neg neg edx
    sbb sbb edx, edx
    and and edx, edi
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [ebp - 16], 1
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_100991F6
    cmp cmp dword ptr [ebp - 16], ebx
    je sub_10099334
    mov mov ecx, esi
    call sub_1008B293
    cmp cmp eax, ebx
    jl sub_10099140
    call sub_1008D8A1
    cmp cmp eax, ebx
    jl sub_1009914D
    mov mov ecx, esi
    call sub_10087239
    cmp cmp eax, ebx
    jl sub_1009915C
    xor xor eax, eax
    jmp sub_10099163
FUN_10098c39 ENDP
END
