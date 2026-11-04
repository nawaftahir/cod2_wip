.686
.MODEL FLAT, C
EXTRN sub_1003E249:PROC
EXTRN sub_1003E291:PROC
EXTRN sub_1003E292:PROC
EXTRN sub_1003E2A0:PROC
EXTRN sub_100F6D01:PROC
EXTRN sub_100F6DBE:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_1003e130 PROC
    mov mov eax, dword ptr [g_10730550]
    mov mov ecx, dword ptr [g_101CE708]
    imul imul eax, eax, 0CD0h
    add add eax, 01072DEE0h
    push push ebx
    xor xor ebx, ebx
    mov mov byte ptr [eax + 0440h], 1
    mov mov byte ptr [eax + 0441h], bl
    mov mov byte ptr [eax + 0442h], bl
    mov mov byte ptr [eax + 0443h], bl
    mov mov byte ptr [eax + 0770h], bl
    mov mov byte ptr [eax + 0771h], bl
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
    cmp cmp dword ptr [ecx + 8], 2
    jne sub_1003E291
    push push esi
    lea lea esi, [eax + 0340h]
    jmp sub_1003E249
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [edx + 8], ebx
    je sub_1003E292
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, ebx
    setne setne cl
    cmp cmp cl, bl
    je sub_1003E2A0
    push push 0101993B0h
    push push 010193358h
    push push eax
    call sub_100F6DBE
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D01
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 3
    push push eax
    call call dword ptr [ecx + 0B0h]
FUN_1003e130 ENDP
END
