.686
.MODEL FLAT, C
EXTRN sub_100C9BB3:PROC
EXTRN sub_100CB29E:PROC
EXTRN sub_100CB771:PROC
EXTRN sub_100CB779:PROC
EXTRN sub_100CB781:PROC
EXTRN sub_100CB784:PROC
EXTRN sub_100CB789:PROC
EXTRN sub_100CB798:PROC
EXTRN sub_100CB79F:PROC
EXTRN sub_100CB7BA:PROC
EXTRN sub_100CB81E:PROC
EXTRN sub_100CB823:PROC
EXTRN sub_100CB82B:PROC
EXTRN sub_100CB82E:PROC
.CODE
FUN_100cb636 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    mov mov eax, dword ptr [ecx + 0100h]
    mov mov edx, dword ptr [eax + 16]
    mov mov edx, dword ptr [edx]
    push push esi
    mov mov esi, dword ptr [ecx + 20]
    mov mov edx, dword ptr [esi + edx*4]
    mov mov esi, dword ptr [ecx + 08Ch]
    cmp cmp esi, dword ptr [edx + 4]
    jne L0
    push push 0
    push push 46
    call sub_100CB29E
    jmp sub_100CB79F
    test test byte ptr [ecx + 110], 16
    push push ebx
    push push edi
    jne L2
    mov mov eax, dword ptr [eax + 12]
    and and dword ptr [ebp - 4], 0
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jbe L3
    mov mov eax, dword ptr [ecx + 0100h]
    mov mov edx, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + 8]
    mov mov esi, dword ptr [ecx + 20]
    sub sub eax, edx
    mov mov edi, edx
    mov mov dword ptr [ebp - 12], eax
    jmp L1
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + edi]
    mov mov edx, dword ptr [esi + eax*4]
    mov mov eax, dword ptr [edi]
    mov mov eax, dword ptr [esi + eax*4]
    mov mov ebx, dword ptr [eax + 4]
    cmp cmp ebx, dword ptr [edx + 4]
    jne L5
    mov mov ebx, dword ptr [eax + 8]
    cmp cmp ebx, dword ptr [edx + 8]
    jne sub_100CB771
    mov mov ebx, dword ptr [eax + 12]
    cmp cmp ebx, dword ptr [edx + 12]
    jne sub_100CB779
    mov mov ebx, dword ptr [eax + 16]
    cmp cmp ebx, dword ptr [edx + 16]
    jne sub_100CB781
    mov mov ebx, dword ptr [eax + 60]
    cmp cmp ebx, dword ptr [edx + 60]
    jne sub_100CB789
    test test byte ptr [ecx + 0CCh], 4
    je sub_100CB784
    cmp cmp dword ptr [eax + 96], 0
    jne sub_100CB798
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add edi, 4
    cmp cmp eax, dword ptr [ebp - 8]
    jb L4
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 4], eax
    jne sub_100CB7BA
    xor xor eax, eax
    jmp sub_100CB82E
    mov mov eax, dword ptr [ecx + 0100h]
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [eax + 12], 0
    jbe sub_100CB81E
    mov mov edi, 0E000000h
    mov mov eax, dword ptr [ecx + 0100h]
    mov mov esi, dword ptr [eax + 16]
    mov mov ebx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ecx + 20]
    mov mov esi, dword ptr [esi + ebx*4]
    mov mov esi, dword ptr [edx + esi*4]
    test test dword ptr [esi], edi
    jne sub_100CB82B
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax]
    and and eax, edi
    or or eax, dword ptr [esi]
    mov mov dword ptr [esi], eax
L2:
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ecx + 0100h]
    mov mov edx, dword ptr [ebp - 4]
    cmp cmp edx, dword ptr [eax + 12]
    jb sub_100CB823
    mov mov eax, dword ptr [ecx + 0100h]
    mov mov edx, dword ptr [eax + 12]
L4:
    xor xor esi, esi
    push push esi
    push push esi
    push push esi
    push push esi
    push push edx
    push push esi
    push push esi
    push push dword ptr [eax + 8]
    push push edx
    push push dword ptr [eax + 16]
    push push 1
    call sub_100C9BB3
    pop pop edi
    pop pop ebx
    pop pop esi
    leave leave
    ret ret
FUN_100cb636 ENDP
END
