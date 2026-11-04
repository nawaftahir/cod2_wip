.686
.MODEL FLAT, C
EXTRN sub_10087269:PROC
EXTRN sub_1008AF26:PROC
EXTRN sub_1008AF78:PROC
EXTRN sub_1008C003:PROC
EXTRN sub_1008C0F9:PROC
EXTRN sub_1008C265:PROC
EXTRN sub_1008D8ED:PROC
EXTRN sub_10094BBE:PROC
EXTRN sub_100BA8F5:PROC
EXTRN sub_100BA993:PROC
EXTRN sub_100BA9D1:PROC
EXTRN sub_100BAA89:PROC
EXTRN sub_100BAB07:PROC
EXTRN sub_100BAB42:PROC
EXTRN sub_100BAC18:PROC
EXTRN sub_100BB297:PROC
EXTRN sub_100BB6E6:PROC
EXTRN sub_100BB99C:PROC
EXTRN sub_100BBAEA:PROC
EXTRN sub_100BC118:PROC
EXTRN sub_100BC3F8:PROC
EXTRN sub_100BC4D4:PROC
EXTRN sub_100BEA7D:PROC
EXTRN sub_100BEE3D:PROC
EXTRN sub_100BF1A6:PROC
EXTRN sub_100C0999:PROC
EXTRN sub_100C0EE8:PROC
EXTRN sub_100C1253:PROC
EXTRN sub_100C1550:PROC
EXTRN sub_100C162F:PROC
EXTRN sub_100C1C83:PROC
EXTRN sub_100C1D3C:PROC
EXTRN sub_100C61E0:PROC
EXTRN sub_100C63E5:PROC
EXTRN sub_100C797F:PROC
.CODE
FUN_100b2d68 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov esi, ecx
    xor edi, edi
    test byte ptr [esi + 0000000CCh], 4
    je L3
    call sub_1008AF26
    cmp dword ptr [esi + 12], edi
    jbe L2
L0:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], edi
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    jne L1
    mov ecx, esi
    call sub_100BB99C
L1:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L0
L2:
    mov ecx, esi
    call sub_1008AF78
    test byte ptr [esi + 0000000CCh], 4
    jne L42
L3:
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L9
L4:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 010100000h
    je L6
    cmp eax, 020000000h
    je L5
    cmp eax, 020100000h
    je L5
    cmp eax, 030000000h
    je L5
    xor edi, edi
    inc edi
    jmp L8
L5:
    mov ecx, esi
    call sub_100BC3F8
    mov ecx, esi
    mov edi, eax
    call sub_100BA8F5
    jmp L7
L6:
    push 1
    mov ecx, esi
    call sub_100C61E0
    mov edi, eax
L7:
    test edi, edi
    jl L46
L8:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L4
    jmp L10
L9:
    mov edi, dword ptr [ebp - 4]
L10:
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L14
L11:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 030000000h
    je L12
    xor edi, edi
    inc edi
    jmp L13
L12:
    test edi, edi
    jl L46
    xor eax, eax
    push eax
    push eax
    push eax
    mov ecx, esi
    call sub_100BBAEA
    mov edi, eax
    test edi, edi
    jl L46
    xor eax, eax
    push eax
    push eax
    push eax
    mov ecx, esi
    call sub_100BC118
    mov edi, eax
    test edi, edi
    jl L46
L13:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L11
L14:
    mov ecx, esi
    call sub_1008C003
    mov edi, eax
    test edi, edi
    jl L46
    mov ecx, esi
    call sub_100BA993
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L18
L15:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 020000000h
    je L16
    cmp eax, 070B00000h
    jne L17
L16:
    mov ecx, esi
    call sub_100BC4D4
    mov ecx, esi
    mov edi, eax
    call sub_100BA9D1
    test edi, edi
    jl L46
L17:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L15
L18:
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L25
L19:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 010500000h
    je L22
    cmp eax, 010F00000h
    je L21
    cmp eax, 020400000h
    je L20
    cmp eax, 030000000h
    jne L24
    mov ecx, esi
    call sub_100C1550
    mov edi, eax
    test edi, edi
    je L24
    mov ecx, esi
    call sub_100C162F
    jmp L23
L20:
    mov ecx, esi
    call sub_100C0EE8
    mov edi, eax
    test edi, edi
    je L24
    push 1
    mov ecx, esi
    call sub_100C63E5
    jmp L23
L21:
    mov ecx, esi
    call sub_100BEA7D
    jmp L23
L22:
    mov ecx, esi
    call sub_100BB6E6
L23:
    mov edi, eax
    test edi, edi
    jl L46
L24:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L19
L25:
    mov ecx, esi
    call sub_1008C0F9
    mov edi, eax
    test edi, edi
    jl L46
    mov ecx, esi
    call sub_100BAA89
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L33
L26:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 020500000h
    je L30
    cmp eax, 050000000h
    je L29
    cmp eax, 070300000h
    je L28
    cmp eax, 073500000h
    je L27
    cmp eax, 073600000h
    jne L32
L27:
    mov ecx, esi
    call sub_100BEE3D
    jmp L31
L28:
    push 0
    mov ecx, esi
    call sub_100C1C83
    jmp L31
L29:
    mov ecx, esi
    call sub_100C1253
    jmp L31
L30:
    mov ecx, esi
    call sub_100C0999
L31:
    mov edi, eax
    test edi, edi
    jl L46
L32:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L26
L33:
    mov ecx, esi
    call sub_100BAB07
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    jbe L36
L34:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], edi
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 070300000h
    jne L35
    mov ecx, esi
    call sub_100C797F
L35:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L34
L36:
    mov ecx, esi
    call sub_100BAB42
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L42
L37:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 070300000h
    je L39
    cmp eax, 073500000h
    je L38
    cmp eax, 073600000h
    je L38
    cmp eax, 073700000h
    je L38
    cmp eax, 073800000h
    jne L41
L38:
    mov ecx, esi
    call sub_100BF1A6
    jmp L40
L39:
    push 0
    mov ecx, esi
    call sub_100C1D3C
L40:
    mov edi, eax
    test edi, edi
    jl L46
L41:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L37
L42:
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L45
L43:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 050300000h
    jne L44
    mov ecx, esi
    call sub_100BB297
    mov edi, eax
    test edi, edi
    jl L46
L44:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L43
L45:
    mov ecx, esi
    call sub_1008C265
    mov edi, eax
    test edi, edi
    jl L46
    mov ecx, esi
    call sub_10094BBE
    mov edi, eax
    test edi, edi
    jl L46
    mov ecx, esi
    call sub_10087269
    mov edi, eax
    test edi, edi
    jl L46
    mov ecx, esi
    call sub_1008D8ED
    mov edi, eax
    test edi, edi
    jl L46
    mov ecx, esi
    call sub_100BAC18
    xor edi, edi
L46:
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b2d68 ENDP
END
