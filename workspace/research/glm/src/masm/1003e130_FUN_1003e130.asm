.686
.MODEL FLAT, C
EXTRN sub_1003E291:PROC
EXTRN sub_100F6D01:PROC
EXTRN sub_100F6DBE:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10730550:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_1003e130 PROC
    mov eax, dword ptr [g_10730550]
    mov ecx, dword ptr [g_101CE708]
    imul eax, eax, 000000CD0h
    add eax, 01072DEE0h
    push ebx
    xor ebx, ebx
    mov byte ptr [eax + 000000440h], 1
    mov byte ptr [eax + 000000441h], bl
    mov byte ptr [eax + 000000442h], bl
    mov byte ptr [eax + 000000443h], bl
    mov byte ptr [eax + 000000770h], bl
    mov byte ptr [eax + 000000771h], bl
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
    cmp dword ptr [ecx + 8], 2
    jne sub_1003E291
    push esi
    lea esi, [eax + 000000340h]
    jmp L0
    lea esp, [esp]
L0:
    mov edx, dword ptr [g_101CE7EC]
    cmp dword ptr [edx + 8], ebx
    je L1
    mov eax, dword ptr [g_10764584]
    cmp eax, ebx
    setne cl
    cmp cl, bl
    je L1
    push 0101993B0h
    push 010193358h
    push eax
    call sub_100F6DBE
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D01
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 3
    push eax
    call dword ptr [ecx + 0xb0]
FUN_1003e130 ENDP
END
