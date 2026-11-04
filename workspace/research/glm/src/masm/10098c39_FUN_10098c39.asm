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
.CODE
FUN_10098c39 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 124
    push ebx
    push esi
    push 000020400h
    mov esi, ecx
    push 3
    push dword ptr [esi + 000000088h]
    call sub_10089F93
    xor ebx, ebx
    cmp eax, ebx
    jl L6
    push 000000401h
    push 6
    push dword ptr [esi + 00000008Ch]
    mov ecx, esi
    call sub_10089FB1
    cmp eax, ebx
    jl L6
    push 000004401h
    push 10
    push dword ptr [esi + 000000090h]
    mov ecx, esi
    call sub_10089FCD
    cmp eax, ebx
    jl L6
    mov eax, dword ptr [esi + 0000000C8h]
    push edi
    mov edi, 0FFFF0000h
    and eax, edi
    cmp eax, 046580000h
    je L0
    cmp eax, 054580000h
    jne L1
L0:
    push 000031028h
    push 2
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_1008A005
    cmp eax, ebx
    jl L5
L1:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, edi
    cmp eax, 0FFFE0000h
    je L2
    push 000000200h
    push 16
    push dword ptr [esi + 000000080h]
    mov ecx, esi
    call sub_1008A030
    cmp eax, ebx
    jl L5
L2:
    push 000042000h
    push 32
    push dword ptr [esi + 000000084h]
    mov ecx, esi
    call sub_1008A04C
    cmp eax, ebx
    jl L5
    push 000040000h
    push 000002020h
    push dword ptr [esi + 0000000B4h]
    mov ecx, esi
    call sub_1008A06B
    cmp eax, ebx
    jl L5
    push 000002000h
    push 000040020h
    push dword ptr [esi + 0000000B8h]
    mov ecx, esi
    call sub_1008A08A
    cmp eax, ebx
    jl L5
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, edi
    cmp eax, edi
    je L3
    push ebx
    push 000000080h
    push dword ptr [esi + 000000094h]
    mov ecx, esi
    call sub_1008A0AD
    cmp eax, ebx
    jl L5
L3:
    mov eax, dword ptr [esi + 48]
    cmp eax, ebx
    je L9
    push eax
    push dword ptr [esi + 00000008Ch]
    lea eax, [ebp - 124]
    push eax
    mov ecx, esi
    call sub_10092AE2
    cmp eax, ebx
    jl L5
    push ebx
    lea eax, [ebp - 124]
    push eax
    mov ecx, esi
    call sub_100931BD
    test eax, eax
    mov ecx, esi
    jge L7
    push 000030028h
    push 2
    push dword ptr [esi + 000000088h]
    call sub_1008A0F2
    mov edi, eax
    cmp edi, ebx
    jge L8
L4:
    lea eax, [ebp - 124]
    mov ecx, esi
    push eax
    call sub_1008A7FA
    mov eax, edi
L5:
    pop edi
L6:
    pop esi
    pop ebx
    leave
    ret
L7:
    push 1
    lea eax, [ebp - 124]
    push eax
    call sub_100931F8
L8:
    lea eax, [ebp - 124]
    push eax
    mov ecx, esi
    call sub_1008A817
    cmp eax, ebx
    jl L5
L9:
    push dword ptr [esi + 44]
    lea eax, [ebp - 124]
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    push eax
    call sub_10092B50
    mov edi, eax
    cmp edi, ebx
    jl L4
    push 1
    lea eax, [ebp - 124]
    push eax
    mov ecx, esi
    call sub_1009322E
    mov edi, eax
    cmp edi, ebx
    jl L4
    lea eax, [ebp - 124]
    push eax
    mov ecx, esi
    call sub_1008A853
    mov edi, eax
    cmp edi, ebx
    jl L4
    push dword ptr [esi + 52]
    lea eax, [ebp - 124]
    push dword ptr [esi + 000000090h]
    mov ecx, esi
    push eax
    call sub_10092B8E
    mov edi, eax
    cmp edi, ebx
    jl L4
    push 1
    lea eax, [ebp - 124]
    push eax
    mov ecx, esi
    call sub_10093270
    mov edi, eax
    cmp edi, ebx
    jl L4
    lea eax, [ebp - 124]
    push eax
    mov ecx, esi
    call sub_1008A899
    mov edi, eax
    cmp edi, ebx
    jl L4
    test byte ptr [esi + 0000000CCh], 4
    jne L17
    mov ecx, esi
    mov dword ptr [ebp - 16], ebx
    call sub_1008B159
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L17
L10:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    cmp ecx, 010000000h
    jne L16
    xor ecx, ecx
    cmp dword ptr [eax + 12], ebx
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 4], ebx
    jbe L15
L11:
    mov edi, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + 16]
    mov ebx, dword ptr [eax + 8]
    shl edi, 2
    mov edx, dword ptr [ecx + edi]
    mov ecx, dword ptr [esi + 20]
    mov dword ptr [ebp - 24], edi
    mov edi, dword ptr [edi + ebx]
    mov dword ptr [ebp - 20], edx
    mov edx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [ecx + edi*4]
    mov ebx, dword ptr [edx + 4]
    cmp ebx, dword ptr [ecx + 4]
    jne L13
    mov ebx, dword ptr [edx + 8]
    cmp ebx, dword ptr [ecx + 8]
    jne L13
    mov ebx, dword ptr [edx + 12]
    cmp ebx, dword ptr [ecx + 12]
    jne L13
    mov ebx, dword ptr [edx + 16]
    cmp ebx, dword ptr [ecx + 16]
    jne L13
    mov ebx, dword ptr [edx + 20]
    cmp ebx, dword ptr [ecx + 20]
    jne L13
    mov ebx, dword ptr [edx + 24]
    cmp ebx, dword ptr [ecx + 24]
    jne L13
    xor ebx, ebx
    cmp dword ptr [edx + 60], ebx
    jne L13
    cmp dword ptr [ecx + 60], ebx
    jne L13
    or ecx, 0FFFFFFFFh
    cmp edi, ecx
    je L12
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edi*4]
    mov ecx, dword ptr [ecx + 48]
L12:
    mov dword ptr [edx + 48], ecx
    mov ecx, dword ptr [ebp - 12]
    jmp L14
L13:
    mov ecx, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + 16]
    mov edi, dword ptr [ebp - 20]
    mov dword ptr [edx + ecx*4], edi
    mov edx, dword ptr [eax + 8]
    mov edi, dword ptr [ebp - 24]
    mov edi, dword ptr [edx + edi]
    mov dword ptr [edx + ecx*4], edi
    inc ecx
    mov dword ptr [ebp - 12], ecx
    xor ebx, ebx
L14:
    inc dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 4]
    cmp edx, dword ptr [eax + 12]
    jb L11
L15:
    cmp ecx, dword ptr [eax + 12]
    je L16
    mov edi, ecx
    and edi, 0000FFFFFh
    mov edx, ecx
    or edi, 010000000h
    neg edx
    sbb edx, edx
    and edx, edi
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 12], ecx
    mov dword ptr [ebp - 16], 1
L16:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 12]
    jb L10
    cmp dword ptr [ebp - 16], ebx
    je L17
    mov ecx, esi
    call sub_1008B293
    cmp eax, ebx
    jl L5
    call sub_1008D8A1
    cmp eax, ebx
    jl L5
    mov ecx, esi
    call sub_10087239
    cmp eax, ebx
    jl L5
L17:
    xor eax, eax
    jmp L5
FUN_10098c39 ENDP
END
