.686
.MODEL FLAT, C
EXTRN sub_1002C969:PROC
EXTRN sub_10038914:PROC
EXTRN sub_10038987:PROC
EXTRN sub_10038990:PROC
EXTRN sub_100389BE:PROC
EXTRN EXTRN g_101CE700:DWORD:DWORD
EXTRN EXTRN g_101CE7A0:DWORD:DWORD
EXTRN EXTRN g_101CE7F0:DWORD:DWORD
EXTRN EXTRN g_101D1B10:DWORD:DWORD
.CODE
FUN_10038920 PROC
    push push ecx
    mov mov eax, dword ptr [edx]
    cmp cmp dword ptr [eax], 3
    jne sub_10038987
    movzx movzx ecx, byte ptr [edi + 5]
    cmp cmp ecx, 5
    ja sub_10038990
    jmp jmp dword ptr [ecx*4 + 010038984h]
    mov mov eax, dword ptr [g_101CE7A0]
    mov mov ecx, esi
    call sub_10038914
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [g_101CE700]
    mov mov ecx, esi
    call L0
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [g_101CE7F0]
    cmp cmp dword ptr [eax + 8], 1
    jne sub_100389BE
    mov mov ecx, dword ptr [g_101D1B10]
    mov mov dword ptr [edx], ecx
    mov mov byte ptr [esi], 1
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [edi + 8]
    mov mov ecx, dword ptr [edx + 28]
    push push ecx
    push push eax
    call sub_1002C969
    add add esp, 8
    mov mov byte ptr [esi], 6
    pop pop ecx
    ret ret
FUN_10038920 ENDP
END
