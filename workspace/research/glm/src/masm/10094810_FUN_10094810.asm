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
EXTRN sub_100F788D:PROC
EXTRN sub_100F7A23:PROC
.CODE
FUN_10094810 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    push edi
    xor edi, edi
    mov esi, ecx
    mov dword ptr [ebp - 20], edi
    call sub_1008A990
    mov eax, dword ptr [esi + 8]
    shl eax, 2
    push eax
    call sub_100F788D
    mov ebx, eax
    cmp ebx, edi
    pop ecx
    mov dword ptr [ebp - 16], ebx
    jne L0
    mov eax, 08007000Eh
    jmp L18
L0:
    xor eax, eax
    cmp dword ptr [esi + 8], eax
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 12], eax
    jbe L3
L1:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [ecx + 48], eax
    mov ecx, dword ptr [ecx + 4]
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 1
    je L2
    test ch, 12
    jne L2
    mov dword ptr [ebx + edi*4], eax
    inc edi
L2:
    inc eax
    cmp eax, dword ptr [esi + 8]
    jb L1
    mov dword ptr [ebp - 8], edi
L3:
    push esi
    push edi
    push ebx
    push 0100864E9h
    call sub_1008699D
    xor eax, eax
    inc eax
    cmp edi, eax
    mov dword ptr [ebp - 4], eax
    jbe L8
    jmp L5
L4:
    mov ebx, dword ptr [ebp - 16]
L5:
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 20]
    shl eax, 2
    lea edi, [eax + ebx]
    lea ebx, [eax + ebx - 4]
    mov eax, dword ptr [ebx]
    mov eax, dword ptr [ecx + eax*4]
    push esi
    push dword ptr [edi]
    push dword ptr [eax + 48]
    call sub_10086595
    test eax, eax
    jne L6
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi + 116]
    mov dword ptr [eax + 4], ecx
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 48]
    mov dword ptr [eax + 48], ecx
    mov dword ptr [ebp - 12], 1
L6:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 8]
    jb L4
    cmp dword ptr [ebp - 12], 0
    je L7
    mov ecx, esi
    call sub_1008B014
    mov dword ptr [ebp - 20], 1
L7:
    mov ebx, dword ptr [ebp - 16]
L8:
    xor eax, eax
    xor edi, edi
    cmp dword ptr [esi + 8], eax
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 12], eax
    jbe L12
L9:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [ecx + 48], eax
    mov ecx, dword ptr [ecx + 4]
    cmp dword ptr [esi + 116], ecx
    je L11
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 4], 64
    jne L10
    cmp dword ptr [esi + 0000000DCh], 0
    je L11
L10:
    mov dword ptr [ebx + edi*4], eax
    inc edi
L11:
    inc eax
    cmp eax, dword ptr [esi + 8]
    jb L9
    mov dword ptr [ebp - 8], edi
L12:
    push esi
    push edi
    push ebx
    push 010086538h
    call sub_10086A69
    test edi, edi
    je L13
    mov eax, dword ptr [ebx]
    mov dword ptr [ebp - 16], eax
L13:
    xor eax, eax
    inc eax
    cmp edi, eax
    mov dword ptr [ebp - 4], eax
    jbe L17
L14:
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [ebx + eax*4]
    push esi
    push edi
    push dword ptr [ebp - 16]
    call sub_100866A4
    test eax, eax
    jne L15
    push edi
    push dword ptr [ebp - 16]
    mov ecx, esi
    call sub_1008DA80
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi + 116]
    mov dword ptr [eax + 4], ecx
    mov dword ptr [ebp - 12], 1
    jmp L16
L15:
    mov dword ptr [ebp - 16], edi
L16:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 8]
    jb L14
    cmp dword ptr [ebp - 12], 0
    je L17
    mov ecx, esi
    call sub_1008B0D5
    mov dword ptr [ebp - 20], 1
L17:
    push ebx
    call sub_100F7A23
    xor eax, eax
    cmp dword ptr [ebp - 20], eax
    pop ecx
    sete al
L18:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10094810 ENDP
END
