.686
.MODEL FLAT, C
EXTRN sub_100F6D37:PROC
EXTRN sub_100F6DF3:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10730550:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003df90 PROC
    mov eax, dword ptr [g_10730550]
    imul eax, eax, 000000CD0h
    add eax, 01072DEE0h
    push ebx
    xor ebx, ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    lea edi, [eax + 000000230h]
    mov ecx, 16
    mov esi, ebp
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov byte ptr [eax + 000000330h], 1
    mov byte ptr [eax + 000000331h], bl
    mov byte ptr [eax + 000000332h], bl
    mov byte ptr [eax + 000000333h], bl
    mov byte ptr [eax + 000000550h], bl
    mov byte ptr [eax + 000000551h], bl
    mov byte ptr [eax + 000000552h], bl
    mov byte ptr [eax + 000000553h], bl
    mov byte ptr [eax + 000000770h], bl
    mov byte ptr [eax + 000000771h], bl
    mov byte ptr [eax + 000000772h], bl
    mov byte ptr [eax + 000000773h], bl
    mov byte ptr [eax + 000000880h], bl
    mov byte ptr [eax + 000000881h], bl
    mov byte ptr [eax + 000000882h], bl
    mov byte ptr [eax + 000000883h], bl
    mov byte ptr [eax + 000000660h], bl
    mov byte ptr [eax + 000000661h], bl
    mov byte ptr [eax + 000000662h], bl
    mov byte ptr [eax + 000000663h], bl
    mov byte ptr [eax + 000000990h], bl
    mov byte ptr [eax + 000000991h], bl
    mov byte ptr [eax + 000000992h], bl
    mov byte ptr [eax + 000000993h], bl
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    jne L2
L0:
    mov ecx, dword ptr [g_101CE7EC]
    cmp dword ptr [ecx + 8], ebx
    je L1
    mov eax, dword ptr [g_10764584]
    cmp eax, ebx
    setne cl
    cmp cl, bl
    je L1
    push 010199438h
    push 010193358h
    push eax
    call sub_100F6DF3
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6D37
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push ebp
    push 2
    push eax
    call dword ptr [ecx + 0xb0]
    cmp dword ptr [g_1076A830], ebx
    jne L0
L2:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1003df90 ENDP
END
