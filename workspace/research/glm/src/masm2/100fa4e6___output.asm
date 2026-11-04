.686
.MODEL FLAT, C
EXTRN sub_100F8C7C:PROC
EXTRN sub_100FACD2:PROC
EXTRN sub_100FACDF:PROC
EXTRN sub_100FACE0:PROC
EXTRN sub_100FACE4:PROC
EXTRN sub_100FACF8:PROC
EXTRN sub_100FAD04:PROC
EXTRN sub_100FAD1C:PROC
EXTRN sub_100FAD29:PROC
EXTRN sub_100FAD40:PROC
EXTRN sub_100FAD44:PROC
EXTRN sub_100FAD49:PROC
EXTRN sub_100FAD5F:PROC
EXTRN sub_100FAD60:PROC
EXTRN sub_100FAD68:PROC
EXTRN sub_100FAD71:PROC
EXTRN sub_100FAD73:PROC
EXTRN sub_100FAD7A:PROC
EXTRN sub_100FAD7D:PROC
EXTRN sub_100FAD83:PROC
EXTRN sub_100FAD8C:PROC
EXTRN sub_100FADA3:PROC
EXTRN sub_100FADAC:PROC
EXTRN sub_100FADB3:PROC
EXTRN sub_100FADB8:PROC
EXTRN sub_100FADCB:PROC
EXTRN sub_100FADCD:PROC
EXTRN sub_100FADD6:PROC
EXTRN sub_100FADDC:PROC
EXTRN sub_100FADE5:PROC
EXTRN sub_100FADF6:PROC
EXTRN sub_100FADFF:PROC
EXTRN sub_100FAE08:PROC
EXTRN sub_100FAE0E:PROC
EXTRN sub_100FAE14:PROC
EXTRN sub_100FAE1F:PROC
EXTRN sub_100FAE25:PROC
EXTRN sub_100FAE2C:PROC
EXTRN sub_100FAE30:PROC
EXTRN sub_100FAE35:PROC
EXTRN sub_100FAE3E:PROC
EXTRN sub_100FAE47:PROC
EXTRN sub_100FAE4A:PROC
EXTRN sub_100FAE64:PROC
EXTRN sub_100FAE6C:PROC
EXTRN sub_100FAE7F:PROC
EXTRN sub_100FAE87:PROC
EXTRN sub_100FAE8F:PROC
EXTRN sub_100FAE97:PROC
EXTRN sub_100FAE9F:PROC
EXTRN sub_100FAEA7:PROC
EXTRN sub_100FAEAF:PROC
EXTRN sub_100FAEEE:PROC
EXTRN sub_100FAEF5:PROC
EXTRN sub_100FAEFC:PROC
EXTRN sub_100FAF00:PROC
EXTRN sub_100FAF26:PROC
EXTRN sub_100FAF2D:PROC
EXTRN sub_100FAF30:PROC
EXTRN sub_100FAF3A:PROC
EXTRN sub_100FAF3F:PROC
EXTRN sub_100FAF43:PROC
EXTRN sub_100FAF49:PROC
EXTRN sub_100FAF6F:PROC
EXTRN sub_100FAF78:PROC
EXTRN sub_100FB02D:PROC
EXTRN sub_100FB03B:PROC
EXTRN sub_100FB042:PROC
EXTRN sub_100FB07B:PROC
EXTRN sub_100FB08D:PROC
EXTRN sub_100FB08E:PROC
EXTRN sub_100FB097:PROC
EXTRN sub_100FB098:PROC
EXTRN sub_100FB09F:PROC
EXTRN sub_100FB0A4:PROC
EXTRN sub_100FB0BC:PROC
EXTRN sub_100FB0CE:PROC
EXTRN sub_100FB0D3:PROC
EXTRN sub_100FB0D7:PROC
EXTRN sub_100FB0DD:PROC
EXTRN sub_100FB0FC:PROC
EXTRN sub_100FB113:PROC
EXTRN sub_100FB12D:PROC
EXTRN sub_100FB13B:PROC
EXTRN sub_100FB14E:PROC
EXTRN sub_100FB178:PROC
EXTRN sub_100FB192:PROC
EXTRN sub_100FB1A2:PROC
EXTRN sub_100FB1B9:PROC
EXTRN sub_100FB202:PROC
EXTRN sub_100FB208:PROC
EXTRN sub_100FB213:PROC
EXTRN sub_100FB23D:PROC
EXTRN sub_100FB254:PROC
EXTRN sub_100FB26A:PROC
EXTRN sub_100FB26E:PROC
EXTRN sub_100FB279:PROC
EXTRN sub_100FB285:PROC
EXTRN sub_100FB2C0:PROC
EXTRN sub_100FB31C:PROC
EXTRN sub_100FB321:PROC
EXTRN sub_100FB32B:PROC
EXTRN sub_100FB386:PROC
EXTRN sub_100FB38C:PROC
EXTRN sub_100FB393:PROC
EXTRN sub_100FB3C1:PROC
EXTRN sub_100FB3DF:PROC
EXTRN sub_100FB40E:PROC
EXTRN sub_100FB43B:PROC
EXTRN sub_100FC89F:PROC
EXTRN sub_1010151F:PROC
EXTRN sub_10106ED5:PROC
EXTRN sub_10107219:PROC
EXTRN sub_101072DC:PROC
EXTRN EXTRN fp_101A4FB0:DWORD:DWORD
EXTRN EXTRN fp_101A4FB4:DWORD:DWORD
EXTRN EXTRN fp_101A4FBC:DWORD:DWORD
EXTRN EXTRN g_101A4890:DWORD:DWORD
EXTRN EXTRN g_101A4894:DWORD:DWORD
EXTRN EXTRN g_101A5090:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
__output PROC
    push push ebp
    lea lea ebp, [esp - 01D4h]
    sub sub esp, 0254h
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp + 01D0h], eax
    xor xor eax, eax
    mov mov dword ptr [ebp - 72], eax
    mov mov dword ptr [ebp - 76], eax
    mov mov dword ptr [ebp - 96], eax
    mov mov eax, dword ptr [ebp + 01E0h]
    push push ebx
    mov mov bl, byte ptr [eax]
    xor xor ecx, ecx
    test test bl, bl
    je sub_100FACE0
    push push esi
    push push edi
    mov mov edi, eax
    jmp L0
    mov mov ecx, dword ptr [ebp - 112]
    inc inc edi
    cmp cmp dword ptr [ebp - 76], 0
    mov mov dword ptr [ebp + 01E0h], edi
    jl sub_100FACF8
    cmp cmp bl, 32
    jl L1
    cmp cmp bl, 120
    jg L2
    movsx movsx eax, bl
    movsx movsx eax, byte ptr [eax + 01017C6E8h]
    and and eax, 15
    jmp L3
    xor xor eax, eax
    movsx movsx eax, byte ptr [ecx + eax*8 + 01017C708h]
    push push 7
    sar sar eax, 4
    pop pop ecx
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 112], eax
    ja sub_100FAD1C
    jmp jmp dword ptr [eax*4 + 0100FACC0h]
    xor xor eax, eax
    or or dword ptr [ebp - 64], -1
    mov mov dword ptr [ebp - 108], eax
    mov mov dword ptr [ebp - 100], eax
    mov mov dword ptr [ebp - 88], eax
    mov mov dword ptr [ebp - 84], eax
    mov mov dword ptr [ebp - 60], eax
    mov mov dword ptr [ebp - 92], eax
    jmp sub_100FAD40
    movsx movsx eax, bl
    sub sub eax, 32
    je L8
    sub sub eax, 3
    je L7
    sub sub eax, 8
    je L6
    dec dec eax
    dec dec eax
    je L4
    sub sub eax, 3
    jne sub_100FAD5F
    or or dword ptr [ebp - 60], 8
    jmp sub_100FAD68
    or or dword ptr [ebp - 60], 4
    jmp sub_100FAD71
    or or dword ptr [ebp - 60], 1
    jmp sub_100FAD7A
    or or byte ptr [ebp - 60], 080h
    jmp sub_100FAD83
    or or dword ptr [ebp - 60], 2
    jmp sub_100FAD8C
    cmp cmp bl, 42
    jne L11
    add add dword ptr [ebp + 01E4h], 4
    mov mov eax, dword ptr [ebp + 01E4h]
    mov mov eax, dword ptr [eax - 4]
    test test eax, eax
    mov mov dword ptr [ebp - 88], eax
    jge sub_100FADAC
    or or dword ptr [ebp - 60], 4
    neg neg dword ptr [ebp - 88]
    jmp sub_100FADB8
    mov mov eax, dword ptr [ebp - 88]
    movsx movsx ecx, bl
    lea lea eax, [eax + eax*4]
    lea lea eax, [ecx + eax*2 - 48]
    mov mov dword ptr [ebp - 88], eax
    jmp sub_100FADCD
    and and dword ptr [ebp - 64], 0
    jmp sub_100FADD6
    cmp cmp bl, 42
    jne L12
    add add dword ptr [ebp + 01E4h], 4
    mov mov eax, dword ptr [ebp + 01E4h]
    mov mov eax, dword ptr [eax - 4]
    test test eax, eax
    mov mov dword ptr [ebp - 64], eax
    jge sub_100FADF6
    or or dword ptr [ebp - 64], -1
    jmp sub_100FADFF
    mov mov eax, dword ptr [ebp - 64]
    movsx movsx ecx, bl
    lea lea eax, [eax + eax*4]
    lea lea eax, [ecx + eax*2 - 48]
    mov mov dword ptr [ebp - 64], eax
    jmp sub_100FAE14
    cmp cmp bl, 73
    je L15
    cmp cmp bl, 104
    je L14
    cmp cmp bl, 108
    je L13
    cmp cmp bl, 119
    jne sub_100FAE2C
L6:
    or or byte ptr [ebp - 59], 8
L7:
    jmp sub_100FAE35
    or or dword ptr [ebp - 60], 16
    jmp sub_100FAE3E
    or or dword ptr [ebp - 60], 32
    jmp sub_100FAE47
    mov mov al, byte ptr [edi]
    cmp cmp al, 54
    jne L16
    cmp cmp byte ptr [edi + 1], 52
    jne L17
    inc inc edi
    inc inc edi
    or or byte ptr [ebp - 59], 080h
    mov mov dword ptr [ebp + 01E0h], edi
    jmp sub_100FAE64
    cmp cmp al, 51
    jne L18
    cmp cmp byte ptr [edi + 1], 50
    jne L19
    inc inc edi
    inc inc edi
    and and byte ptr [ebp - 59], 127
    mov mov dword ptr [ebp + 01E0h], edi
    jmp sub_100FAE7F
    cmp cmp al, 100
    je sub_100FAE87
    cmp cmp al, 105
    je sub_100FAE8F
    cmp cmp al, 111
    je sub_100FAE97
    cmp cmp al, 117
    je sub_100FAE9F
    cmp cmp al, 120
    je sub_100FAEA7
    cmp cmp al, 88
    je sub_100FAEAF
    and and dword ptr [ebp - 112], 0
    mov mov ecx, dword ptr [g_101A5090]
    and and dword ptr [ebp - 92], 0
    movzx movzx eax, bl
    test test byte ptr [ecx + eax*2 + 1], 080h
    je L20
    mov mov ecx, dword ptr [ebp + 01DCh]
    lea lea esi, [ebp - 76]
    mov mov al, bl
    call L5
    mov mov bl, byte ptr [edi]
    inc inc edi
    mov mov dword ptr [ebp + 01E0h], edi
    mov mov ecx, dword ptr [ebp + 01DCh]
    lea lea esi, [ebp - 76]
    mov mov al, bl
    call L9
    jmp sub_100FAEF5
    movsx movsx eax, bl
    cmp cmp eax, 103
    jg L40
    cmp cmp eax, 101
    jge L23
    cmp cmp eax, 88
    jg L28
    je L45
    sub sub eax, 67
    je L26
    dec dec eax
    dec dec eax
    je L24
    dec dec eax
    dec dec eax
    je L25
    sub sub eax, 12
    jne sub_100FAE1F
    test test word ptr [ebp - 60], 0830h
    jne L21
    or or byte ptr [ebp - 59], 8
    mov mov ecx, dword ptr [ebp - 64]
    cmp cmp ecx, -1
    jne L22
    mov mov ecx, 07FFFFFFFh
    add add dword ptr [ebp + 01E4h], 4
    test test word ptr [ebp - 60], 0810h
    mov mov eax, dword ptr [ebp + 01E4h]
    mov mov eax, dword ptr [eax - 4]
    mov mov dword ptr [ebp - 68], eax
    je sub_100FACD2
    test test eax, eax
    jne L27
    mov mov eax, dword ptr [g_101A4894]
    mov mov dword ptr [ebp - 68], eax
    mov mov eax, dword ptr [ebp - 68]
    mov mov dword ptr [ebp - 92], 1
    jmp sub_100FACDF
    mov mov dword ptr [ebp - 108], 1
    add add bl, 32
    or or dword ptr [ebp - 60], 64
    cmp cmp dword ptr [ebp - 64], 0
    lea lea esi, [ebp - 56]
    mov mov dword ptr [ebp - 68], esi
    jge L37
    mov mov dword ptr [ebp - 64], 6
    jmp L42
    test test word ptr [ebp - 60], 0830h
    jne L29
    or or byte ptr [ebp - 59], 8
    add add dword ptr [ebp + 01E4h], 4
    test test word ptr [ebp - 60], 0810h
L15:
    mov mov eax, dword ptr [ebp + 01E4h]
    je L34
    movsx movsx eax, word ptr [eax - 4]
    push push eax
    lea lea eax, [ebp - 56]
    push push eax
    call sub_10106ED5
    test test eax, eax
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [ebp - 72], eax
    jge L35
    mov mov dword ptr [ebp - 100], 1
    jmp L36
    sub sub eax, 90
    je L38
    sub sub eax, 9
    je L31
    dec dec eax
    jne sub_100FAEEE
    or or dword ptr [ebp - 60], 64
    mov mov dword ptr [ebp - 72], 10
    mov mov ebx, dword ptr [ebp - 60]
    mov mov esi, 08000h
    test test esi, ebx
    je sub_100FAE25
    mov mov ecx, dword ptr [ebp + 01E4h]
    mov mov eax, dword ptr [ecx]
    mov mov edx, dword ptr [ecx + 4]
    add add ecx, 8
    mov mov dword ptr [ebp + 01E4h], ecx
    jmp sub_100FAE6C
    mov mov al, byte ptr [eax - 4]
    mov mov byte ptr [ebp - 56], al
    mov mov dword ptr [ebp - 72], 1
    lea lea eax, [ebp - 56]
    mov mov dword ptr [ebp - 68], eax
    jmp sub_100FAF3A
    add add dword ptr [ebp + 01E4h], 4
    mov mov eax, dword ptr [ebp + 01E4h]
    mov mov eax, dword ptr [eax - 4]
    test test eax, eax
    je L44
    mov mov ecx, dword ptr [eax + 4]
    test test ecx, ecx
    je L46
    test test byte ptr [ebp - 59], 8
    movsx movsx eax, word ptr [eax]
    mov mov dword ptr [ebp - 68], ecx
    je L47
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov dword ptr [ebp - 92], 1
    jmp sub_100FAF6F
    and and dword ptr [ebp - 92], 0
    jmp sub_100FAF78
    mov mov eax, dword ptr [g_101A4890]
    mov mov dword ptr [ebp - 68], eax
    push push eax
    jmp sub_100FADA3
    jne sub_100FAD04
    cmp cmp bl, 103
    jne sub_100FAD40
    mov mov dword ptr [ebp - 64], 1
    jmp sub_100FAD49
    mov mov eax, 0200h
    cmp cmp dword ptr [ebp - 64], eax
    jle sub_100FAD29
    mov mov dword ptr [ebp - 64], eax
    mov mov edi, 0A3h
    cmp cmp dword ptr [ebp - 64], edi
    jle sub_100FAD60
    mov mov eax, dword ptr [ebp - 64]
    add add eax, 015Dh
    push push eax
    call sub_100FC89F
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 96], eax
    je sub_100FAD73
    mov mov dword ptr [ebp - 68], eax
    mov mov esi, eax
    jmp sub_100FAD7D
    mov mov dword ptr [ebp - 64], edi
    mov mov eax, dword ptr [ebp + 01E4h]
    mov mov ecx, dword ptr [eax]
    push push dword ptr [ebp - 108]
    add add eax, 8
    push push dword ptr [ebp - 64]
    mov mov dword ptr [ebp + 01E4h], eax
    mov mov eax, dword ptr [eax - 4]
    mov mov dword ptr [ebp - 124], eax
    movsx movsx eax, bl
    push push eax
    lea lea eax, [ebp - 080h]
    push push esi
    push push eax
    mov mov dword ptr [ebp - 080h], ecx
    call dword ptr [fp_101A4FB0]
    mov mov edi, dword ptr [ebp - 60]
    add add esp, 20
    and and edi, 080h
    je sub_100FAE08
    cmp cmp dword ptr [ebp - 64], 0
    jne sub_100FAE0E
    push push esi
    call dword ptr [fp_101A4FBC]
    pop pop ecx
    cmp cmp bl, 103
    jne sub_100FAE2C
    test test edi, edi
    jne sub_100FAE30
    push push esi
    call dword ptr [fp_101A4FB4]
    pop pop ecx
    cmp cmp byte ptr [esi], 45
    jne sub_100FAE4A
    or or byte ptr [ebp - 59], 1
    inc inc esi
    mov mov dword ptr [ebp - 68], esi
    push push esi
    call L10
    pop pop ecx
    jmp sub_100FB042
    sub sub eax, 105
    je sub_100FAD1C
    sub sub eax, 5
    je sub_100FAF43
    dec dec eax
    je sub_100FAF30
    dec dec eax
    je sub_100FAF00
    sub sub eax, 3
    je L43
    dec dec eax
    dec dec eax
    je sub_100FAD44
    sub sub eax, 3
    jne sub_100FB07B
    mov mov dword ptr [ebp - 104], 39
    jmp sub_100FAF2D
    dec dec ecx
    cmp cmp word ptr [eax], 0
    je sub_100FAEFC
    inc inc eax
    inc inc eax
    test test ecx, ecx
    jne sub_100FAEF5
    sub sub eax, dword ptr [ebp - 68]
    sar sar eax, 1
    jmp sub_100FB098
    test test eax, eax
    jne sub_100FAF26
    mov mov eax, dword ptr [g_101A4890]
    mov mov dword ptr [ebp - 68], eax
    mov mov eax, dword ptr [ebp - 68]
    jmp sub_100FAF3F
    dec dec ecx
    cmp cmp byte ptr [eax], 0
    je sub_100FAF49
    inc inc eax
    test test ecx, ecx
    jne sub_100FAF43
    sub sub eax, dword ptr [ebp - 68]
    jmp sub_100FB0BC
    mov mov dword ptr [ebp - 64], 8
    mov mov dword ptr [ebp - 104], ecx
    test test byte ptr [ebp - 60], 080h
    mov mov dword ptr [ebp - 72], 16
    je sub_100FADB3
    mov mov al, byte ptr [ebp - 104]
    add add al, 81
    mov mov byte ptr [ebp - 80], 48
    mov mov byte ptr [ebp - 79], al
    mov mov dword ptr [ebp - 84], 2
    jmp sub_100FADCB
    test test byte ptr [ebp - 60], 080h
    mov mov dword ptr [ebp - 72], 8
    je sub_100FADDC
    or or byte ptr [ebp - 59], 2
    jmp sub_100FADE5
    add add dword ptr [ebp + 01E4h], 4
    test test byte ptr [ebp - 60], 32
    mov mov eax, dword ptr [ebp + 01E4h]
    mov mov eax, dword ptr [eax - 4]
    je sub_100FB02D
    mov mov cx, word ptr [ebp - 76]
    mov mov word ptr [eax], cx
    jmp sub_100FB03B
    mov mov ecx, dword ptr [ebp - 76]
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [ebp - 100], 1
    jmp sub_100FB23D
    add add dword ptr [ebp + 01E4h], 4
    test test bl, 32
    mov mov eax, dword ptr [ebp + 01E4h]
    je sub_100FB08E
    test test bl, 64
    je sub_100FB08D
    movsx movsx eax, word ptr [eax - 4]
    cdq cdq
    jmp sub_100FB0A4
    movzx movzx eax, word ptr [eax - 4]
    jmp sub_100FB097
    test test bl, 64
    mov mov eax, dword ptr [eax - 4]
    jne sub_100FB09F
    xor xor edx, edx
    test test bl, 64
    je sub_100FB0D3
    test test edx, edx
    jg sub_100FB0D7
    jl sub_100FB0CE
    test test eax, eax
    jae sub_100FB0DD
    neg neg eax
    adc adc edx, 0
    neg neg edx
    or or byte ptr [ebp - 59], 1
    test test dword ptr [ebp - 60], esi
    mov mov ebx, eax
    mov mov edi, edx
    jne sub_100FB0FC
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 64], 0
    jge sub_100FB113
    mov mov dword ptr [ebp - 64], 1
    jmp sub_100FB12D
    and and dword ptr [ebp - 60], -9
    mov mov eax, 0200h
    cmp cmp dword ptr [ebp - 64], eax
    jle sub_100FB13B
    mov mov dword ptr [ebp - 64], eax
    mov mov eax, ebx
    or or eax, edi
    jne sub_100FB14E
    and and dword ptr [ebp - 84], 0
    lea lea esi, [ebp + 01C7h]
    mov mov eax, dword ptr [ebp - 64]
    dec dec dword ptr [ebp - 64]
    test test eax, eax
    jg sub_100FB178
L29:
    mov mov eax, ebx
    or or eax, edi
    je sub_100FB1A2
    mov mov eax, dword ptr [ebp - 72]
    cdq cdq
    push push edx
    push push eax
    push push edi
    push push ebx
    call sub_10107219
    add add ecx, 48
    cmp cmp ecx, 57
    mov mov dword ptr [ebp - 116], ebx
    mov mov ebx, eax
    mov mov edi, edx
    jle sub_100FB1B9
    add add ecx, dword ptr [ebp - 104]
    mov mov byte ptr [esi], cl
    dec dec esi
    jmp sub_100FB192
    lea lea eax, [ebp + 01C7h]
    sub sub eax, esi
    inc inc esi
    test test byte ptr [ebp - 59], 2
    mov mov dword ptr [ebp - 72], eax
    mov mov dword ptr [ebp - 68], esi
    je sub_100FB208
    mov mov ecx, esi
    cmp cmp byte ptr [ecx], 48
    jne sub_100FB202
    test test eax, eax
    jne sub_100FB213
    dec dec dword ptr [ebp - 68]
    mov mov ecx, dword ptr [ebp - 68]
    mov mov byte ptr [ecx], 48
    inc inc eax
    mov mov dword ptr [ebp - 72], eax
    cmp cmp dword ptr [ebp - 100], 0
    jne sub_100FB32B
    mov mov ebx, dword ptr [ebp - 60]
    test test bl, 64
    je sub_100FB26A
    test test bh, 1
    je sub_100FB254
    mov mov byte ptr [ebp - 80], 45
    jmp sub_100FB26E
    test test bl, 1
    je sub_100FB26A
    mov mov byte ptr [ebp - 80], 43
    jmp sub_100FB279
    test test bl, 2
    je sub_100FB285
    mov mov byte ptr [ebp - 80], 32
    mov mov dword ptr [ebp - 84], 1
    mov mov esi, dword ptr [ebp - 88]
    sub sub esi, dword ptr [ebp - 84]
    sub sub esi, dword ptr [ebp - 72]
    test test bl, 12
    jne sub_100FB2C0
    push push dword ptr [ebp + 01DCh]
    lea lea eax, [ebp - 76]
    push push esi
    push push 32
    call L30
    add add esp, 12
    push push dword ptr [ebp - 84]
    mov mov edi, dword ptr [ebp + 01DCh]
    lea lea eax, [ebp - 76]
    lea lea ecx, [ebp - 80]
L36:
    call L33
    test test bl, 8
    pop pop ecx
    je sub_100FB31C
    test test bl, 4
    jne sub_100FB321
L38:
    push push edi
    push push esi
    push push 48
    lea lea eax, [ebp - 76]
    call L32
    add add esp, 12
    cmp cmp dword ptr [ebp - 92], 0
    je sub_100FB386
    cmp cmp dword ptr [ebp - 72], 0
    jle sub_100FB38C
    mov mov eax, dword ptr [ebp - 72]
    mov mov ebx, dword ptr [ebp - 68]
    mov mov dword ptr [ebp - 116], eax
    dec dec dword ptr [ebp - 116]
    xor xor eax, eax
    mov mov ax, word ptr [ebx]
    push push eax
    lea lea eax, [ebp + 01C8h]
    push push eax
    call sub_101072DC
    inc inc ebx
    pop pop ecx
    inc inc ebx
    test test eax, eax
    pop pop ecx
    jle sub_100FB3C1
    mov mov edi, dword ptr [ebp + 01DCh]
    push push eax
    lea lea eax, [ebp - 76]
    lea lea ecx, [ebp + 01C8h]
    call L38
    cmp cmp dword ptr [ebp - 116], 0
    pop pop ecx
    jne sub_100FB393
    jmp sub_100FB3DF
    push push dword ptr [ebp - 72]
    mov mov ecx, dword ptr [ebp - 68]
    lea lea eax, [ebp - 76]
    call L41
    pop pop ecx
    test test byte ptr [ebp - 60], 4
    je sub_100FB40E
    push push dword ptr [ebp + 01DCh]
    lea lea eax, [ebp - 76]
    push push esi
    push push 32
    call L39
    add add esp, 12
    cmp cmp dword ptr [ebp - 96], 0
    je sub_100FB43B
    push push dword ptr [ebp - 96]
    call sub_100F8C7C
    and and dword ptr [ebp - 96], 0
    pop pop ecx
    mov mov edi, dword ptr [ebp + 01E0h]
    mov mov bl, byte ptr [edi]
    test test bl, bl
    jne sub_100FACE4
    pop pop edi
    pop pop esi
L44:
    mov mov ecx, dword ptr [ebp + 01D0h]
    mov mov eax, dword ptr [ebp - 76]
    pop pop ebx
L47:
    call sub_1010151F
    add add ebp, 01D4h
    leave leave
    ret ret
__output ENDP
END
