.686
.MODEL FLAT, C
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D60:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766760:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003ed20 PROC
    lea eax, [esi + esi*2]
    shl eax, 2
    mov ecx, dword ptr [eax + 010766750h]
    push ebp
    mov ebp, dword ptr [esp + 8]
    mov dword ptr [g_10766760], ecx
    mov dword ptr [eax + 010766750h], ebp
    mov dword ptr [eax + 010766754h], ebx
    mov dword ptr [eax + 010766758h], edi
    lea esp, [esp]
L0:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010198FF0h
    push 010193358h
    push eax
    call sub_100F6D60
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CA3
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edi
    push ebx
    push ebp
    push esi
    push eax
    call dword ptr [ecx + 0x190]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov dword ptr [g_10766760], 0
    pop ebp
    ret
FUN_1003ed20 ENDP
END
