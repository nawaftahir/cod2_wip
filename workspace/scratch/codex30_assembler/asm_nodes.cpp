#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"

namespace D3DXShader
{
class CNodeAsmInstruction : public CNode
{
public:
    D3DXTOKEN token;
    unsigned long field30, field34, field38;
    CNode *field3c, *field40;
    CNode *arguments[4];
    unsigned field54, field58;
    unsigned char unknown5c[4];
    CNodeAsmInstruction();
    CNodeAsmInstruction(const D3DXTOKEN *token, unsigned long a,
                        unsigned long b, unsigned long c);
    virtual CNodeAsmInstruction *Copy();
    virtual void Print();
};
class CNodeAsmRegister : public CNode
{
public:
    unsigned long field10, field14, field18;
    int field1c;
    unsigned field20, field24;
    CNode *field28;
    CNodeAsmRegister();
    CNodeAsmRegister(unsigned long a, unsigned long b, unsigned long c, int d, CNode *e);
    virtual CNodeAsmRegister *Copy();
    virtual void Print();
};

#ifndef ASM_DECLARATIONS_ONLY
CNodeAsmInstruction::CNodeAsmInstruction() : CNode((_D3DXNODE_TYPE)18),
    field30(0), field34(0), field38(0), field3c(0), field40(0), field54(0), field58(0)
{
    memset(&token, 0, sizeof(token));
    memset(arguments, 0, sizeof(arguments));
}
CNodeAsmInstruction::CNodeAsmInstruction(const D3DXTOKEN *t, unsigned long a,
    unsigned long b, unsigned long c) : CNode((_D3DXNODE_TYPE)18)
{
    token = *t;
    field30 = a;
    field34 = b;
    field38 = c;
    field3c = 0;
    field40 = 0;
    field54 = 0;
    field58 = 0;
    memset(arguments, 0, sizeof(arguments));
}
CNodeAsmRegister::CNodeAsmRegister() : CNode((_D3DXNODE_TYPE)19),
    field10(0), field14(0), field18(0), field1c(0), field28(0)
{
    field20 = 0xf0000;
    field24 = 0xe40000;
}
CNodeAsmRegister::CNodeAsmRegister(unsigned long a, unsigned long b, unsigned long c,
    int d, CNode *e) : CNode((_D3DXNODE_TYPE)19),
    field10(a), field14(b), field18(c), field1c(d), field28(e)
{
    field20 = 0xf0000;
    field24 = 0xe40000;
}
CNodeAsmRegister *CNodeAsmRegister::Copy()
{
    CNodeAsmRegister *node = new CNodeAsmRegister;
    if (!node)
    {
        return 0;
    }
    node->field10 = field10;
    node->field14 = field14;
    node->field18 = field18;
    node->field1c = field1c;
    node->field20 = field20;
    node->field24 = field24;
    if (field28)
    {
        node->field28 = field28->Copy();
        if (!node->field28)
        {
            return 0;
        }
    }
    return node;
}
CNodeAsmInstruction *CNodeAsmInstruction::Copy()
{
    CNodeAsmInstruction *node = new CNodeAsmInstruction;
    if (!node)
    {
        return 0;
    }
    node->token = token;
    node->field30 = field30;
    node->field34 = field34;
    node->field38 = field38;
    node->field54 = field54;
    node->field58 = field58;
    if (field3c)
    {
        node->field3c = field3c->Copy();
        if (!node->field3c) goto failed;
    }
    if (field40)
    {
        node->field40 = field40->Copy();
        if (!node->field40) goto failed;
    }
    for (unsigned i = 0; i < 4; ++i)
    {
        if (arguments[i])
        {
            node->arguments[i] = arguments[i]->Copy();
            if (!node->arguments[i]) goto failed;
        }
    }
    return node;
failed:
    return 0;
}
#endif
}
