.686
.MODEL FLAT, C
EXTRN sub_10085DCB:PROC
.CODE
FUN_10086a37 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    call sub_10085DCB
    xor eax, eax
    mov dword ptr [esi + 0000000C0h], eax
    mov dword ptr [esi + 0000000C4h], eax
    mov dword ptr [esi + 0000000C8h], eax
    mov dword ptr [esi + 0000000CCh], eax
    mov dword ptr [esi + 0000000D0h], eax
    mov dword ptr [esi + 0000000E0h], eax
    mov dword ptr [esi + 0000000D8h], eax
    mov dword ptr [esi + 0000000DCh], eax
    or eax, 0FFFFFFFFh
    mov dword ptr [esi + 116], eax
    mov dword ptr [esi + 120], eax
    mov dword ptr [esi + 124], eax
    mov dword ptr [esi + 000000080h], eax
    mov dword ptr [esi + 000000084h], eax
    mov dword ptr [esi + 000000088h], eax
    mov dword ptr [esi + 00000008Ch], eax
    mov dword ptr [esi + 000000090h], eax
    mov dword ptr [esi + 000000094h], eax
    mov dword ptr [esi + 000000098h], eax
    mov dword ptr [esi + 00000009Ch], eax
    mov dword ptr [esi + 0000000A0h], eax
    mov dword ptr [esi + 0000000A8h], eax
    mov dword ptr [esi + 0000000ACh], eax
    mov dword ptr [esi + 0000000B0h], eax
    mov dword ptr [esi + 0000000B4h], eax
    mov dword ptr [esi + 0000000B8h], eax
    mov dword ptr [esi], 010110420h
    mov eax, esi
    pop esi
    ret
FUN_10086a37 ENDP
END
