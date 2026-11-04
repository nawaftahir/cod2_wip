.686
.MODEL FLAT, C
EXTRN sub_1003E15D:PROC
EXTRN sub_1003E16B:PROC
EXTRN sub_100F6D37:PROC
EXTRN sub_100F6DF3:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003df90 PROC
    mov mov eax, dword ptr [g_10730550]
    imul imul eax, eax, 0CD0h
    add add eax, 01072DEE0h
    push push ebx
    xor xor ebx, ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    lea lea edi, [eax + 0230h]
    mov mov ecx, 16
    mov mov esi, ebp
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov byte ptr [eax + 0330h], 1
    mov mov byte ptr [eax + 0331h], bl
    mov mov byte ptr [eax + 0332h], bl
    mov mov byte ptr [eax + 0333h], bl
    mov mov byte ptr [eax + 0550h], bl
    mov mov byte ptr [eax + 0551h], bl
    mov mov byte ptr [eax + 0552h], bl
    mov mov byte ptr [eax + 0553h], bl
    mov mov byte ptr [eax + 0770h], bl
    mov mov byte ptr [eax + 0771h], bl
    mov mov byte ptr [eax + 0772h], bl
    mov mov byte ptr [eax + 0773h], bl
    mov mov byte ptr [eax + 0880h], bl
    mov mov byte ptr [eax + 0881h], bl
    mov mov byte ptr [eax + 0882h], bl
    mov mov byte ptr [eax + 0883h], bl
    mov mov byte ptr [eax + 0660h], bl
    mov mov byte ptr [eax + 0661h], bl
    mov mov byte ptr [eax + 0662h], bl
    mov mov byte ptr [eax + 0663h], bl
    mov mov byte ptr [eax + 0990h], bl
    mov mov byte ptr [eax + 0991h], bl
    mov mov byte ptr [eax + 0992h], bl
    mov mov byte ptr [eax + 0993h], bl
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    jne sub_1003E16B
    mov mov ecx, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [ecx + 8], ebx
    je sub_1003E15D
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, ebx
    setne setne cl
    cmp cmp cl, bl
    je sub_1003E16B
    push push 010199438h
    push push 010193358h
    push push eax
    call sub_100F6DF3
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6D37
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push ebp
    push push 2
    push push eax
    call call dword ptr [ecx + 0B0h]
    cmp cmp dword ptr [g_1076A830], ebx
    jne sub_1003E16B
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1003df90 ENDP
END
