.686
.MODEL FLAT, C
EXTRN sub_10007D7A:PROC
EXTRN sub_1000A906:PROC
EXTRN sub_100150B3:PROC
EXTRN sub_1001E697:PROC
EXTRN sub_100219DF:PROC
EXTRN sub_10022361:PROC
EXTRN sub_1002450A:PROC
EXTRN sub_10025548:PROC
EXTRN sub_10025555:PROC
EXTRN sub_1002556F:PROC
EXTRN sub_100255C0:PROC
EXTRN sub_100255F2:PROC
EXTRN sub_100255FC:PROC
EXTRN sub_1002564A:PROC
EXTRN sub_10025657:PROC
EXTRN sub_10027D90:PROC
EXTRN sub_10027DEE:PROC
EXTRN sub_10027FFB:PROC
EXTRN sub_10028219:PROC
EXTRN sub_100F8840:PROC
EXTRN EXTRN fp_101D4C00:DWORD:DWORD
EXTRN EXTRN fp_101D4C64:DWORD:DWORD
EXTRN EXTRN g_101CE6E4:DWORD:DWORD
EXTRN EXTRN g_101CE6FC:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE730:DWORD:DWORD
EXTRN EXTRN g_101CE7C4:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_10678AB8:DWORD:DWORD
EXTRN EXTRN g_10678ABC:DWORD:DWORD
.CODE
FUN_10025380 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    mov mov eax, 016ECh
    call sub_100F8840
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    call sub_10007D7A
    mov mov ecx, dword ptr [g_101D1B9C]
    test test ecx, ecx
    je L0
    mov mov edx, dword ptr [ecx + 0100h]
    test test edx, edx
    je L1
    push push eax
    mov mov edi, esi
    call sub_1000A906
    add add esp, 4
    call dword ptr [fp_101D4C00]
    call dword ptr [fp_101D4C64]
    mov mov esi, dword ptr [g_10678AB8]
    mov mov ebx, dword ptr [g_10678ABC]
    mov mov eax, esi
    mov mov ecx, ebx
    call sub_1002450A
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    jne L3
    xor xor edi, edi
L1:
    jmp L4
    mov mov ecx, dword ptr [g_101CE7C4]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je sub_1002556F
    mov mov edi, dword ptr [ebp + 12]
    lea lea edx, [esp + 16]
    push push edx
    push push edi
    mov mov dword ptr [esp + 20], 1
    call sub_10027D90
    push push 010027170h
    push push 24
    lea lea eax, [esp + 0E0h]
    push push eax
    lea lea ecx, [esp + 36]
    push push ecx
    call sub_10028219
    lea lea edx, [esp + 40]
    push push edx
    push push edi
    lea lea edi, [esp + 0F0h]
    call sub_10027FFB
    add add esp, 32
    mov mov edi, dword ptr [esp + 12]
    mov mov ecx, dword ptr [g_101CE708]
    mov mov edx, dword ptr [ecx + 8]
    xor xor eax, eax
    cmp cmp edx, 2
    je sub_10025548
    mov mov edx, dword ptr [g_101CE6FC]
    mov mov ecx, dword ptr [edx + 8]
    test test ecx, ecx
    je sub_10025555
    lea lea eax, [esp + 0AF8h]
    push push eax
    push push esi
    push push ebx
    mov mov eax, 0100h
    call sub_100150B3
    add add esp, 12
    push push eax
    mov mov eax, dword ptr [ebp + 16]
    lea lea ecx, [esp + 0AFCh]
    push push ecx
    lea lea edx, [esp + 0D8h]
    push push edx
    mov mov edx, dword ptr [ebp + 8]
    push push edi
    push push ebx
    push push eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, esi
    call L2
    mov mov ecx, dword ptr [g_101CE6E4]
    mov mov eax, dword ptr [ecx + 8]
    add add esp, 24
    test test eax, eax
    je sub_100255FC
    test test al, 2
    je sub_100255F2
    push push 0
    push push 03F800000h
    push push 010191488h
    push push 6
    call sub_10022361
    add add esp, 16
    push push 0
    push push 29
    push push esi
    push push ebx
    call sub_100219DF
    add add esp, 16
    call sub_1001E697
    cmp cmp edi, 1
    jne sub_1002564A
    mov mov edx, dword ptr [g_101CE730]
    mov mov al, byte ptr [edx + 8]
    test test al, al
    je sub_10025657
    call sub_10027DEE
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    mov mov dword ptr [esp + 12], 0
    jmp sub_100255C0
FUN_10025380 ENDP
END
