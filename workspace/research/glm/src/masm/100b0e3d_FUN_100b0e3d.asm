.686
.MODEL FLAT, C
EXTRN sub_1006C70E:PROC
EXTRN sub_1006CD10:PROC
EXTRN sub_1006CD1E:PROC
EXTRN sub_1008543A:PROC
EXTRN sub_10085539:PROC
EXTRN sub_100855A5:PROC
EXTRN sub_10085850:PROC
EXTRN sub_100858C7:PROC
EXTRN sub_100858CA:PROC
EXTRN sub_100859C9:PROC
EXTRN sub_10085A3F:PROC
EXTRN sub_10085B9D:PROC
EXTRN sub_10085CE0:PROC
EXTRN sub_10085D60:PROC
EXTRN sub_10085DFF:PROC
EXTRN sub_10086260:PROC
EXTRN sub_10086290:PROC
EXTRN sub_100862B8:PROC
EXTRN sub_100862ED:PROC
EXTRN sub_100866AD:PROC
EXTRN sub_1008676E:PROC
EXTRN sub_10086828:PROC
EXTRN sub_10086861:PROC
EXTRN sub_100868C9:PROC
EXTRN sub_1008B952:PROC
EXTRN sub_1008B97D:PROC
EXTRN sub_100A81AD:PROC
EXTRN sub_100A8229:PROC
EXTRN sub_100A8326:PROC
EXTRN sub_100ACCB6:PROC
EXTRN sub_100ACD4A:PROC
.CODE
FUN_100b0e3d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000104h
    push ebx
    push esi
    xor edx, edx
    mov esi, ecx
    xor ecx, ecx
    cmp dword ptr [esi + 8], edx
    push edi
    mov dword ptr [ebp - 32], edx
    mov dword ptr [ebp - 24], edx
    jbe L2
L0:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edi, dword ptr [eax + 4]
    mov dword ptr [eax + 48], edx
    cmp edi, dword ptr [esi + 000000088h]
    jne L1
    or dword ptr [eax + 12], 0FFFFFFFFh
L1:
    inc ecx
    cmp ecx, dword ptr [esi + 8]
    jb L0
L2:
    mov ecx, dword ptr [esi + 76]
    jmp L6
L3:
    mov eax, dword ptr [esi + 000000230h]
    mov eax, dword ptr [eax + ecx*4]
    cmp eax, edx
    je L5
    cmp dword ptr [eax], edx
    je L5
    cmp dword ptr [eax + 12], edx
    jbe L5
L4:
    mov edi, dword ptr [eax + 16]
    mov edi, dword ptr [edi + edx*4]
    mov ebx, dword ptr [esi + 20]
    mov edi, dword ptr [ebx + edi*4]
    inc edx
    mov dword ptr [edi + 72], ecx
    cmp edx, dword ptr [eax + 12]
    jb L4
    xor edx, edx
L5:
    inc ecx
L6:
    cmp ecx, dword ptr [esi + 000000224h]
    jb L3
    mov ecx, dword ptr [esi + 000000224h]
    mov eax, dword ptr [esi + 76]
    cmp eax, ecx
    mov dword ptr [ebp - 44], ecx
    mov dword ptr [ebp - 36], eax
    jae L63
L7:
    mov eax, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [ebp - 36]
    mov eax, dword ptr [eax + ecx*4]
    test eax, eax
    mov dword ptr [ebp - 16], eax
    je L62
    cmp dword ptr [eax], 0
    je L62
    push 116
    call sub_100858CA
    test eax, eax
    je L8
    mov ecx, eax
    call sub_1008543A
    mov dword ptr [ebp - 24], eax
    jmp L9
L8:
    and dword ptr [ebp - 24], 0
L9:
    cmp dword ptr [ebp - 24], 0
    je L68
    push dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp - 24]
    call sub_10085B9D
    test eax, eax
    mov dword ptr [ebp - 20], eax
    jl L73
    cmp dword ptr [esi + 000000224h], 000000200h
    jae L68
    mov ebx, dword ptr [ebp - 16]
    mov edx, dword ptr [ebx]
    and dword ptr [ebp - 48], 0
    and dword ptr [ebp - 60], 0
    and edx, 0FFF00000h
    cmp edx, 050000000h
    jne L13
    cmp dword ptr [ebx + 12], 1
    jne L13
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [eax]
    mov edi, dword ptr [esi + 20]
    mov ecx, dword ptr [edi + ecx*4]
    cmp dword ptr [ecx + 16], 3
    mov dword ptr [ebp - 28], ecx
    jne L13
    lea ecx, [ebp - 68]
    push ecx
    lea ecx, [ebp - 56]
    push ecx
    lea ecx, [ebp - 40]
    push ecx
    push 1
    push eax
    push dword ptr [ebp - 44]
    mov ecx, esi
    push dword ptr [ebp - 36]
    push dword ptr [esi + 000000230h]
    call sub_100ACCB6
    cmp dword ptr [ebp - 68], 0
    je L16
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 3
    push 0
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_100862B8
    mov ebx, eax
    cmp ebx, -1
    je L68
    mov eax, dword ptr [esi + 20]
    mov edi, dword ptr [eax + ebx*4]
    push dword ptr [ebp - 28]
    mov ecx, edi
    call sub_10085DFF
    mov eax, dword ptr [esi + 000000088h]
    and dword ptr [edi + 60], 0
    push 116
    mov dword ptr [edi + 4], eax
    mov dword ptr [edi + 16], 3
    call sub_100859C9
    test eax, eax
    je L10
    mov ecx, eax
    call sub_10085539
    mov edi, eax
    jmp L11
L10:
    xor edi, edi
L11:
    test edi, edi
    je L68
    push 0
    push 1
    push 1
    push 010000001h
    mov ecx, edi
    call sub_10085A3F
    test eax, eax
    mov dword ptr [ebp - 20], eax
    jl L64
    push dword ptr [ebp - 16]
    mov ecx, edi
    call sub_100855A5
    test eax, eax
    mov dword ptr [ebp - 20], eax
    jl L64
    mov ecx, dword ptr [edi + 16]
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edi + 8]
    mov dword ptr [eax], ebx
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [eax + 16]
    mov dword ptr [ecx], ebx
    mov ecx, dword ptr [esi + 000000224h]
    mov edx, dword ptr [esi + 000000230h]
    mov dword ptr [edx + ecx*4], eax
    inc dword ptr [esi + 000000224h]
    push eax
    mov ecx, esi
    mov dword ptr [ebp - 40], eax
    call sub_10086260
    test eax, eax
    jl L68
    mov eax, dword ptr [esi + 000000224h]
    cmp eax, 000000200h
    jae L68
    mov ecx, dword ptr [esi + 000000230h]
    mov dword ptr [ecx + eax*4], edi
    inc dword ptr [esi + 000000224h]
    push edi
    mov ecx, esi
    call sub_10086290
    test eax, eax
    jl L68
L12:
    mov ebx, dword ptr [ebp - 16]
    jmp L18
L13:
    cmp edx, 010000000h
    jne L16
    push ebx
    mov ecx, esi
    call sub_100A81AD
    test eax, eax
    je L16
    mov ecx, dword ptr [ebx + 12]
    test ecx, ecx
    mov dword ptr [ebp - 48], 1
    jbe L17
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + 16]
L14:
    mov edi, dword ptr [eax]
    mov edi, dword ptr [edx + edi*4]
    cmp dword ptr [edi + 60], 0
    je L15
    and dword ptr [ebp - 48], 0
L15:
    add eax, 4
    dec ecx
    jne L14
    cmp dword ptr [ebp - 48], 0
    jne L17
L16:
    push dword ptr [ebp - 24]
    mov ecx, esi
    call sub_100862ED
    test eax, eax
    jl L68
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [esi + 000000224h]
    mov edx, dword ptr [esi + 000000230h]
    mov dword ptr [edx + ecx*4], eax
    inc dword ptr [esi + 000000224h]
    mov dword ptr [ebp - 40], eax
    jmp L12
L17:
    mov ecx, dword ptr [ebp - 24]
    push 1
    call sub_1006C70E
    and dword ptr [ebp - 40], 0
L18:
    and dword ptr [ebp - 24], 0
    push ebx
    mov ecx, esi
    call sub_100A8229
    test eax, eax
    je L60
    and dword ptr [ebp - 28], 0
    and dword ptr [ebp - 12], 0
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 84]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebx + 12]
    test eax, eax
    jbe L21
    mov edx, dword ptr [esi + 20]
L19:
    mov edi, dword ptr [ebp - 12]
    mov eax, dword ptr [ebx + 16]
    shl edi, 2
    mov ecx, dword ptr [edi + eax]
    mov eax, dword ptr [edx + ecx*4]
    cmp dword ptr [eax + 48], 0
    je L20
    mov eax, dword ptr [eax + 16]
    shl eax, 2
    mov dword ptr [ebp + eax - 84], ecx
    mov ecx, dword ptr [ebx + 8]
    mov ecx, dword ptr [edi + ecx]
    mov dword ptr [ebp + eax - 000000084h], ecx
    mov dword ptr [ebp - 28], 1
L20:
    mov eax, dword ptr [ebx + 12]
    inc dword ptr [ebp - 12]
    cmp dword ptr [ebp - 12], eax
    jb L19
L21:
    lea ecx, [ebp - 12]
    push ecx
    lea ecx, [ebp - 000000104h]
    push ecx
    push eax
    push dword ptr [ebx + 16]
    xor edi, edi
    push dword ptr [ebp - 44]
    mov ecx, esi
    push dword ptr [ebp - 36]
    mov dword ptr [ebp - 12], edi
    push dword ptr [esi + 000000230h]
    call sub_100ACD4A
    cmp dword ptr [ebp - 28], edi
    je L57
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 100]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor eax, eax
    cmp dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 20], eax
    jbe L31
L22:
    mov ecx, dword ptr [ebp + eax*4 - 000000104h]
    mov eax, dword ptr [esi + 20]
    mov edi, dword ptr [eax + ecx*4]
    cmp dword ptr [edi + 56], -1
    mov dword ptr [ebp - 8], ecx
    je L23
    mov edi, dword ptr [edi + 56]
    mov dword ptr [ebp - 8], edi
    mov edi, dword ptr [eax + edi*4]
L23:
    mov eax, dword ptr [edi + 72]
    cmp eax, dword ptr [ebp - 44]
    jae L24
    cmp eax, dword ptr [ebp - 36]
    jae L30
L24:
    cmp eax, -1
    je L30
    mov ecx, dword ptr [esi + 000000230h]
    shl eax, 2
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [eax + ecx]
    push eax
    mov ecx, esi
    mov dword ptr [ebp - 28], eax
    call sub_100A8326
    test eax, eax
    je L30
    mov ecx, dword ptr [ebp - 28]
    mov eax, dword ptr [ecx]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    jne L28
    cmp dword ptr [edi + 56], -1
    jne L28
    xor eax, eax
    cmp dword ptr [ecx + 12], eax
    jbe L28
    mov ecx, dword ptr [ecx + 16]
    jmp L26
L25:
    mov ecx, dword ptr [ebp - 32]
L26:
    mov edx, dword ptr [ebp - 8]
    cmp edx, dword ptr [ecx]
    je L27
    mov edx, dword ptr [ebp - 4]
    add ecx, 4
    mov dword ptr [ebp - 32], ecx
    mov ecx, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [edx + ecx]
    inc eax
    cmp eax, dword ptr [ecx + 12]
    jb L25
    jmp L28
L27:
    mov ecx, dword ptr [ebp - 28]
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [edi + 16]
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [ebp + edx*4 - 116], eax
    mov dword ptr [ebp - 60], 1
L28:
    mov eax, dword ptr [edi + 16]
    lea eax, [ebp + eax*4 - 100]
    mov ecx, dword ptr [eax]
    cmp ecx, -1
    jne L29
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [eax], ecx
    jmp L30
L29:
    cmp ecx, dword ptr [ebp - 8]
    jne L65
L30:
    mov eax, dword ptr [ebp - 20]
    inc eax
    cmp eax, dword ptr [ebp - 12]
    mov dword ptr [ebp - 20], eax
    jb L22
L31:
    xor edi, edi
    xor eax, eax
    mov dword ptr [ebp - 12], edi
    or edx, 0FFFFFFFFh
L32:
    mov ecx, dword ptr [ebp + eax - 100]
    cmp ecx, edx
    je L33
    cmp dword ptr [ebp + eax - 84], edx
    jne L65
    cmp ecx, edx
    jne L34
L33:
    cmp dword ptr [ebp + eax - 84], edx
    je L35
L34:
    inc edi
    mov dword ptr [ebp - 12], edi
L35:
    add eax, 4
    cmp eax, 16
    jb L32
    push 116
    call sub_10085CE0
    test eax, eax
    je L36
    mov ecx, eax
    call sub_10085850
    jmp L37
L36:
    xor eax, eax
L37:
    test eax, eax
    mov dword ptr [ebp - 32], eax
    je L66
    push 0
    push edi
    lea ecx, [edi + edi*2]
    push ecx
    and edi, 0000FFFFFh
    or edi, 070100000h
    push edi
    mov ecx, eax
    call sub_10085D60
    test eax, eax
    mov dword ptr [ebp - 20], eax
    jl L71
    push dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp - 32]
    call sub_100858C7
    test eax, eax
    mov dword ptr [ebp - 20], eax
    jl L71
    mov eax, dword ptr [ebp - 12]
    and dword ptr [ebp - 4], 0
    shl eax, 2
    and dword ptr [ebp - 28], 0
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp - 28]
L38:
    mov ebx, dword ptr [ebp + eax - 84]
    cmp ebx, -1
    je L43
    cmp dword ptr [ebp - 48], 0
    mov ecx, dword ptr [ebp - 32]
    mov ecx, dword ptr [ecx + 16]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], ebx
    jne L41
    mov eax, dword ptr [esi + 20]
    fldz
    mov edi, dword ptr [eax + ebx*4]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [edi + 16]
    mov ecx, esi
    push 0
    push dword ptr [esi + 000000088h]
    call sub_100866AD
    cmp eax, -1
    je L68
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi + 60]
    mov dword ptr [ecx + 60], edx
    and dword ptr [edi + 60], 0
    mov ecx, dword ptr [esi + 000000224h]
    mov dword ptr [edi + 72], ecx
    mov ecx, dword ptr [ebp - 40]
    xor edi, edi
    cmp dword ptr [ecx + 12], edi
    jbe L42
L39:
    mov edx, dword ptr [ecx + 16]
    lea edx, [edx + edi*4]
    cmp dword ptr [edx], ebx
    jne L40
    mov dword ptr [edx], eax
L40:
    inc edi
    cmp edi, dword ptr [ecx + 12]
    jb L39
    jmp L42
L41:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + ebx*4]
    mov edx, dword ptr [esi + 000000224h]
    mov eax, dword ptr [ebp + eax - 000000084h]
    mov dword ptr [ecx + 72], edx
L42:
    mov ecx, dword ptr [ebp - 32]
    mov edx, dword ptr [ecx + 8]
    mov edi, dword ptr [ebp - 8]
    mov dword ptr [edi + edx], eax
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 64], eax
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [esi + 000000444h]
    mov dword ptr [eax + edx*4], ecx
    jmp L49
L43:
    mov ebx, dword ptr [ebp + eax - 100]
    cmp ebx, -1
    je L50
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 32]
    mov ecx, dword ptr [ecx + 16]
    shl edx, 2
    cmp dword ptr [ebp - 60], 0
    mov dword ptr [ebp - 52], edx
    mov dword ptr [edx + ecx], ebx
    jne L47
    mov eax, dword ptr [esi + 20]
    fldz
    mov edi, dword ptr [eax + ebx*4]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [edi + 16]
    mov ecx, esi
    push 0
    push dword ptr [esi + 000000088h]
    call sub_1008676E
    cmp eax, -1
    je L68
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi + 60]
    mov dword ptr [ecx + 60], edx
    mov ecx, dword ptr [edi + 72]
    and dword ptr [edi + 60], 0
    cmp ecx, -1
    je L67
    cmp ecx, dword ptr [esi + 000000224h]
    je L67
    mov edx, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [edx + ecx*4]
    xor edx, edx
    cmp dword ptr [ecx + 12], edx
    mov dword ptr [ebp - 56], ecx
    jbe L46
L44:
    mov ecx, dword ptr [ecx + 16]
    lea ecx, [ecx + edx*4]
    cmp dword ptr [ecx], ebx
    jne L45
    mov dword ptr [ecx], eax
L45:
    mov ecx, dword ptr [ebp - 56]
    inc edx
    cmp edx, dword ptr [ecx + 12]
    jb L44
L46:
    mov ecx, dword ptr [esi + 000000224h]
    mov edx, dword ptr [ebp - 52]
    mov dword ptr [edi + 72], ecx
    jmp L48
L47:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + ebx*4]
    mov edi, dword ptr [esi + 000000224h]
    mov eax, dword ptr [ebp + eax - 116]
    mov dword ptr [ecx + 72], edi
L48:
    mov ecx, dword ptr [ebp - 32]
    mov edi, dword ptr [ecx + 8]
    mov ebx, dword ptr [esi + 000000440h]
    mov dword ptr [edx + edi], ebx
    mov edx, dword ptr [ebp - 12]
    mov edi, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + 8]
    lea edx, [edi + edx*2]
    mov dword ptr [ebp - 52], eax
    mov dword ptr [ecx + edx*4], eax
L49:
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    mov eax, dword ptr [ebp - 28]
L50:
    add eax, 4
    cmp eax, 16
    mov dword ptr [ebp - 28], eax
    jb L38
    mov eax, dword ptr [ebp - 12]
    and dword ptr [ebp - 4], 0
    mov ebx, dword ptr [ebp - 32]
    shl eax, 2
    and dword ptr [ebp - 16], 0
    mov dword ptr [ebp - 8], eax
L51:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [ebp + eax - 84]
    cmp eax, -1
    je L53
    mov ecx, dword ptr [esi + 20]
    fldz
    mov edi, dword ptr [ecx + eax*4]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [edi + 16]
    mov ecx, esi
    push 0
    push dword ptr [esi + 000000088h]
    call sub_10086861
    cmp eax, -1
    je L68
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ebp - 52]
    cmp edx, -1
    mov dword ptr [ecx + 56], edx
    mov edi, dword ptr [edi + 60]
    mov dword ptr [ecx + 60], edi
    je L52
    mov edi, dword ptr [esi + 20]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], edx
L52:
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 12]
    lea ecx, [edx + ecx*2]
    mov edx, dword ptr [ebx + 8]
    mov dword ptr [edx + ecx*4], eax
    jmp L55
L53:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [ebp + eax - 100]
    cmp eax, -1
    je L56
    mov ecx, dword ptr [esi + 20]
    fldz
    mov edi, dword ptr [ecx + eax*4]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [edi + 16]
    mov ecx, esi
    push 0
    push dword ptr [esi + 000000088h]
    call sub_100868C9
    cmp eax, -1
    je L68
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ebp - 64]
    cmp edx, -1
    mov dword ptr [ecx + 56], edx
    mov edi, dword ptr [edi + 60]
    mov dword ptr [ecx + 60], edi
    je L54
    mov edi, dword ptr [esi + 20]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], edx
L54:
    mov ecx, dword ptr [ebx + 8]
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [edx + ecx], eax
L55:
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
L56:
    add dword ptr [ebp - 16], 4
    cmp dword ptr [ebp - 16], 16
    jb L51
    mov eax, dword ptr [esi + 000000224h]
    cmp eax, 000000200h
    jae L68
    mov ecx, dword ptr [esi + 000000230h]
    mov dword ptr [ecx + eax*4], ebx
    inc dword ptr [esi + 000000224h]
    push ebx
    mov ecx, esi
    call sub_10086828
    test eax, eax
    jl L68
    and dword ptr [ebp - 32], 0
    jmp L60
L57:
    cmp dword ptr [ebp - 12], edi
    jbe L60
L58:
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ebp + edi*4 - 000000104h]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [eax + 56]
    cmp edx, -1
    je L59
    mov eax, dword ptr [ecx + edx*4]
L59:
    inc edi
    cmp edi, dword ptr [ebp - 12]
    mov dword ptr [eax + 48], 1
    jb L58
L60:
    mov eax, dword ptr [ebp - 40]
    xor ecx, ecx
    cmp eax, ecx
    je L62
    cmp dword ptr [eax + 12], ecx
    jbe L62
L61:
    mov edi, dword ptr [eax + 16]
    mov edi, dword ptr [edi + ecx*4]
    mov edx, dword ptr [esi + 000000224h]
    mov ebx, dword ptr [esi + 20]
    mov edi, dword ptr [ebx + edi*4]
    dec edx
    inc ecx
    mov dword ptr [edi + 72], edx
    cmp ecx, dword ptr [eax + 12]
    jb L61
L62:
    inc dword ptr [ebp - 36]
    mov eax, dword ptr [ebp - 36]
    cmp eax, dword ptr [ebp - 44]
    jb L7
    xor edx, edx
L63:
    mov eax, dword ptr [esi + 76]
    jmp L70
L64:
    mov ecx, edi
    jmp L72
L65:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 0000000FFh
    push eax
    push 0101178C8h
    push 0000011B9h
    push dword ptr [ebx + 60]
    push esi
    call sub_1008B952
    add esp, 20
    mov dword ptr [ebp - 20], 080004005h
    jmp L74
L66:
    mov dword ptr [ebp - 20], 08007000Eh
    jmp L74
L67:
    mov eax, dword ptr [ebp - 16]
    push 0101178A0h
    push 0000012CAh
    push dword ptr [eax + 60]
    push esi
    call sub_1008B97D
    add esp, 16
    jmp L71
L68:
    mov dword ptr [ebp - 20], 08007000Eh
    jmp L71
L69:
    mov ecx, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [ecx], edx
    inc eax
L70:
    cmp eax, dword ptr [ebp - 44]
    jb L69
    mov dword ptr [ebp - 20], edx
L71:
    mov ecx, dword ptr [ebp - 32]
    test ecx, ecx
    je L73
L72:
    push 1
    call sub_1006CD10
L73:
    mov ecx, dword ptr [ebp - 24]
    test ecx, ecx
    je L74
    push 1
    call sub_1006CD1E
L74:
    mov eax, dword ptr [ebp - 20]
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b0e3d ENDP
END
