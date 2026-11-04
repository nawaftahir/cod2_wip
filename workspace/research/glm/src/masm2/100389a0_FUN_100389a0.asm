.686
.MODEL FLAT, C
EXTRN sub_10013967:PROC
EXTRN sub_100139B4:PROC
EXTRN sub_10013A5B:PROC
EXTRN sub_10038BFC:PROC
EXTRN sub_10038BFE:PROC
EXTRN sub_10038C10:PROC
EXTRN sub_10038CB7:PROC
EXTRN sub_10038CD2:PROC
EXTRN sub_10061D2D:PROC
EXTRN EXTRN g_101CE714:DWORD:DWORD
EXTRN EXTRN g_101CE7C4:DWORD:DWORD
EXTRN EXTRN g_101D1B08:DWORD:DWORD
EXTRN EXTRN g_101D1B0C:DWORD:DWORD
EXTRN EXTRN g_101D1B10:DWORD:DWORD
EXTRN EXTRN g_101D1B14:DWORD:DWORD
EXTRN EXTRN g_101D1B18:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D1BA0:DWORD:DWORD
EXTRN EXTRN g_101D1BA4:DWORD:DWORD
EXTRN EXTRN g_101D485C:DWORD:DWORD
EXTRN EXTRN g_101D4870:DWORD:DWORD
EXTRN EXTRN g_101D4898:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C4:DWORD:DWORD
EXTRN EXTRN g_1072DE40:DWORD:DWORD
EXTRN EXTRN g_10730554:DWORD:DWORD
EXTRN EXTRN g_10730558:DWORD:DWORD
EXTRN EXTRN g_1073055C:DWORD:DWORD
.CODE
FUN_100389a0 PROC
    cmp cmp ebx, 23
    ja L6
    jmp jmp dword ptr [ebx*4 + 010038BA0h]
    mov mov eax, dword ptr [g_101D1B0C]
    mov mov dword ptr [esi], eax
    mov mov byte ptr [edi], 1
    ret ret
    mov mov ecx, dword ptr [g_101D1B08]
    mov mov dword ptr [esi], ecx
    mov mov byte ptr [edi], 1
    ret ret
    mov mov edx, dword ptr [g_101D1B10]
    mov mov dword ptr [esi], edx
    mov mov byte ptr [edi], 1
    ret ret
    mov mov eax, dword ptr [g_101D1B14]
    mov mov dword ptr [esi], eax
    mov mov byte ptr [edi], 50
    ret ret
    mov mov eax, dword ptr [g_101D1B9C]
    test test eax, eax
    je L1
    mov mov ecx, dword ptr [eax + 010Ch]
    test test ecx, ecx
    jne L2
    push push 010198E14h
    push push 1
    call sub_10061D2D
    mov mov eax, dword ptr [g_101D1B9C]
    add add esp, 8
    mov mov ecx, dword ptr [eax + 010Ch]
    mov mov dword ptr [esi], ecx
    mov mov byte ptr [edi], 114
    ret ret
    mov mov edx, dword ptr [ebx*4 + 0101D1B08h]
    mov mov dword ptr [esi], edx
    mov mov byte ptr [edi], 50
    ret ret
    mov mov eax, dword ptr [g_101D1B18]
    mov mov dword ptr [esi], eax
    mov mov byte ptr [edi], 50
    ret ret
    cmp cmp dword ptr [g_1072D9C4], 31
    jne L3
    mov mov ecx, dword ptr [g_1072D9BC]
L1:
    mov mov edx, dword ptr [ecx]
    push push edx
    push push 010198D20h
    push push 0
    call sub_10013967
    add add esp, 12
    mov mov eax, dword ptr [g_1072D9C4]
    mov mov edx, dword ptr [g_101D1B9C]
    lea lea ecx, [ebx + eax*4 - 8]
    mov mov eax, dword ptr [edx + 0108h]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [g_101CE714]
    mov mov dword ptr [esi], ecx
    mov mov byte ptr [edi], 50
    mov mov ecx, edi
    mov mov edx, esi
    jmp L0
    mov mov eax, dword ptr [g_101D1B9C]
    test test eax, eax
    je L4
    mov mov ecx, dword ptr [eax + 0200h]
    test test ecx, ecx
    jne L5
    push push 010198CECh
    push push 1
    call sub_100139B4
    mov mov eax, dword ptr [g_101D1B9C]
    add add esp, 8
    mov mov edx, dword ptr [eax + 0200h]
    mov mov dword ptr [esi], edx
    mov mov byte ptr [edi], 50
    ret ret
    mov mov eax, dword ptr [g_101D4870]
    mov mov dword ptr [esi], eax
    mov mov byte ptr [edi], 50
    ret ret
    mov mov ecx, dword ptr [g_101CE7C4]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je sub_10038BFE
    mov mov eax, dword ptr [g_1072DE40]
    cmp cmp dword ptr [eax], 2
    jg sub_10038BFC
    mov mov ecx, dword ptr [eax + 4]
    test test ch, 1
    je sub_10038C10
    mov mov edx, dword ptr [g_101D485C]
    mov mov dword ptr [esi], edx
    mov mov byte ptr [edi], 50
    ret ret
    mov mov eax, dword ptr [g_101D1B08]
    mov mov dword ptr [esi], eax
    mov mov byte ptr [edi], 50
    ret ret
    mov mov ecx, dword ptr [g_1073055C]
    mov mov dword ptr [esi], ecx
    mov mov byte ptr [edi], 50
    ret ret
    mov mov eax, dword ptr [g_10730554]
    lea lea edx, [eax + eax*4]
    mov mov eax, dword ptr [edx*4 + 0101D4820h]
    mov mov dword ptr [esi], eax
    mov mov byte ptr [edi], 50
    ret ret
    mov mov eax, dword ptr [g_10730558]
    lea lea ecx, [eax + eax*4]
    mov mov edx, dword ptr [ecx*4 + 0101D4820h]
    mov mov dword ptr [esi], edx
    mov mov byte ptr [edi], 50
    ret ret
    mov mov eax, dword ptr [g_101D1B9C]
    test test eax, eax
    je sub_10038CB7
    mov mov ecx, dword ptr [eax + 32]
    test test ecx, ecx
    jne sub_10038CD2
    push push 010198CBCh
    push push 1
    call sub_10013A5B
    mov mov eax, dword ptr [g_101D1B9C]
    add add esp, 8
    mov mov eax, dword ptr [eax + 32]
    mov mov dword ptr [esi], eax
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov dl, byte ptr [ecx + 36]
    mov mov byte ptr [edi], dl
    ret ret
    lea lea eax, [ebx - 17]
    imul imul eax, eax, 68
    mov mov ecx, dword ptr [eax + 0107305A0h]
    mov mov edx, dword ptr [ecx + 12]
    lea lea eax, [eax + 0107305A0h]
    mov mov dword ptr [esi], edx
    mov mov eax, dword ptr [eax]
    mov mov cl, byte ptr [eax + 16]
    mov mov byte ptr [edi], cl
    ret ret
    mov mov edx, dword ptr [g_101D4898]
    mov mov dword ptr [esi], edx
    mov mov byte ptr [edi], 49
    ret ret
    mov mov eax, dword ptr [g_101D1BA4]
L5:
    mov mov dword ptr [esi], eax
    mov mov byte ptr [edi], 50
    ret ret
    mov mov ecx, dword ptr [g_101D1BA0]
    mov mov dword ptr [esi], ecx
    mov mov byte ptr [edi], 50
    ret ret
    mov mov byte ptr [edi], 0
    mov mov dword ptr [esi], 0
L6:
    ret ret
FUN_100389a0 ENDP
END
