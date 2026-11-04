.686
.MODEL FLAT, C
EXTRN sub_1003E2A8:PROC
EXTRN sub_1003E4C3:PROC
EXTRN sub_1003E4D1:PROC
EXTRN sub_1003E52C:PROC
EXTRN sub_1003E539:PROC
EXTRN sub_1003E582:PROC
EXTRN sub_1003E590:PROC
EXTRN sub_100F6D32:PROC
EXTRN sub_100F6D91:PROC
EXTRN sub_100F6DEE:PROC
EXTRN sub_100F6E4E:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003e300 PROC
    push push ebx
    mov mov edx, edi
    call sub_1003E2A8
    mov mov eax, dword ptr [g_10730550]
    xor xor ebx, ebx
    imul imul eax, eax, 0CD0h
    add add eax, 01072DEE0h
    mov mov cl, 1
    mov mov byte ptr [eax + 0330h], cl
    mov mov byte ptr [eax + 0331h], bl
    mov mov byte ptr [eax + 0332h], bl
    mov mov byte ptr [eax + 0333h], bl
    mov mov byte ptr [eax + 0440h], cl
    mov mov byte ptr [eax + 0441h], bl
    mov mov byte ptr [eax + 0442h], bl
    mov mov byte ptr [eax + 0443h], bl
    mov mov byte ptr [eax + 0550h], bl
    mov mov byte ptr [eax + 0551h], bl
    mov mov byte ptr [eax + 0552h], bl
    mov mov byte ptr [eax + 0553h], bl
    mov mov byte ptr [eax + 0770h], cl
    mov mov byte ptr [eax + 0771h], cl
    mov mov byte ptr [eax + 0772h], bl
    mov mov byte ptr [eax + 0773h], bl
    mov mov byte ptr [eax + 0880h], bl
    mov mov byte ptr [eax + 0881h], bl
    mov mov byte ptr [eax + 0882h], bl
    mov mov byte ptr [eax + 0883h], bl
    mov mov byte ptr [eax + 0990h], bl
    mov mov byte ptr [eax + 0991h], bl
    mov mov byte ptr [eax + 0992h], bl
    mov mov byte ptr [eax + 0993h], bl
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    jne sub_1003E52C
    push push esi
    lea lea esi, [edi + 72]
    nop nop
    mov mov ecx, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [ecx + 8], ebx
    je sub_1003E4C3
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, ebx
    setne setne cl
    cmp cmp cl, bl
    je sub_1003E4D1
    push push 01019936Ch
    push push 010193358h
    push push eax
    call sub_100F6DEE
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6D32
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 2
    push push eax
    call call dword ptr [ecx + 0B0h]
    cmp cmp dword ptr [g_1076A830], ebx
    jne sub_1003E4D1
    lea lea esi, [edi + 088h]
    jmp sub_1003E539
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [edx + 8], ebx
    je sub_1003E582
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, ebx
    setne setne cl
    cmp cmp cl, bl
    je sub_1003E590
    push push 010199320h
    push push 010193358h
    push push eax
    call sub_100F6E4E
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D91
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 3
    push push eax
    call call dword ptr [ecx + 0B0h]
FUN_1003e300 ENDP
END
