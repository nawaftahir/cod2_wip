.686
.MODEL FLAT, C
EXTRN sub_10067D2C:PROC
EXTRN sub_10084388:PROC
EXTRN sub_100844F2:PROC
EXTRN sub_100844FA:PROC
EXTRN sub_100844FE:PROC
EXTRN sub_10084503:PROC
EXTRN sub_10084504:PROC
EXTRN sub_1008452F:PROC
EXTRN sub_10084561:PROC
EXTRN sub_10084568:PROC
EXTRN sub_10084574:PROC
EXTRN sub_1008457A:PROC
EXTRN sub_10084580:PROC
EXTRN sub_1009E13E:PROC
.CODE
FUN_100843e6 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    push push 8
    mov mov ebx, ecx
    pop pop ecx
    lea lea edi, [ebp - 32]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edi, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebx]
    lea lea eax, [edi + 2]
    xor xor esi, esi
    push push esi
    mov mov dword ptr [ebp - 24], eax
    lea lea eax, [ebp + 12]
    push push eax
    push push 2
    push push dword ptr [ebx + 4]
    lea lea eax, [ebp - 32]
    push push esi
    push push esi
    push push eax
    push push 1
    mov mov dword ptr [ebp - 32], 10
    call sub_1009E13E
    test test eax, eax
    je L0
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], esi
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
    mov mov edx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 12]
    push push esi
    push push edx
    push push dword ptr [eax + 32]
    call sub_10084388
    cmp cmp eax, esi
    jl L1
    mov mov cx, word ptr [edi]
    mov mov eax, 01010F234h
    cmp cmp cx, word ptr [eax]
    jne sub_100844FA
    cmp cmp dword ptr [edx], 1
    jne sub_100844F2
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax + 32]
    cmp cmp dword ptr [eax + 4], 9
    jne sub_100844FE
    cmp cmp dword ptr [eax + 16], esi
    jne sub_10084503
    cmp cmp dword ptr [eax + 20], esi
    je L2
    push push edi
    push push 010110278h
    push push 0B54h
L0:
    jmp sub_10084561
    mov mov cx, word ptr [edi]
    mov mov eax, 01010F230h
    cmp cmp cx, word ptr [eax]
    jne L3
    cmp cmp dword ptr [edx], 1
    jne sub_10084568
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax + 32]
    cmp cmp dword ptr [eax + 4], 9
    jne sub_10084574
    cmp cmp dword ptr [eax + 16], 1
    jne sub_1008457A
    cmp cmp dword ptr [eax + 20], 4
    jne sub_10084580
    cmp cmp dword ptr [eax + 28], 3
    jae sub_10084504
    push push edi
    push push 010110220h
    push push 0B55h
L2:
    mov mov eax, dword ptr [ebx]
    mov mov eax, dword ptr [eax + 4]
    push push dword ptr [ebp + 8]
    add add eax, 24
    push push eax
    call sub_10067D2C
    add add esp, 20
    mov mov eax, 080004005h
    jmp sub_1008452F
FUN_100843e6 ENDP
END
