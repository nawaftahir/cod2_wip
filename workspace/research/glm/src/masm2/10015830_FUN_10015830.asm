.686
.MODEL FLAT, C
EXTRN sub_1001529A:PROC
EXTRN sub_10015A2C:PROC
EXTRN sub_10015A4B:PROC
EXTRN sub_10015BAA:PROC
EXTRN sub_10015BC7:PROC
.CODE
FUN_10015830 PROC
    push push ecx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    xor xor esi, esi
    mov mov eax, 3
    xor xor edi, edi
    mov mov ecx, dword ptr [esp + 24]
    mov mov edx, dword ptr [ecx + edi*4]
    xor xor ecx, ecx
    test test esi, esi
    sete sete cl
    push push edx
    lea lea edx, [esi + esi*8]
    shl shl edx, 5
    add add edx, ebx
    lea lea ecx, [ecx + ecx*8]
    shl shl ecx, 5
    add add ecx, ebx
    push push ecx
    push push edx
    push push eax
    mov mov eax, ebp
    call sub_1001529A
    add add esp, 16
    xor xor esi, 1
    test test eax, eax
    je L1
    inc inc edi
    add add ebp, 12
    cmp cmp edi, 6
    jl L0
    cmp cmp eax, dword ptr [esp + 28]
    jle L2
    pop pop edi
    pop pop esi
    or or eax, -1
    pop pop ebp
    pop pop ecx
    ret ret
    mov mov ecx, dword ptr [esp + 36]
    xor xor edi, edi
    cmp cmp eax, 4
    mov mov byte ptr [ecx + 6], al
    jl sub_10015A2C
    mov mov edx, dword ptr [esp + 32]
    lea lea edi, [eax - 4]
    lea lea ecx, [esi + esi*8]
    shl shl ecx, 5
    shr shr edi, 2
    add add edx, 16
    inc inc edi
    lea lea ebp, [edi*4]
    lea lea ecx, [ecx + ebx + 24]
    mov mov dword ptr [esp + 12], ebp
    mov mov ebp, dword ptr [ecx - 24]
    mov mov dword ptr [edx - 16], ebp
    mov mov ebp, dword ptr [ecx - 20]
    mov mov dword ptr [edx - 12], ebp
    mov mov ebp, dword ptr [ecx - 16]
    mov mov dword ptr [edx - 8], ebp
    mov mov ebp, dword ptr [ecx - 12]
    mov mov dword ptr [edx + 20], ebp
    mov mov ebp, dword ptr [ecx - 8]
    mov mov dword ptr [edx + 24], ebp
L2:
    mov mov ebp, dword ptr [ecx - 4]
    mov mov dword ptr [edx - 4], ebp
    mov mov ebp, dword ptr [ecx]
    mov mov dword ptr [edx], ebp
    mov mov ebp, dword ptr [ecx + 4]
    mov mov dword ptr [edx + 4], ebp
    mov mov ebp, dword ptr [ecx + 8]
    mov mov dword ptr [edx + 52], ebp
    mov mov ebp, dword ptr [ecx + 12]
    mov mov dword ptr [edx + 56], ebp
    mov mov ebp, dword ptr [ecx + 16]
    mov mov dword ptr [edx + 60], ebp
    mov mov ebp, dword ptr [ecx + 20]
    mov mov dword ptr [edx + 88], ebp
    mov mov ebp, dword ptr [ecx + 24]
    mov mov dword ptr [edx + 92], ebp
    mov mov ebp, dword ptr [ecx + 28]
    mov mov dword ptr [edx + 64], ebp
    mov mov ebp, dword ptr [ecx + 32]
    mov mov dword ptr [edx + 68], ebp
    mov mov ebp, dword ptr [ecx + 36]
    mov mov dword ptr [edx + 72], ebp
    mov mov ebp, dword ptr [ecx + 40]
    mov mov dword ptr [edx + 120], ebp
    mov mov ebp, dword ptr [ecx + 44]
    mov mov dword ptr [edx + 124], ebp
    mov mov ebp, dword ptr [ecx + 48]
    mov mov dword ptr [edx + 080h], ebp
    mov mov ebp, dword ptr [ecx + 52]
    mov mov dword ptr [edx + 09Ch], ebp
    mov mov ebp, dword ptr [ecx + 56]
    mov mov dword ptr [edx + 0A0h], ebp
    mov mov ebp, dword ptr [ecx + 60]
    mov mov dword ptr [edx + 084h], ebp
    mov mov ebp, dword ptr [ecx + 64]
    mov mov dword ptr [edx + 088h], ebp
    mov mov ebp, dword ptr [ecx + 68]
    mov mov dword ptr [edx + 08Ch], ebp
    mov mov ebp, dword ptr [ecx + 72]
    mov mov dword ptr [edx + 0BCh], ebp
    mov mov ebp, dword ptr [ecx + 76]
    mov mov dword ptr [edx + 0C0h], ebp
    mov mov ebp, dword ptr [ecx + 80]
    mov mov dword ptr [edx + 0C4h], ebp
    mov mov ebp, dword ptr [ecx + 84]
    mov mov dword ptr [edx + 0E0h], ebp
    mov mov ebp, dword ptr [ecx + 88]
    mov mov dword ptr [edx + 0E4h], ebp
    mov mov ebp, dword ptr [ecx + 92]
    mov mov dword ptr [edx + 0C8h], ebp
    mov mov ebp, dword ptr [ecx + 96]
    mov mov dword ptr [edx + 0CCh], ebp
    mov mov ebp, dword ptr [ecx + 100]
    mov mov dword ptr [edx + 0D0h], ebp
    add add ecx, 080h
    add add edx, 0110h
    dec dec edi
    jne sub_10015A4B
    mov mov edi, dword ptr [esp + 12]
    cmp cmp edi, eax
    jge sub_10015BAA
    mov mov ecx, dword ptr [esp + 32]
    mov mov edx, edi
    imul imul edx, edx, 68
    lea lea edx, [edx + ecx + 16]
    lea lea ecx, [edi + esi*8]
    add add ecx, esi
    shl shl ecx, 5
    lea lea ecx, [ecx + ebx + 24]
    sub sub eax, edi
    mov mov edi, edi
    mov mov edi, dword ptr [ecx - 24]
    mov mov dword ptr [edx - 16], edi
    mov mov edi, dword ptr [ecx - 20]
    mov mov dword ptr [edx - 12], edi
    mov mov edi, dword ptr [ecx - 16]
    mov mov dword ptr [edx - 8], edi
    mov mov edi, dword ptr [ecx - 12]
    mov mov dword ptr [edx + 20], edi
    mov mov edi, dword ptr [ecx - 8]
    mov mov dword ptr [edx + 24], edi
    mov mov edi, dword ptr [ecx - 4]
    mov mov dword ptr [edx - 4], edi
    mov mov edi, dword ptr [ecx]
    mov mov dword ptr [edx], edi
    mov mov edi, dword ptr [ecx + 4]
    mov mov dword ptr [edx + 4], edi
    add add ecx, 32
    add add edx, 68
    dec dec eax
    jne sub_10015BC7
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    pop pop ecx
    ret ret
FUN_10015830 ENDP
END
