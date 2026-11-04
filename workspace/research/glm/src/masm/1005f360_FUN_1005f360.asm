.686
.MODEL FLAT, C
EXTRN sub_10061CE7:PROC
EXTRN sub_10061D01:PROC
EXTRN sub_100F7357:PROC
EXTRN sub_100F883A:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_1005f360 PROC
    mov eax, 000001000h
    call sub_100F883A
    mov ecx, dword ptr [esp + 000001004h]
    push esi
    mov esi, dword ptr [g_101AAC70]
    imul esi, esi, 00000045Ch
    lea eax, [esp + 00000100Ch]
    push eax
    push ecx
    lea edx, [esp + 12]
    push edx
    add esi, 0101A66B0h
    call sub_100F7357
    mov eax, dword ptr [g_101AAC70]
    add esp, 12
    test eax, eax
    je L0
    mov ecx, dword ptr [esi + 000000400h]
    lea eax, [esp + 4]
    push eax
    mov eax, dword ptr [esi + 000000410h]
    push ecx
    lea edx, [esi + 00000041Ch]
    push edx
    push eax
    push 01019B924h
    call sub_10061CE7
    add esp, 20
    pop esi
    add esp, 000001000h
    ret
L0:
    lea ecx, [esp + 4]
    push ecx
    push 010193358h
    call sub_10061D01
    add esp, 8
    pop esi
    add esp, 000001000h
    ret
FUN_1005f360 ENDP
END
