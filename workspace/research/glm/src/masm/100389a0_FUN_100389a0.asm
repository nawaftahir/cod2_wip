.686
.MODEL FLAT, C
EXTRN sub_10013967:PROC
EXTRN sub_100139B4:PROC
EXTRN sub_10013A5B:PROC
EXTRN sub_100389C5:PROC
EXTRN sub_10061D2D:PROC
EXTRN g_101CE714:DWORD
EXTRN g_101CE7C4:DWORD
EXTRN g_101D1B08:DWORD
EXTRN g_101D1B0C:DWORD
EXTRN g_101D1B10:DWORD
EXTRN g_101D1B14:DWORD
EXTRN g_101D1B18:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D1BA0:DWORD
EXTRN g_101D1BA4:DWORD
EXTRN g_101D485C:DWORD
EXTRN g_101D4870:DWORD
EXTRN g_101D4898:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C4:DWORD
EXTRN g_1072DE40:DWORD
EXTRN g_10730554:DWORD
EXTRN g_10730558:DWORD
EXTRN g_1073055C:DWORD
.CODE
FUN_100389a0 PROC
    cmp ebx, 23
    ja L9
    jmp dword ptr [ebx*4 + 0x10038ba0]
    mov eax, dword ptr [g_101D1B0C]
    mov dword ptr [esi], eax
    mov byte ptr [edi], 1
    ret
    mov ecx, dword ptr [g_101D1B08]
    mov dword ptr [esi], ecx
    mov byte ptr [edi], 1
    ret
    mov edx, dword ptr [g_101D1B10]
    mov dword ptr [esi], edx
    mov byte ptr [edi], 1
    ret
    mov eax, dword ptr [g_101D1B14]
    mov dword ptr [esi], eax
    mov byte ptr [edi], 50
    ret
    mov eax, dword ptr [g_101D1B9C]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax + 00000010Ch]
    test ecx, ecx
    jne L1
L0:
    push 010198E14h
    push 1
    call sub_10061D2D
    mov eax, dword ptr [g_101D1B9C]
    add esp, 8
L1:
    mov ecx, dword ptr [eax + 00000010Ch]
    mov dword ptr [esi], ecx
    mov byte ptr [edi], 114
    ret
    mov edx, dword ptr [ebx*4 + 0101D1B08h]
    mov dword ptr [esi], edx
    mov byte ptr [edi], 50
    ret
    mov eax, dword ptr [g_101D1B18]
    mov dword ptr [esi], eax
    mov byte ptr [edi], 50
    ret
    cmp dword ptr [g_1072D9C4], 31
    jne L2
    mov ecx, dword ptr [g_1072D9BC]
    mov edx, dword ptr [ecx]
    push edx
    push 010198D20h
    push 0
    call sub_10013967
    add esp, 12
L2:
    mov eax, dword ptr [g_1072D9C4]
    mov edx, dword ptr [g_101D1B9C]
    lea ecx, [ebx + eax*4 - 8]
    mov eax, dword ptr [edx + 000000108h]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [g_101CE714]
    mov dword ptr [esi], ecx
    mov byte ptr [edi], 50
    mov ecx, edi
    mov edx, esi
    jmp sub_100389C5
    mov eax, dword ptr [g_101D1B9C]
    test eax, eax
    je L3
    mov ecx, dword ptr [eax + 000000200h]
    test ecx, ecx
    jne L4
L3:
    push 010198CECh
    push 1
    call sub_100139B4
    mov eax, dword ptr [g_101D1B9C]
    add esp, 8
L4:
    mov edx, dword ptr [eax + 000000200h]
    mov dword ptr [esi], edx
    mov byte ptr [edi], 50
    ret
    mov eax, dword ptr [g_101D4870]
    mov dword ptr [esi], eax
    mov byte ptr [edi], 50
    ret
    mov ecx, dword ptr [g_101CE7C4]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L6
    mov eax, dword ptr [g_1072DE40]
    cmp dword ptr [eax], 2
    jg L5
    mov ecx, dword ptr [eax + 4]
    test ch, 1
    je L6
L5:
    mov edx, dword ptr [g_101D485C]
    mov dword ptr [esi], edx
    mov byte ptr [edi], 50
    ret
L6:
    mov eax, dword ptr [g_101D1B08]
    mov dword ptr [esi], eax
    mov byte ptr [edi], 50
    ret
    mov ecx, dword ptr [g_1073055C]
    mov dword ptr [esi], ecx
    mov byte ptr [edi], 50
    ret
    mov eax, dword ptr [g_10730554]
    lea edx, [eax + eax*4]
    mov eax, dword ptr [edx*4 + 0101D4820h]
    mov dword ptr [esi], eax
    mov byte ptr [edi], 50
    ret
    mov eax, dword ptr [g_10730558]
    lea ecx, [eax + eax*4]
    mov edx, dword ptr [ecx*4 + 0101D4820h]
    mov dword ptr [esi], edx
    mov byte ptr [edi], 50
    ret
    mov eax, dword ptr [g_101D1B9C]
    test eax, eax
    je L7
    mov ecx, dword ptr [eax + 32]
    test ecx, ecx
    jne L8
L7:
    push 010198CBCh
    push 1
    call sub_10013A5B
    mov eax, dword ptr [g_101D1B9C]
    add esp, 8
L8:
    mov eax, dword ptr [eax + 32]
    mov dword ptr [esi], eax
    mov ecx, dword ptr [g_101D1B9C]
    mov dl, byte ptr [ecx + 36]
    mov byte ptr [edi], dl
    ret
    lea eax, [ebx - 17]
    imul eax, eax, 68
    mov ecx, dword ptr [eax + 0107305A0h]
    mov edx, dword ptr [ecx + 12]
    lea eax, [eax + 0107305A0h]
    mov dword ptr [esi], edx
    mov eax, dword ptr [eax]
    mov cl, byte ptr [eax + 16]
    mov byte ptr [edi], cl
    ret
    mov edx, dword ptr [g_101D4898]
    mov dword ptr [esi], edx
    mov byte ptr [edi], 49
    ret
    mov eax, dword ptr [g_101D1BA4]
    mov dword ptr [esi], eax
    mov byte ptr [edi], 50
    ret
    mov ecx, dword ptr [g_101D1BA0]
    mov dword ptr [esi], ecx
    mov byte ptr [edi], 50
    ret
L9:
    mov byte ptr [edi], 0
    mov dword ptr [esi], 0
    ret
FUN_100389a0 ENDP
END
