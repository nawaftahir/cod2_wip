.686
.MODEL FLAT, C
EXTRN sub_1003E2A8:PROC
EXTRN sub_1003E52C:PROC
EXTRN sub_100F6D32:PROC
EXTRN sub_100F6D91:PROC
EXTRN sub_100F6DEE:PROC
EXTRN sub_100F6E4E:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10730550:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003e300 PROC
    push ebx
    mov edx, edi
    call sub_1003E2A8
    mov eax, dword ptr [g_10730550]
    xor ebx, ebx
    imul eax, eax, 000000CD0h
    add eax, 01072DEE0h
    mov cl, 1
    mov byte ptr [eax + 000000330h], cl
    mov byte ptr [eax + 000000331h], bl
    mov byte ptr [eax + 000000332h], bl
    mov byte ptr [eax + 000000333h], bl
    mov byte ptr [eax + 000000440h], cl
    mov byte ptr [eax + 000000441h], bl
    mov byte ptr [eax + 000000442h], bl
    mov byte ptr [eax + 000000443h], bl
    mov byte ptr [eax + 000000550h], bl
    mov byte ptr [eax + 000000551h], bl
    mov byte ptr [eax + 000000552h], bl
    mov byte ptr [eax + 000000553h], bl
    mov byte ptr [eax + 000000770h], cl
    mov byte ptr [eax + 000000771h], cl
    mov byte ptr [eax + 000000772h], bl
    mov byte ptr [eax + 000000773h], bl
    mov byte ptr [eax + 000000880h], bl
    mov byte ptr [eax + 000000881h], bl
    mov byte ptr [eax + 000000882h], bl
    mov byte ptr [eax + 000000883h], bl
    mov byte ptr [eax + 000000990h], bl
    mov byte ptr [eax + 000000991h], bl
    mov byte ptr [eax + 000000992h], bl
    mov byte ptr [eax + 000000993h], bl
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    jne sub_1003E52C
    push esi
    lea esi, [edi + 72]
    nop
L0:
    mov ecx, dword ptr [g_101CE7EC]
    cmp dword ptr [ecx + 8], ebx
    je L1
    mov eax, dword ptr [g_10764584]
    cmp eax, ebx
    setne cl
    cmp cl, bl
    je L1
    push 01019936Ch
    push 010193358h
    push eax
    call sub_100F6DEE
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6D32
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 2
    push eax
    call dword ptr [ecx + 0xb0]
    cmp dword ptr [g_1076A830], ebx
    jne L0
    lea esi, [edi + 000000088h]
    jmp L2
    lea esp, [esp]
L2:
    mov edx, dword ptr [g_101CE7EC]
    cmp dword ptr [edx + 8], ebx
    je L3
    mov eax, dword ptr [g_10764584]
    cmp eax, ebx
    setne cl
    cmp cl, bl
    je L3
    push 010199320h
    push 010193358h
    push eax
    call sub_100F6E4E
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D91
    add esp, 16
L3:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 3
    push eax
    call dword ptr [ecx + 0xb0]
FUN_1003e300 ENDP
END
