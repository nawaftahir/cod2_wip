.686
.MODEL FLAT, C
.CODE
FUN_1004cf60 PROC
    mov mov eax, dword ptr [esi + 4]
    push push 0ACh
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 01A0h], eax
    xor xor ecx, ecx
    mov mov dword ptr [eax], 01004C490h
    mov mov dword ptr [eax + 4], 01004CB30h
    add add esp, 12
    mov mov dword ptr [eax + 56], ecx
    mov mov dword ptr [eax + 40], ecx
    mov mov dword ptr [eax + 60], ecx
    mov mov dword ptr [eax + 44], ecx
    mov mov dword ptr [eax + 64], ecx
    mov mov dword ptr [eax + 48], ecx
    mov mov dword ptr [eax + 68], ecx
    mov mov dword ptr [eax + 52], ecx
    ret ret
FUN_1004cf60 ENDP
END
