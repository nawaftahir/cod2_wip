.686
.MODEL FLAT, C
EXTRN sub_1005F415:PROC
EXTRN sub_10061CE7:PROC
EXTRN sub_10061D01:PROC
EXTRN sub_100F7357:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1005f360 PROC
    mov mov eax, 01000h
    call sub_100F883A
    mov mov ecx, dword ptr [esp + 01004h]
    push push esi
    mov mov esi, dword ptr [g_101AAC70]
    imul imul esi, esi, 045Ch
    lea lea eax, [esp + 0100Ch]
    push push eax
    push push ecx
    lea lea edx, [esp + 12]
    push push edx
    add add esi, 0101A66B0h
    call sub_100F7357
    mov mov eax, dword ptr [g_101AAC70]
    add add esp, 12
    test test eax, eax
    je sub_1005F415
    mov mov ecx, dword ptr [esi + 0400h]
    lea lea eax, [esp + 4]
    push push eax
    mov mov eax, dword ptr [esi + 0410h]
    push push ecx
    lea lea edx, [esi + 041Ch]
    push push edx
    push push eax
    push push 01019B924h
    call sub_10061CE7
    add add esp, 20
    pop pop esi
    add add esp, 01000h
    ret ret
    lea lea ecx, [esp + 4]
    push push ecx
    push push 010193358h
    call sub_10061D01
    add add esp, 8
    pop pop esi
    add add esp, 01000h
    ret ret
FUN_1005f360 ENDP
END
