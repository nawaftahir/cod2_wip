.686
.MODEL FLAT, C
EXTRN sub_100010BF:PROC
EXTRN sub_100017D5:PROC
EXTRN sub_1000D29D:PROC
EXTRN sub_1000D36A:PROC
EXTRN sub_100136EA:PROC
EXTRN sub_100138CE:PROC
EXTRN sub_10013937:PROC
EXTRN sub_1001394D:PROC
EXTRN sub_10016DF7:PROC
EXTRN sub_10016E75:PROC
EXTRN sub_100174B2:PROC
EXTRN sub_10017540:PROC
EXTRN sub_1003AA85:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4B80:DWORD:DWORD
EXTRN EXTRN g_101CE648:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D481C:DWORD:DWORD
.CODE
FUN_100137f0 PROC
    push push ecx
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    cmp cmp eax, 088760868h
    jne L0
    xor xor al, al
    pop pop ecx
    ret ret
    push push 0101939FCh
    push push 0
    call dword ptr [fp_101D49C8]
    push push 1
    push push 0
    push push 010020330h
    push push 1
    call dword ptr [fp_101D4B80]
    add add esp, 24
    call sub_1000D29D
    call sub_100174B2
    call sub_10016DF7
    mov mov eax, dword ptr [g_101D1B9C]
    test test eax, eax
    je L1
    call sub_100017D5
    call sub_100136EA
    mov mov eax, dword ptr [g_101D1B9C]
    test test eax, eax
    je sub_100138CE
    mov mov edx, dword ptr [eax + 44]
    mov mov eax, dword ptr [eax + 40]
    push push edx
    call sub_100010BF
    mov mov ecx, dword ptr [g_101D1B9C]
    add add esp, 4
    mov mov dword ptr [ecx + 48], eax
    call sub_10017540
    call sub_10016E75
    call sub_1000D36A
    mov mov edx, dword ptr [g_101CE648]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_10013937
    push push 1
    push push 0
    push push 010020380h
    push push 1
    call dword ptr [fp_101D4B80]
    add add esp, 16
    jmp sub_1001394D
    lea lea ecx, [ecx]
    call sub_1003AA85
    push push 0101939D8h
    push push 0
    mov mov dword ptr [g_101D481C], eax
    call dword ptr [fp_101D49C8]
    add add esp, 8
FUN_100137f0 ENDP
END
