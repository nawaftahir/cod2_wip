.686
.MODEL FLAT, C
EXTRN sub_100650FD:PROC
EXTRN sub_10065186:PROC
EXTRN sub_100651A0:PROC
EXTRN sub_1006521E:PROC
EXTRN sub_1006524D:PROC
EXTRN sub_10065295:PROC
EXTRN sub_10065301:PROC
EXTRN sub_10065352:PROC
EXTRN sub_10082A63:PROC
EXTRN sub_10082A90:PROC
EXTRN sub_10082AAB:PROC
EXTRN sub_10082B17:PROC
EXTRN sub_10082B68:PROC
EXTRN sub_10082B84:PROC
EXTRN sub_10082F8A:PROC
EXTRN sub_100832F9:PROC
EXTRN sub_10083419:PROC
EXTRN sub_100995AF:PROC
EXTRN sub_10099B93:PROC
EXTRN sub_10099C96:PROC
EXTRN sub_10099E3B:PROC
EXTRN sub_10099EFB:PROC
EXTRN sub_1009A8B9:PROC
EXTRN sub_1009A8C4:PROC
EXTRN sub_1009B7D5:PROC
EXTRN sub_1009BDC9:PROC
EXTRN sub_1009EA5A:PROC
EXTRN sub_1009EB2F:PROC
EXTRN sub_1009EBEF:PROC
.CODE
FUN_1009eae8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    mov eax, dword ptr [ebp + 8]
    push esi
    push edi
    xor edi, edi
    cmp eax, edi
    mov esi, ecx
    mov dword ptr [ebp - 4], esi
    je L0
    cmp dword ptr [eax + 4], 13
    jne L2
L0:
    mov ecx, dword ptr [ebp + 12]
    cmp ecx, edi
    je L1
    cmp dword ptr [ecx + 4], 13
    jne L2
L1:
    mov edx, dword ptr [ebp + 16]
    cmp edx, edi
    je L3
    cmp dword ptr [edx + 4], 13
    je L3
L2:
    xor eax, eax
    jmp L42
L3:
    cmp eax, edi
    push ebx
    lea ebx, [eax + 48]
    jne L4
    lea ebx, [esi + 32]
L4:
    cmp eax, edi
    mov dword ptr [ebp - 12], ebx
    je L5
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp - 24], eax
    jmp L6
L5:
    mov dword ptr [ebp - 24], edi
L6:
    cmp ecx, edi
    je L7
    mov eax, dword ptr [ecx + 16]
    mov dword ptr [ebp - 16], eax
    jmp L8
L7:
    mov dword ptr [ebp - 16], edi
L8:
    cmp edx, edi
    je L9
    mov eax, dword ptr [edx + 16]
    mov dword ptr [ebp - 20], eax
    jmp L10
L9:
    mov dword ptr [ebp - 20], edi
L10:
    mov eax, dword ptr [ebp - 16]
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [ebp - 20]
    push 80
    mov dword ptr [ebp - 32], eax
    xor ebx, ebx
    call sub_100650FD
    cmp eax, edi
    je L11
    push dword ptr [ebp - 12]
    mov ecx, eax
    push 1
    push edi
    push edi
    push 24
    push edi
    call sub_100832F9
    mov dword ptr [ebp - 8], eax
    jmp L12
L11:
    mov dword ptr [ebp - 8], edi
L12:
    cmp dword ptr [ebp - 8], edi
    je L14
    push dword ptr [ebp - 24]
    mov ecx, esi
    call sub_10099B93
    test eax, eax
    jne L15
    push 010114DE0h
    push 000000BCCh
    push dword ptr [ebp - 12]
    push esi
L13:
    call sub_100995AF
    add esp, 16
L14:
    mov dword ptr [ebp - 8], edi
    jmp L41
L15:
    mov esi, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    add esi, 16
    push esi
    lea eax, [ebp - 32]
    push eax
    lea eax, [ebp - 28]
    push eax
    push dword ptr [ebp - 20]
    push dword ptr [ebp - 16]
    call sub_1009BDC9
    test eax, eax
    jge L16
    push 010114DB4h
    jmp L21
L16:
    mov eax, dword ptr [esi]
    cmp eax, edi
    je L22
    cmp dword ptr [eax + 4], 9
    push 36
    jne L17
    call sub_10065186
    cmp eax, edi
    je L19
    mov esi, dword ptr [esi]
    push 000000200h
    push dword ptr [esi + 28]
    mov ecx, eax
    push dword ptr [esi + 24]
    jmp L18
L17:
    call sub_100651A0
    mov ebx, eax
    cmp ebx, edi
    je L19
    mov ecx, dword ptr [ebp - 4]
    push 000000200h
    push dword ptr [esi]
    call sub_10099C96
    push eax
    push 1
    mov ecx, ebx
L18:
    push edi
    push 2
    call sub_10082F8A
    mov ebx, eax
    jmp L20
L19:
    xor ebx, ebx
L20:
    cmp ebx, edi
    je L14
    mov ecx, dword ptr [ebp - 4]
    push edi
    push dword ptr [ebp - 24]
    push ebx
    call sub_1009B7D5
    test eax, eax
    jne L22
    push 010114D84h
L21:
    push 000000BCCh
    push dword ptr [ebp - 12]
    push dword ptr [ebp - 4]
    jmp L13
L22:
    cmp dword ptr [ebp + 8], edi
    je L23
    mov ecx, dword ptr [ebp - 4]
    push edi
    push edi
    push dword ptr [ebp + 8]
    push ebx
    call sub_1009EA5A
    cmp eax, edi
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [ecx + 32], eax
    je L14
L23:
    push 80
    call sub_1006521E
    cmp eax, edi
    je L24
    push dword ptr [ebp - 12]
    mov ecx, eax
    push 1
    push edi
    push edi
    push edi
    push edi
    call sub_10083419
    mov esi, eax
    jmp L25
L24:
    xor esi, esi
L25:
    cmp esi, edi
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [eax + 36], esi
    je L14
    push 20
    call sub_1006524D
    cmp eax, edi
    je L26
    push 010114AF0h
    push edi
    push edi
    mov ecx, eax
    call sub_10082A63
    jmp L27
L26:
    xor eax, eax
L27:
    cmp eax, edi
    mov dword ptr [esi + 16], eax
    je L14
    mov ebx, dword ptr [ebp - 28]
    cmp ebx, edi
    je L28
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 16]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [esi + 16]
    cmp dword ptr [eax + 8], edi
    je L14
L28:
    push 20
    call sub_10065295
    cmp eax, edi
    je L29
    push 010114AE8h
    push edi
    push edi
    mov ecx, eax
    call sub_10082AAB
    jmp L30
L29:
    xor eax, eax
L30:
    cmp eax, edi
    mov dword ptr [esi + 32], eax
    je L14
    cmp dword ptr [ebp + 12], edi
    je L33
    cmp dword ptr [ebp - 16], ebx
    je L31
    mov ecx, dword ptr [ebp - 4]
    push ebx
    push dword ptr [ebp - 16]
    call sub_10099E3B
    test eax, eax
    jne L31
    mov ecx, dword ptr [ebp - 4]
    push edi
    push edi
    push dword ptr [ebp + 12]
    push ebx
    call sub_1009EB2F
    jmp L32
L31:
    push dword ptr [ebp + 12]
    call sub_10082A90
L32:
    mov ecx, dword ptr [esi + 32]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [esi + 32]
    cmp dword ptr [eax + 8], edi
    je L14
L33:
    push 20
    call sub_10065301
    cmp eax, edi
    je L34
    push 010114AF0h
    push edi
    push edi
    mov ecx, eax
    call sub_10082B17
    jmp L35
L34:
    xor eax, eax
L35:
    cmp eax, edi
    mov ecx, dword ptr [esi + 16]
    mov dword ptr [ecx + 12], eax
    je L14
    mov ebx, dword ptr [ebp - 32]
    cmp ebx, edi
    je L36
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + 12]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + 12]
    cmp dword ptr [eax + 8], edi
    je L14
L36:
    push 20
    call sub_10065352
    cmp eax, edi
    je L37
    push 010114AE8h
    push edi
    push edi
    mov ecx, eax
    call sub_10082B68
    jmp L38
L37:
    xor eax, eax
L38:
    cmp eax, edi
    mov ecx, dword ptr [esi + 32]
    mov dword ptr [ecx + 12], eax
    je L14
    cmp dword ptr [ebp + 16], edi
    je L40
    cmp dword ptr [ebp - 20], ebx
    je L43
    mov ecx, dword ptr [ebp - 4]
    push ebx
    push dword ptr [ebp - 20]
    call sub_10099EFB
    test eax, eax
    jne L43
    mov ecx, dword ptr [ebp - 4]
    push edi
    push edi
    push dword ptr [ebp + 16]
    push ebx
    call sub_1009EBEF
L39:
    mov ecx, dword ptr [esi + 32]
    mov ecx, dword ptr [ecx + 12]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [esi + 32]
    mov eax, dword ptr [eax + 12]
    cmp dword ptr [eax + 8], edi
    je L14
L40:
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_1009A8B9
    push dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009A8C4
L41:
    mov eax, dword ptr [ebp - 8]
    pop ebx
L42:
    pop edi
    pop esi
    leave
    ret 12
L43:
    push dword ptr [ebp + 16]
    call sub_10082B84
    jmp L39
FUN_1009eae8 ENDP
END
