.686
.MODEL FLAT, C
EXTRN sub_10007D7A:PROC
EXTRN sub_1000A906:PROC
EXTRN sub_100150B3:PROC
EXTRN sub_1001E697:PROC
EXTRN sub_100219DF:PROC
EXTRN sub_10022361:PROC
EXTRN sub_1002450A:PROC
EXTRN sub_1002541A:PROC
EXTRN sub_10027D90:PROC
EXTRN sub_10027DEE:PROC
EXTRN sub_10027FFB:PROC
EXTRN sub_10028219:PROC
EXTRN sub_100F8840:PROC
EXTRN fp_101D4C00:DWORD
EXTRN fp_101D4C64:DWORD
EXTRN g_101CE6E4:DWORD
EXTRN g_101CE6FC:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE730:DWORD
EXTRN g_101CE7C4:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_10678AB8:DWORD
EXTRN g_10678ABC:DWORD
.CODE
FUN_10025380 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    mov eax, 0000016ECh
    call sub_100F8840
    push ebx
    push esi
    push edi
    mov esi, ecx
    call sub_10007D7A
    mov ecx, dword ptr [g_101D1B9C]
    test ecx, ecx
    je L0
    mov edx, dword ptr [ecx + 000000100h]
    test edx, edx
    je L0
    push eax
    mov edi, esi
    call sub_1000A906
    add esp, 4
L0:
    call dword ptr [fp_101D4C00]
    call dword ptr [fp_101D4C64]
    mov esi, dword ptr [g_10678AB8]
    mov ebx, dword ptr [g_10678ABC]
    mov eax, esi
    mov ecx, ebx
    call sub_1002450A
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    jne L1
    xor edi, edi
    jmp L3
L1:
    mov ecx, dword ptr [g_101CE7C4]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L8
    mov edi, dword ptr [ebp + 12]
    lea edx, [esp + 16]
    push edx
    push edi
    mov dword ptr [esp + 20], 1
    call sub_10027D90
    push 010027170h
    push 24
    lea eax, [esp + 0000000E0h]
    push eax
    lea ecx, [esp + 36]
    push ecx
    call sub_10028219
    lea edx, [esp + 40]
    push edx
    push edi
    lea edi, [esp + 0000000F0h]
    call sub_10027FFB
    add esp, 32
L2:
    mov edi, dword ptr [esp + 12]
L3:
    mov ecx, dword ptr [g_101CE708]
    mov edx, dword ptr [ecx + 8]
    xor eax, eax
    cmp edx, 2
    je L4
    mov edx, dword ptr [g_101CE6FC]
    mov ecx, dword ptr [edx + 8]
    test ecx, ecx
    je L4
    lea eax, [esp + 000000AF8h]
    push eax
    push esi
    push ebx
    mov eax, 000000100h
    call sub_100150B3
    add esp, 12
L4:
    push eax
    mov eax, dword ptr [ebp + 16]
    lea ecx, [esp + 000000AFCh]
    push ecx
    lea edx, [esp + 0000000D8h]
    push edx
    mov edx, dword ptr [ebp + 8]
    push edi
    push ebx
    push eax
    mov eax, dword ptr [ebp + 12]
    mov ecx, esi
    call sub_1002541A
    mov ecx, dword ptr [g_101CE6E4]
    mov eax, dword ptr [ecx + 8]
    add esp, 24
    test eax, eax
    je L6
    test al, 2
    je L5
    push 0
    push 03F800000h
    push 010191488h
    push 6
    call sub_10022361
    add esp, 16
L5:
    push 0
    push 29
    push esi
    push ebx
    call sub_100219DF
    add esp, 16
L6:
    call sub_1001E697
    cmp edi, 1
    jne L7
    mov edx, dword ptr [g_101CE730]
    mov al, byte ptr [edx + 8]
    test al, al
    je L7
    call sub_10027DEE
L7:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L8:
    mov dword ptr [esp + 12], 0
    jmp L2
FUN_10025380 ENDP
END
