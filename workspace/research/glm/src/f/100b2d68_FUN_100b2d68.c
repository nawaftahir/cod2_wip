extern int c_10000000;
extern int c_10100000;
extern int c_10500000;
extern void sub_10086eae(void);
extern void sub_1008af0b(void);
extern void sub_1008af24(void);
extern void sub_1008bec4(void);
extern void sub_1008d525(void);
extern void sub_10094810(void);
extern void sub_100ba843(void);
extern void sub_100baf09(void);
extern void sub_100bb4cc(void);
extern void sub_100bb955(void);
extern void sub_100bb9d8(void);
extern void sub_100bbff0(void);
extern void sub_100bc34f(void);
extern void sub_100be86c(void);
extern void sub_100bebad(void);
extern void sub_100bee5d(void);
extern void sub_100c06ec(void);
extern void sub_100c0cef(void);
extern void sub_100c0faf(void);
extern void sub_100c136d(void);
extern void sub_100c143f(void);
extern void sub_100c19e8(void);
extern void sub_100c6123(void);
extern void sub_100c61dd(void);
extern void sub_100c768d(void);

__declspec(naked) void FUN_100b2d68(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov esi, ecx
    xor edi, edi
    test byte ptr [esi + 0xcc], 4
    je L0
    call sub_1008af0b
    cmp dword ptr [esi + 0xc], edi
    jbe L1
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [esi + 0xfc], edi
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [esi + 0x100], eax
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    cmp eax, c_10000000
    jne L2
    mov ecx, esi
    call sub_100bb955
    inc edi
    cmp edi, dword ptr [esi + 0xc]
    jb L3
    mov ecx, esi
    call sub_1008af24
    test byte ptr [esi + 0xcc], 4
    jne L4
    xor ebx, ebx
    cmp dword ptr [esi + 0xc], ebx
    jbe L5
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [esi + 0xfc], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 0x100], eax
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    cmp eax, c_10100000
    je L6
    cmp eax, 0x20000000
    je L7
    cmp eax, 0x20100000
    je L7
    cmp eax, 0x30000000
    je L7
    xor edi, edi
    inc edi
    jmp L8
    mov ecx, esi
    call sub_100bc34f
    mov ecx, esi
    mov edi, eax
    call sub_100ba843
    jmp L9
    push 1
    mov ecx, esi
    call sub_100c6123
    mov edi, eax
    test edi, edi
    jl L10
    inc ebx
    cmp ebx, dword ptr [esi + 0xc]
    jb L11
    jmp L12
    mov edi, dword ptr [ebp - 4]
    xor ebx, ebx
    cmp dword ptr [esi + 0xc], ebx
    jbe L13
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [esi + 0xfc], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 0x100], eax
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    cmp eax, 0x30000000
    je L14
    xor edi, edi
    inc edi
    jmp L15
    test edi, edi
    jl L10
    xor eax, eax
    push eax
    push eax
    push eax
    mov ecx, esi
    call sub_100bb9d8
    mov edi, eax
    test edi, edi
    jl L10
    xor eax, eax
    push eax
    push eax
    push eax
    mov ecx, esi
    call sub_100bbff0
    mov edi, eax
    test edi, edi
    jl L10
    inc ebx
    cmp ebx, dword ptr [esi + 0xc]
    jb L16
    mov ecx, esi
    call sub_1008bec4
    mov edi, eax
    test edi, edi
    jl L10
    mov ecx, esi
    call sub_100ba843
    xor ebx, ebx
    cmp dword ptr [esi + 0xc], ebx
    jbe L17
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [esi + 0xfc], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 0x100], eax
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    cmp eax, 0x20000000
    je L18
    cmp eax, 0x70b00000
    jne L19
    mov ecx, esi
    call sub_100bc34f
    mov ecx, esi
    mov edi, eax
    call sub_100ba843
    test edi, edi
    jl L10
    inc ebx
    cmp ebx, dword ptr [esi + 0xc]
    jb L20
    xor ebx, ebx
    cmp dword ptr [esi + 0xc], ebx
    jbe L21
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [esi + 0xfc], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 0x100], eax
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    cmp eax, c_10500000
    je L22
    cmp eax, 0x10f00000
    je L23
    cmp eax, 0x20400000
    je L24
    cmp eax, 0x30000000
    jne L25
    mov ecx, esi
    call sub_100c136d
    mov edi, eax
    test edi, edi
    je L25
    mov ecx, esi
    call sub_100c143f
    jmp L26
    mov ecx, esi
    call sub_100c0cef
    mov edi, eax
    test edi, edi
    je L25
    push 1
    mov ecx, esi
    call sub_100c61dd
    jmp L26
    mov ecx, esi
    call sub_100be86c
    jmp L26
    mov ecx, esi
    call sub_100bb4cc
    mov edi, eax
    test edi, edi
    jl L10
    inc ebx
    cmp ebx, dword ptr [esi + 0xc]
    jb L27
    mov ecx, esi
    call sub_1008bec4
    mov edi, eax
    test edi, edi
    jl L10
    mov ecx, esi
    call sub_100ba843
    xor ebx, ebx
    cmp dword ptr [esi + 0xc], ebx
    jbe L28
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [esi + 0xfc], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 0x100], eax
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    cmp eax, 0x20500000
    je L29
    cmp eax, 0x50000000
    je L30
    cmp eax, 0x70300000
    je L31
    cmp eax, 0x73500000
    je L32
    cmp eax, 0x73600000
    jne L33
    mov ecx, esi
    call sub_100bebad
    jmp L34
    push 0
    mov ecx, esi
    call sub_100c19e8
    jmp L34
    mov ecx, esi
    call sub_100c0faf
    jmp L34
    mov ecx, esi
    call sub_100c06ec
    mov edi, eax
    test edi, edi
    jl L10
    inc ebx
    cmp ebx, dword ptr [esi + 0xc]
    jb L35
    mov ecx, esi
    call sub_100ba843
    xor edi, edi
    cmp dword ptr [esi + 0xc], edi
    jbe L36
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [esi + 0xfc], edi
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [esi + 0x100], eax
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    cmp eax, 0x70300000
    jne L37
    mov ecx, esi
    call sub_100c768d
    inc edi
    cmp edi, dword ptr [esi + 0xc]
    jb L38
    mov ecx, esi
    call sub_100ba843
    xor ebx, ebx
    cmp dword ptr [esi + 0xc], ebx
    jbe L4
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [esi + 0xfc], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 0x100], eax
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    cmp eax, 0x70300000
    je L39
    cmp eax, 0x73500000
    je L40
    cmp eax, 0x73600000
    je L40
    cmp eax, 0x73700000
    je L40
    cmp eax, 0x73800000
    jne L41
    mov ecx, esi
    call sub_100bee5d
    jmp L42
    push 0
    mov ecx, esi
    call sub_100c19e8
    mov edi, eax
    test edi, edi
    jl L10
    inc ebx
    cmp ebx, dword ptr [esi + 0xc]
    jb L43
    xor ebx, ebx
    cmp dword ptr [esi + 0xc], ebx
    jbe L44
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [esi + 0xfc], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 0x100], eax
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    cmp eax, 0x50300000
    jne L45
    mov ecx, esi
    call sub_100baf09
    mov edi, eax
    test edi, edi
    jl L10
    inc ebx
    cmp ebx, dword ptr [esi + 0xc]
    jb L46
    mov ecx, esi
    call sub_1008bec4
    mov edi, eax
    test edi, edi
    jl L10
    mov ecx, esi
    call sub_10094810
    mov edi, eax
    test edi, edi
    jl L10
    mov ecx, esi
    call sub_10086eae
    mov edi, eax
    test edi, edi
    jl L10
    mov ecx, esi
    call sub_1008d525
    mov edi, eax
    test edi, edi
    jl L10
    mov ecx, esi
    call sub_100ba843
    xor edi, edi
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
