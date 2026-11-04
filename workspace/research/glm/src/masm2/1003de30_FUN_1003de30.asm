.686
.MODEL FLAT, C
EXTRN sub_1003E075:PROC
EXTRN sub_1003E083:PROC
EXTRN sub_1003E084:PROC
EXTRN sub_1003E087:PROC
EXTRN sub_100F6D73:PROC
EXTRN sub_100F6E2F:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003de30 PROC
    mov mov eax, dword ptr [g_10730550]
    mov mov ecx, dword ptr [esp + 4]
    imul imul eax, eax, 0CD0h
    add add eax, 01072DEE0h
    mov mov edx, dword ptr [g_101CE708]
    push push ebx
    xor xor ebx, ebx
    mov mov dword ptr [eax], ecx
    mov mov byte ptr [eax + 0110h], 1
    mov mov byte ptr [eax + 0111h], bl
    mov mov byte ptr [eax + 0112h], bl
    mov mov byte ptr [eax + 0113h], bl
    mov mov byte ptr [eax + 0550h], bl
    mov mov byte ptr [eax + 0551h], bl
    mov mov byte ptr [eax + 0552h], bl
    mov mov byte ptr [eax + 0553h], bl
    mov mov byte ptr [eax + 0880h], bl
    mov mov byte ptr [eax + 0881h], bl
    mov mov byte ptr [eax + 0882h], bl
    mov mov byte ptr [eax + 0883h], bl
    mov mov byte ptr [eax + 0220h], bl
    mov mov byte ptr [eax + 0221h], bl
    mov mov byte ptr [eax + 0222h], bl
    mov mov byte ptr [eax + 0223h], bl
    mov mov byte ptr [eax + 0660h], bl
    mov mov byte ptr [eax + 0661h], bl
    mov mov byte ptr [eax + 0662h], bl
    mov mov byte ptr [eax + 0663h], bl
    mov mov byte ptr [eax + 0990h], bl
    mov mov byte ptr [eax + 0991h], bl
    mov mov byte ptr [eax + 0992h], bl
    mov mov byte ptr [eax + 0993h], bl
    mov mov byte ptr [eax + 0AA0h], bl
    mov mov byte ptr [eax + 0AA1h], bl
    mov mov byte ptr [eax + 0AA2h], bl
    mov mov byte ptr [eax + 0AA3h], bl
    mov mov byte ptr [eax + 0BB0h], bl
    mov mov byte ptr [eax + 0BB1h], bl
    mov mov byte ptr [eax + 0BB2h], bl
    mov mov byte ptr [eax + 0BB3h], bl
    mov mov byte ptr [eax + 0CC0h], bl
    mov mov byte ptr [eax + 0CC1h], bl
    mov mov byte ptr [eax + 0CC2h], bl
    mov mov byte ptr [eax + 0CC3h], bl
    cmp cmp dword ptr [edx + 8], 2
    jne sub_1003E084
    push push esi
    lea lea esi, [eax + 16]
    mov mov eax, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [eax + 8], ebx
    je sub_1003E075
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, ebx
    setne setne cl
    cmp cmp cl, bl
    je sub_1003E083
    push push 010199468h
    push push 010193358h
    push push eax
    call sub_100F6E2F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6D73
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push esi
    push push 0100h
    push push eax
    call call dword ptr [edx + 0B0h]
    cmp cmp dword ptr [g_1076A830], ebx
    jne sub_1003E087
    pop pop esi
    pop pop ebx
    ret ret
FUN_1003de30 ENDP
END
