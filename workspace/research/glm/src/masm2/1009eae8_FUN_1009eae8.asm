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
EXTRN sub_1009EE64:PROC
EXTRN sub_1009EE74:PROC
EXTRN sub_1009EE7A:PROC
EXTRN sub_1009EE87:PROC
EXTRN sub_1009EE9A:PROC
EXTRN sub_1009EEBE:PROC
EXTRN sub_1009EEC5:PROC
EXTRN sub_1009EED0:PROC
EXTRN sub_1009EF05:PROC
EXTRN sub_1009EF0F:PROC
EXTRN sub_1009EF21:PROC
EXTRN sub_1009EF4E:PROC
EXTRN sub_1009EF60:PROC
EXTRN sub_1009EFAC:PROC
EXTRN sub_1009EFBC:PROC
EXTRN sub_1009EFC1:PROC
EXTRN sub_1009EFD4:PROC
EXTRN sub_1009F026:PROC
EXTRN sub_1009F038:PROC
EXTRN sub_1009F083:PROC
EXTRN sub_1009F0C8:PROC
EXTRN sub_1009F0DA:PROC
EXTRN sub_1009F13D:PROC
EXTRN sub_1009F160:PROC
EXTRN sub_1009F170:PROC
EXTRN sub_1009F188:PROC
.CODE
FUN_1009eae8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    mov mov eax, dword ptr [ebp + 8]
    push push esi
    push push edi
    xor xor edi, edi
    cmp cmp eax, edi
    mov mov esi, ecx
    mov mov dword ptr [ebp - 4], esi
    je L0
    cmp cmp dword ptr [eax + 4], 13
    jne L3
    mov mov ecx, dword ptr [ebp + 12]
    cmp cmp ecx, edi
    je L2
    cmp cmp dword ptr [ecx + 4], 13
    jne L4
    mov mov edx, dword ptr [ebp + 16]
    cmp cmp edx, edi
    je L5
    cmp cmp dword ptr [edx + 4], 13
L0:
    je L6
    xor xor eax, eax
    jmp sub_1009EE87
    cmp cmp eax, edi
    push push ebx
    lea lea ebx, [eax + 48]
    jne L7
L1:
    lea lea ebx, [esi + 32]
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 12], ebx
    je L8
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ebp - 24], eax
    jmp L9
    mov mov dword ptr [ebp - 24], edi
    cmp cmp ecx, edi
    je L10
    mov mov eax, dword ptr [ecx + 16]
L4:
    mov mov dword ptr [ebp - 16], eax
    jmp L11
    mov mov dword ptr [ebp - 16], edi
    cmp cmp edx, edi
    je L12
    mov mov eax, dword ptr [edx + 16]
    mov mov dword ptr [ebp - 20], eax
    jmp L13
L6:
    mov mov dword ptr [ebp - 20], edi
    mov mov eax, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 28], eax
    mov mov eax, dword ptr [ebp - 20]
    push push 80
    mov mov dword ptr [ebp - 32], eax
    xor xor ebx, ebx
    call sub_100650FD
    cmp cmp eax, edi
L7:
    je L15
    push push dword ptr [ebp - 12]
    mov mov ecx, eax
    push push 1
    push push edi
    push push edi
    push push 24
    push push edi
    call sub_100832F9
    mov mov dword ptr [ebp - 8], eax
    jmp L16
    mov mov dword ptr [ebp - 8], edi
    cmp cmp dword ptr [ebp - 8], edi
    je L17
    push push dword ptr [ebp - 24]
    mov mov ecx, esi
    call sub_10099B93
    test test eax, eax
    jne L18
    push push 010114DE0h
    push push 0BCCh
    push push dword ptr [ebp - 12]
    push push esi
    call sub_100995AF
    add add esp, 16
    mov mov dword ptr [ebp - 8], edi
    jmp sub_1009EF21
    mov mov esi, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    add add esi, 16
L12:
    push push esi
    lea lea eax, [ebp - 32]
    push push eax
    lea lea eax, [ebp - 28]
    push push eax
    push push dword ptr [ebp - 20]
    push push dword ptr [ebp - 16]
    call sub_1009BDC9
    test test eax, eax
    jge L19
    push push 010114DB4h
    jmp L25
    mov mov eax, dword ptr [esi]
L14:
    cmp cmp eax, edi
    je L28
    cmp cmp dword ptr [eax + 4], 9
    push push 36
    jne L21
    call sub_10065186
    cmp cmp eax, edi
    je L23
    mov mov esi, dword ptr [esi]
    push push 0200h
    push push dword ptr [esi + 28]
    mov mov ecx, eax
    push push dword ptr [esi + 24]
    jmp L24
    call sub_100651A0
    mov mov ebx, eax
    cmp cmp ebx, edi
    je L27
    mov mov ecx, dword ptr [ebp - 4]
    push push 0200h
    push push dword ptr [esi]
    call sub_10099C96
    push push eax
    push push 1
    mov mov ecx, ebx
    push push edi
    push push 2
    call sub_10082F8A
    mov mov ebx, eax
    jmp L30
    xor xor ebx, ebx
    cmp cmp ebx, edi
    je L20
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push dword ptr [ebp - 24]
    push push ebx
    call sub_1009B7D5
    test test eax, eax
    jne L33
    push push 010114D84h
    push push 0BCCh
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp - 4]
    jmp L22
    cmp cmp dword ptr [ebp + 8], edi
    je L35
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push edi
    push push dword ptr [ebp + 8]
    push push ebx
    call sub_1009EA5A
    cmp cmp eax, edi
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + 32], eax
    je L26
    push push 80
    call sub_1006521E
    cmp cmp eax, edi
    je sub_1009EE64
    push push dword ptr [ebp - 12]
    mov mov ecx, eax
    push push 1
    push push edi
    push push edi
    push push edi
    push push edi
    call sub_10083419
    mov mov esi, eax
    jmp sub_1009EE7A
    xor xor esi, esi
    cmp cmp esi, edi
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [eax + 36], esi
    je L29
    push push 20
    call sub_1006524D
    cmp cmp eax, edi
    je sub_1009EEBE
    push push 010114AF0h
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_10082A63
    jmp sub_1009EED0
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [esi + 16], eax
    je L31
    mov mov ebx, dword ptr [ebp - 28]
L19:
    cmp cmp ebx, edi
    je sub_1009EF0F
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [esi + 16]
    cmp cmp dword ptr [eax + 8], edi
    je L32
    push push 20
    call sub_10065295
    cmp cmp eax, edi
    je sub_1009EF4E
    push push 010114AE8h
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_10082AAB
    jmp sub_1009EF60
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [esi + 32], eax
    je L34
    cmp cmp dword ptr [ebp + 12], edi
    je sub_1009EFC1
    cmp cmp dword ptr [ebp - 16], ebx
    je sub_1009EFAC
    mov mov ecx, dword ptr [ebp - 4]
L22:
    push push ebx
    push push dword ptr [ebp - 16]
    call sub_10099E3B
    test test eax, eax
    jne sub_1009EFBC
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push edi
    push push dword ptr [ebp + 12]
    push push ebx
    call L1
    jmp sub_1009EFD4
    push push dword ptr [ebp + 12]
    call sub_10082A90
    mov mov ecx, dword ptr [esi + 32]
L25:
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [esi + 32]
    cmp cmp dword ptr [eax + 8], edi
    je L36
    push push 20
    call sub_10065301
L28:
    cmp cmp eax, edi
    je sub_1009F026
    push push 010114AF0h
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_10082B17
    jmp sub_1009F038
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov ecx, dword ptr [esi + 16]
    mov mov dword ptr [ecx + 12], eax
    je sub_1009EE74
    mov mov ebx, dword ptr [ebp - 32]
    cmp cmp ebx, edi
    je sub_1009F083
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + 12]
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp dword ptr [eax + 8], edi
    je sub_1009EE9A
    push push 20
    call sub_10065352
    cmp cmp eax, edi
    je sub_1009F0C8
    push push 010114AE8h
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_10082B68
    jmp sub_1009F0DA
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov ecx, dword ptr [esi + 32]
    mov mov dword ptr [ecx + 12], eax
    je sub_1009EEC5
    cmp cmp dword ptr [ebp + 16], edi
    je sub_1009F13D
    cmp cmp dword ptr [ebp - 20], ebx
    je sub_1009F160
    mov mov ecx, dword ptr [ebp - 4]
    push push ebx
    push push dword ptr [ebp - 20]
    call sub_10099EFB
    test test eax, eax
    jne sub_1009F170
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push edi
    push push dword ptr [ebp + 16]
    push push ebx
    call L14
    mov mov ecx, dword ptr [esi + 32]
    mov mov ecx, dword ptr [ecx + 12]
L35:
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [esi + 32]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp dword ptr [eax + 8], edi
    je sub_1009EF05
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_1009A8B9
    push push dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_1009A8C4
    mov mov eax, dword ptr [ebp - 8]
    pop pop ebx
    pop pop edi
L36:
    pop pop esi
    leave leave
    ret ret 12
    push push dword ptr [ebp + 16]
    call sub_10082B84
    jmp sub_1009F188
FUN_1009eae8 ENDP
END
