.686
.MODEL FLAT, C
EXTRN sub_100010BF:PROC
EXTRN sub_100017D5:PROC
EXTRN sub_1000D29D:PROC
EXTRN sub_1000D36A:PROC
EXTRN sub_100136EA:PROC
EXTRN sub_10016DF7:PROC
EXTRN sub_10016E75:PROC
EXTRN sub_100174B2:PROC
EXTRN sub_10017540:PROC
EXTRN sub_1003AA85:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4B80:DWORD
EXTRN g_101CE648:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D481C:DWORD
.CODE
FUN_100137f0 PROC
    push ecx
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    cmp eax, 088760868h
    jne L0
    xor al, al
    pop ecx
    ret
L0:
    push 0101939FCh
    push 0
    call dword ptr [fp_101D49C8]
    push 1
    push 0
    push 010020330h
    push 1
    call dword ptr [fp_101D4B80]
    add esp, 24
    call sub_1000D29D
    call sub_100174B2
    call sub_10016DF7
    mov eax, dword ptr [g_101D1B9C]
    test eax, eax
    je L1
    call sub_100017D5
L1:
    call sub_100136EA
    mov eax, dword ptr [g_101D1B9C]
    test eax, eax
    je L2
    mov edx, dword ptr [eax + 44]
    mov eax, dword ptr [eax + 40]
    push edx
    call sub_100010BF
    mov ecx, dword ptr [g_101D1B9C]
    add esp, 4
    mov dword ptr [ecx + 48], eax
L2:
    call sub_10017540
    call sub_10016E75
    call sub_1000D36A
    mov edx, dword ptr [g_101CE648]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L3
    push 1
    push 0
    push 010020380h
    push 1
    call dword ptr [fp_101D4B80]
    add esp, 16
    jmp L3
    lea ecx, [ecx]
L3:
    call sub_1003AA85
    push 0101939D8h
    push 0
    mov dword ptr [g_101D481C], eax
    call dword ptr [fp_101D49C8]
    add esp, 8
FUN_100137f0 ENDP
END
