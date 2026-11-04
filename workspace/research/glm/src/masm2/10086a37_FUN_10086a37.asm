.686
.MODEL FLAT, C
EXTRN sub_10085DCB:PROC
.CODE
FUN_10086a37 PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    call sub_10085DCB
    xor xor eax, eax
    mov mov dword ptr [esi + 0C0h], eax
    mov mov dword ptr [esi + 0C4h], eax
    mov mov dword ptr [esi + 0C8h], eax
    mov mov dword ptr [esi + 0CCh], eax
    mov mov dword ptr [esi + 0D0h], eax
    mov mov dword ptr [esi + 0E0h], eax
    mov mov dword ptr [esi + 0D8h], eax
    mov mov dword ptr [esi + 0DCh], eax
    or or eax, -1
    mov mov dword ptr [esi + 116], eax
    mov mov dword ptr [esi + 120], eax
    mov mov dword ptr [esi + 124], eax
    mov mov dword ptr [esi + 080h], eax
    mov mov dword ptr [esi + 084h], eax
    mov mov dword ptr [esi + 088h], eax
    mov mov dword ptr [esi + 08Ch], eax
    mov mov dword ptr [esi + 090h], eax
    mov mov dword ptr [esi + 094h], eax
    mov mov dword ptr [esi + 098h], eax
    mov mov dword ptr [esi + 09Ch], eax
    mov mov dword ptr [esi + 0A0h], eax
    mov mov dword ptr [esi + 0A8h], eax
    mov mov dword ptr [esi + 0ACh], eax
    mov mov dword ptr [esi + 0B0h], eax
    mov mov dword ptr [esi + 0B4h], eax
    mov mov dword ptr [esi + 0B8h], eax
    mov mov dword ptr [esi], 010110420h
    mov mov eax, esi
    pop pop esi
    ret ret
FUN_10086a37 ENDP
END
