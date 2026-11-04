.686
.MODEL FLAT, C
EXTRN sub_100F6D73:PROC
EXTRN sub_100F6E2F:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10730550:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003de30 PROC
    mov eax, dword ptr [g_10730550]
    mov ecx, dword ptr [esp + 4]
    imul eax, eax, 000000CD0h
    add eax, 01072DEE0h
    mov edx, dword ptr [g_101CE708]
    push ebx
    xor ebx, ebx
    mov dword ptr [eax], ecx
    mov byte ptr [eax + 000000110h], 1
    mov byte ptr [eax + 000000111h], bl
    mov byte ptr [eax + 000000112h], bl
    mov byte ptr [eax + 000000113h], bl
    mov byte ptr [eax + 000000550h], bl
    mov byte ptr [eax + 000000551h], bl
    mov byte ptr [eax + 000000552h], bl
    mov byte ptr [eax + 000000553h], bl
    mov byte ptr [eax + 000000880h], bl
    mov byte ptr [eax + 000000881h], bl
    mov byte ptr [eax + 000000882h], bl
    mov byte ptr [eax + 000000883h], bl
    mov byte ptr [eax + 000000220h], bl
    mov byte ptr [eax + 000000221h], bl
    mov byte ptr [eax + 000000222h], bl
    mov byte ptr [eax + 000000223h], bl
    mov byte ptr [eax + 000000660h], bl
    mov byte ptr [eax + 000000661h], bl
    mov byte ptr [eax + 000000662h], bl
    mov byte ptr [eax + 000000663h], bl
    mov byte ptr [eax + 000000990h], bl
    mov byte ptr [eax + 000000991h], bl
    mov byte ptr [eax + 000000992h], bl
    mov byte ptr [eax + 000000993h], bl
    mov byte ptr [eax + 000000AA0h], bl
    mov byte ptr [eax + 000000AA1h], bl
    mov byte ptr [eax + 000000AA2h], bl
    mov byte ptr [eax + 000000AA3h], bl
    mov byte ptr [eax + 000000BB0h], bl
    mov byte ptr [eax + 000000BB1h], bl
    mov byte ptr [eax + 000000BB2h], bl
    mov byte ptr [eax + 000000BB3h], bl
    mov byte ptr [eax + 000000CC0h], bl
    mov byte ptr [eax + 000000CC1h], bl
    mov byte ptr [eax + 000000CC2h], bl
    mov byte ptr [eax + 000000CC3h], bl
    cmp dword ptr [edx + 8], 2
    jne L2
    push esi
    lea esi, [eax + 16]
L0:
    mov eax, dword ptr [g_101CE7EC]
    cmp dword ptr [eax + 8], ebx
    je L1
    mov eax, dword ptr [g_10764584]
    cmp eax, ebx
    setne cl
    cmp cl, bl
    je L1
    push 010199468h
    push 010193358h
    push eax
    call sub_100F6E2F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6D73
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push esi
    push 000000100h
    push eax
    call dword ptr [edx + 0xb0]
    cmp dword ptr [g_1076A830], ebx
    jne L0
    pop esi
L2:
    pop ebx
    ret
FUN_1003de30 ENDP
END
