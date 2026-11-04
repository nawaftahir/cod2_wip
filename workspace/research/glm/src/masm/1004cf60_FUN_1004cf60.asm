.686
.MODEL FLAT, C
.CODE
FUN_1004cf60 PROC
    mov eax, dword ptr [esi + 4]
    push 0000000ACh
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0000001A0h], eax
    xor ecx, ecx
    mov dword ptr [eax], 01004C490h
    mov dword ptr [eax + 4], 01004CB30h
    add esp, 12
    mov dword ptr [eax + 56], ecx
    mov dword ptr [eax + 40], ecx
    mov dword ptr [eax + 60], ecx
    mov dword ptr [eax + 44], ecx
    mov dword ptr [eax + 64], ecx
    mov dword ptr [eax + 48], ecx
    mov dword ptr [eax + 68], ecx
    mov dword ptr [eax + 52], ecx
    ret
FUN_1004cf60 ENDP
END
