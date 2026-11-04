.686
.MODEL FLAT, C
EXTRN sub_10012B4E:PROC
EXTRN sub_100F5DA0:PROC
EXTRN sub_100F5DBD:PROC
EXTRN EXTRN fp_101D4AC4:DWORD:DWORD
EXTRN EXTRN g_101CE66C:DWORD:DWORD
EXTRN EXTRN g_101CE688:DWORD:DWORD
EXTRN EXTRN g_101CE6CC:DWORD:DWORD
EXTRN EXTRN g_101CE6DC:DWORD:DWORD
EXTRN EXTRN g_101CE7FC:DWORD:DWORD
.CODE
FUN_10012b90 PROC
    push push ecx
    mov mov eax, dword ptr [g_101CE688]
    push push ebx
    push push edi
    push push eax
    call dword ptr [fp_101D4AC4]
    lea lea edi, [esi + 24]
    push push edi
    lea lea ebx, [esi + 20]
    push push ebx
    push push 010193C84h
    push push eax
    call sub_100F5DA0
    mov mov ecx, dword ptr [g_101CE7FC]
    push push ecx
    call dword ptr [fp_101D4AC4]
    lea lea edx, [esp + 32]
    push push edx
    push push 010193C74h
    push push eax
    call sub_100F5DBD
    mov mov eax, dword ptr [esp + 44]
    mov mov ecx, dword ptr [edi]
    mov mov ebx, dword ptr [ebx]
    push push eax
    push push ecx
    call sub_10012B4E
    mov mov edx, dword ptr [g_101CE6CC]
    mov mov ecx, dword ptr [g_101CE66C]
    mov mov dword ptr [esi + 4], eax
    mov mov eax, dword ptr [edx + 8]
    mov mov dword ptr [esi + 12], eax
    mov mov edx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [g_101CE6DC]
    add add esp, 44
    mov mov dword ptr [esi + 16], edx
    mov mov byte ptr [esi + 8], 1
    mov mov dword ptr [esi], 0
    mov mov ecx, dword ptr [eax + 8]
    pop pop edi
    mov mov dword ptr [esi + 32], ecx
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10012b90 ENDP
END
