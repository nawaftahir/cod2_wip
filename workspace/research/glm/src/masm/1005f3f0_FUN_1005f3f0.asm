.686
.MODEL FLAT, C
EXTRN sub_1005F2F7:PROC
EXTRN g_101AAC70:DWORD
EXTRN g_101AAC74:DWORD
EXTRN g_101AAC78:DWORD
.CODE
FUN_1005f3f0 PROC
    push esi
    mov esi, dword ptr [g_101AAC70]
    imul esi, esi, 00000045Ch
    add esi, 0101A66B0h
    mov al, byte ptr [esi + 000000404h]
    test al, al
    je L0
    push 01019B90Ch
    call sub_1005F2F7
    mov byte ptr [esi + 000000404h], 1
    mov eax, dword ptr [g_101AAC78]
    add esp, 4
    mov dword ptr [g_101AAC74], eax
    pop esi
    ret
L0:
    mov byte ptr [esi + 000000404h], 1
    mov ecx, dword ptr [g_101AAC78]
    mov dword ptr [g_101AAC74], ecx
    pop esi
    ret
FUN_1005f3f0 ENDP
END
