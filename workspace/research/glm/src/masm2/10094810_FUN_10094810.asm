.686
.MODEL FLAT, C
EXTRN sub_10086595:PROC
EXTRN sub_100866A4:PROC
EXTRN sub_1008699D:PROC
EXTRN sub_10086A69:PROC
EXTRN sub_1008A990:PROC
EXTRN sub_1008B014:PROC
EXTRN sub_1008B0D5:PROC
EXTRN sub_1008DA80:PROC
EXTRN sub_100949F0:PROC
EXTRN sub_10094A0E:PROC
EXTRN sub_10094A52:PROC
EXTRN sub_10094A55:PROC
EXTRN sub_10094A5D:PROC
EXTRN sub_10094A65:PROC
EXTRN sub_10094A72:PROC
EXTRN sub_10094AAF:PROC
EXTRN sub_10094B10:PROC
EXTRN sub_10094B16:PROC
EXTRN sub_10094B24:PROC
EXTRN sub_10094B3F:PROC
EXTRN sub_10094B72:PROC
EXTRN sub_100F788D:PROC
EXTRN sub_100F7A23:PROC
.CODE
FUN_10094810 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    push push esi
    push push edi
    xor xor edi, edi
    mov mov esi, ecx
    mov mov dword ptr [ebp - 20], edi
    call sub_1008A990
    mov mov eax, dword ptr [esi + 8]
    shl shl eax, 2
    push push eax
    call sub_100F788D
    mov mov ebx, eax
    cmp cmp ebx, edi
    pop pop ecx
    mov mov dword ptr [ebp - 16], ebx
    jne L0
    mov mov eax, 08007000Eh
    jmp sub_10094A0E
    xor xor eax, eax
    cmp cmp dword ptr [esi + 8], eax
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 12], eax
    jbe L2
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [ecx + 48], eax
    mov mov ecx, dword ptr [ecx + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test ch, 1
    je L3
    test test ch, 12
    jne L4
    mov mov dword ptr [ebx + edi*4], eax
    inc inc edi
    inc inc eax
    cmp cmp eax, dword ptr [esi + 8]
    jb L1
    mov mov dword ptr [ebp - 8], edi
    push push esi
    push push edi
    push push ebx
    push push 0100864E9h
    call sub_1008699D
    xor xor eax, eax
    inc inc eax
    cmp cmp edi, eax
    mov mov dword ptr [ebp - 4], eax
    jbe L7
    jmp L5
    mov mov ebx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 20]
    shl shl eax, 2
    lea lea edi, [eax + ebx]
    lea lea ebx, [eax + ebx - 4]
    mov mov eax, dword ptr [ebx]
    mov mov eax, dword ptr [ecx + eax*4]
    push push esi
    push push dword ptr [edi]
    push push dword ptr [eax + 48]
    call sub_10086595
    test test eax, eax
    jne L8
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [esi + 116]
    mov mov dword ptr [eax + 4], ecx
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 48]
    mov mov dword ptr [eax + 48], ecx
    mov mov dword ptr [ebp - 12], 1
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 8]
    jb L6
    cmp cmp dword ptr [ebp - 12], 0
    je sub_100949F0
    mov mov ecx, esi
    call sub_1008B014
    mov mov dword ptr [ebp - 20], 1
    mov mov ebx, dword ptr [ebp - 16]
    xor xor eax, eax
    xor xor edi, edi
    cmp cmp dword ptr [esi + 8], eax
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 12], eax
    jbe sub_10094A55
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [ecx + 48], eax
    mov mov ecx, dword ptr [ecx + 4]
L5:
    cmp cmp dword ptr [esi + 116], ecx
    je sub_10094A5D
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 4], 64
    jne sub_10094A65
    cmp cmp dword ptr [esi + 0DCh], 0
    je sub_10094A72
    mov mov dword ptr [ebx + edi*4], eax
    inc inc edi
    inc inc eax
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_10094A52
    mov mov dword ptr [ebp - 8], edi
    push push esi
    push push edi
    push push ebx
    push push 010086538h
    call sub_10086A69
    test test edi, edi
    je sub_10094AAF
    mov mov eax, dword ptr [ebx]
    mov mov dword ptr [ebp - 16], eax
    xor xor eax, eax
    inc inc eax
    cmp cmp edi, eax
    mov mov dword ptr [ebp - 4], eax
    jbe sub_10094B24
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebx + eax*4]
    push push esi
    push push edi
    push push dword ptr [ebp - 16]
    call sub_100866A4
L6:
    test test eax, eax
    jne sub_10094B16
    push push edi
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    call sub_1008DA80
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 20]
L7:
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [esi + 116]
    mov mov dword ptr [eax + 4], ecx
    mov mov dword ptr [ebp - 12], 1
    jmp sub_10094B3F
    mov mov dword ptr [ebp - 16], edi
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 8]
    jb sub_10094B10
    cmp cmp dword ptr [ebp - 12], 0
    je sub_10094B72
    mov mov ecx, esi
    call sub_1008B0D5
    mov mov dword ptr [ebp - 20], 1
    push push ebx
    call sub_100F7A23
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 20], eax
    pop pop ecx
    sete sete al
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10094810 ENDP
END
