.686
.MODEL FLAT, C
EXTRN sub_1004A1C3:PROC
EXTRN sub_1004A1F3:PROC
EXTRN sub_1004A1FB:PROC
EXTRN sub_1004A201:PROC
EXTRN sub_1004A210:PROC
EXTRN sub_1004A219:PROC
.CODE
FUN_1004a130 PROC
    mov mov eax, dword ptr [esi + 20]
    cmp cmp eax, 0C8h
    je L0
    cmp cmp eax, 0C9h
    je L1
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 20
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 20]
    mov mov dword ptr [ecx + 24], edx
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, esi
    call sub_1004A201
    mov mov ecx, eax
    dec dec ecx
L0:
    je sub_1004A1F3
    dec dec ecx
    jne sub_1004A1FB
    mov mov al, byte ptr [esp + 4]
    test test al, al
    je sub_1004A1C3
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 51
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 4]
    test test eax, eax
    je sub_1004A210
    push push 1
    push push esi
    call call dword ptr [eax + 36]
    mov mov al, byte ptr [esi + 16]
    add add esp, 8
    test test al, al
    je sub_1004A219
    mov mov dword ptr [esi + 20], 0C8h
    mov mov dword ptr [esi + 0114h], 0
    mov mov eax, 2
    ret ret
    mov mov dword ptr [esi + 20], 100
    mov mov eax, 2
    ret ret
    mov mov eax, 1
    ret ret
FUN_1004a130 ENDP
END
