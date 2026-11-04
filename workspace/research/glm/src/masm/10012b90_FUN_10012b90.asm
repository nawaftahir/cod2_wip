.686
.MODEL FLAT, C
EXTRN sub_10012B4E:PROC
EXTRN sub_100F5DA0:PROC
EXTRN sub_100F5DBD:PROC
EXTRN fp_101D4AC4:DWORD
EXTRN g_101CE66C:DWORD
EXTRN g_101CE688:DWORD
EXTRN g_101CE6CC:DWORD
EXTRN g_101CE6DC:DWORD
EXTRN g_101CE7FC:DWORD
.CODE
FUN_10012b90 PROC
    push ecx
    mov eax, dword ptr [g_101CE688]
    push ebx
    push edi
    push eax
    call dword ptr [fp_101D4AC4]
    lea edi, [esi + 24]
    push edi
    lea ebx, [esi + 20]
    push ebx
    push 010193C84h
    push eax
    call sub_100F5DA0
    mov ecx, dword ptr [g_101CE7FC]
    push ecx
    call dword ptr [fp_101D4AC4]
    lea edx, [esp + 32]
    push edx
    push 010193C74h
    push eax
    call sub_100F5DBD
    mov eax, dword ptr [esp + 44]
    mov ecx, dword ptr [edi]
    mov ebx, dword ptr [ebx]
    push eax
    push ecx
    call sub_10012B4E
    mov edx, dword ptr [g_101CE6CC]
    mov ecx, dword ptr [g_101CE66C]
    mov dword ptr [esi + 4], eax
    mov eax, dword ptr [edx + 8]
    mov dword ptr [esi + 12], eax
    mov edx, dword ptr [ecx + 8]
    mov eax, dword ptr [g_101CE6DC]
    add esp, 44
    mov dword ptr [esi + 16], edx
    mov byte ptr [esi + 8], 1
    mov dword ptr [esi], 0
    mov ecx, dword ptr [eax + 8]
    pop edi
    mov dword ptr [esi + 32], ecx
    pop ebx
    pop ecx
    ret
FUN_10012b90 ENDP
END
