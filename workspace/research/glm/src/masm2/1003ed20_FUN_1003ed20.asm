.686
.MODEL FLAT, C
EXTRN sub_1003EDC6:PROC
EXTRN sub_1003EDD4:PROC
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D60:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766760:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003ed20 PROC
    lea lea eax, [esi + esi*2]
    shl shl eax, 2
    mov mov ecx, dword ptr [eax + 010766750h]
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    mov mov dword ptr [g_10766760], ecx
    mov mov dword ptr [eax + 010766750h], ebp
    mov mov dword ptr [eax + 010766754h], ebx
    mov mov dword ptr [eax + 010766758h], edi
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003EDC6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003EDD4
    push push 010198FF0h
    push push 010193358h
    push push eax
    call sub_100F6D60
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CA3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edi
    push push ebx
    push push ebp
    push push esi
    push push eax
    call call dword ptr [ecx + 0190h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003EDD4
    mov mov dword ptr [g_10766760], 0
    pop pop ebp
    ret ret
FUN_1003ed20 ENDP
END
