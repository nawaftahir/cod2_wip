.686
.MODEL FLAT, C
EXTRN sub_1005F2F7:PROC
EXTRN sub_1005F44A:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101AAC74:DWORD:DWORD
EXTRN EXTRN g_101AAC78:DWORD:DWORD
.CODE
FUN_1005f3f0 PROC
    push push esi
    mov mov esi, dword ptr [g_101AAC70]
    imul imul esi, esi, 045Ch
    add add esi, 0101A66B0h
    mov mov al, byte ptr [esi + 0404h]
    test test al, al
    je sub_1005F44A
    push push 01019B90Ch
    call sub_1005F2F7
    mov mov byte ptr [esi + 0404h], 1
    mov mov eax, dword ptr [g_101AAC78]
    add add esp, 4
    mov mov dword ptr [g_101AAC74], eax
    pop pop esi
    ret ret
    mov mov byte ptr [esi + 0404h], 1
    mov mov ecx, dword ptr [g_101AAC78]
    mov mov dword ptr [g_101AAC74], ecx
    pop pop esi
    ret ret
FUN_1005f3f0 ENDP
END
