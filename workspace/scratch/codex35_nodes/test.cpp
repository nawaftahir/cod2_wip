#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"
#include <assert.h>
#include <new>
#include <stdio.h>

using namespace D3DXShader;

static unsigned Size(unsigned kind)
{
    static const unsigned sizes[] = {16,20,24,48,32,36,48,28,24,36,64,64,36,80,64,56,28,24};
    assert(kind < 18);
    return sizes[kind];
}

static bool NodePointer(unsigned kind, unsigned offset)
{
    if (offset == 8 || offset == 12) return true;
    switch (kind)
    {
    case 2: return offset == 0x14;
    case 4: return offset == 0x1c;
    case 5: return offset >= 0x18 && offset <= 0x20;
    case 6: return offset >= 0x14 && offset <= 0x1c;
    case 7: return offset == 0x14 || offset == 0x18;
    case 8: return offset == 0x10;
    case 10: return offset >= 0x1c && offset <= 0x34;
    case 11: return offset >= 0x20 && offset <= 0x30;
    case 12: return offset >= 0x14 && offset <= 0x20;
    case 13: return offset == 0x10 || offset == 0x20 || offset == 0x24;
    case 16: return offset >= 0x10 && offset <= 0x18;
    case 17: return offset == 0x10 || offset == 0x14;
    }
    return false;
}

static void Dump(CNode *node, unsigned depth = 0)
{
    if (!node)
    {
        printf(" NULL");
        return;
    }
    assert(depth < 6);
    unsigned kind = node->kind;
    unsigned *words = (unsigned *)node;
    printf(" [%u", kind);
    for (unsigned p = 4; p < Size(kind); p += 4)
    {
        if (NodePointer(kind, p))
        {
            Dump(*(CNode **)((char *)node + p), depth + 1);
        }
        else if ((kind == 1 || kind == 2) && p == 0x10 || kind == 5 && p == 0x14)
        {
            const char *name = *(const char **)((char *)node + p);
            printf(" S:%s", name ? name : "NULL");
        }
        else if (kind == 14 && ((CNodeValue *)node)->value.kind == VALUE_CODE_4 && p == 0x18)
        {
            Dump(((CNodeValue *)node)->value.data.node, depth + 1);
        }
        else if ((kind == 11 && (p == 0x38 || p == 0x3c)) || kind == 15 && p == 0x30)
        {
            printf(" P:%d", words[p / 4] != 0);
        }
        else
        {
            printf(" %08x", words[p / 4]);
        }
    }
    printf("]");
}

template<class T> static T *Default(unsigned char *buffer)
{
    memset(buffer, 0xa5, 128);
    return ::new (buffer) T;
}

static void Case(CNode *node, bool copy, unsigned &cases)
{
    Dump(node);
    printf(" E:%d:%d", CNode::IsEqual(node, node), CNode::IsEqual(node, 0));
    if (copy)
    {
        CNode *before = node->kind == (_D3DXNODE_TYPE)14 &&
            ((CNodeValue *)node)->value.kind == VALUE_CODE_4 ?
            ((CNodeValue *)node)->value.data.node : 0;
        CNode *cloned = node->Copy();
        assert(cloned && cloned != node && cloned->kind == node->kind);
        if (before)
        {
            assert(((CNodeValue *)cloned)->value.data.node == before);
            assert(((CNodeValue *)node)->value.data.node != before);
        }
        printf(" EQCOPY:%d", CNode::IsEqual(node, cloned));
        printf(" COPY");
        Dump(cloned);
        printf(" AFTER");
        Dump(node);
    }
    puts("");
    ++cases;
}

int main()
{
    assert(sizeof(CNode) == 16 && sizeof(CNodeExpression) == 80 && sizeof(CNodeValue) == 64);
    D3DXCore::CAlloc allocator(0x100000, 0x10000);
    D3DXCore::CAlloc *previous = CNode::SetAlloc(&allocator);
    unsigned cases = 0;
    CNode leaf((_D3DXNODE_TYPE)0);
    CNodeTree tree("T", 0, 0, 0);
    CNodeScope parent;
    D3DXTOKEN token;
    __declspec(align(16)) unsigned char memory[128];
    for (unsigned seed = 0; seed < 32; ++seed)
    {
        for (unsigned w = 0; w < 8; ++w) token.words[w] = seed * 17 + w;
        token.words[0] = 3;
        for (unsigned mask = 0; mask < 8; ++mask)
        {
            CNode *a = mask & 1 ? &leaf : 0;
            CNode *b = mask & 2 ? &leaf : 0;
            CNode *c = mask & 4 ? &leaf : 0;
            Case(Default<CNode>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            CNode *base = ::new (memory) CNode((_D3DXNODE_TYPE)(seed % 18));
            printf("BASE %u %d %d\n", base->kind, base->IsEqual(&leaf), base->IsEqual(0));
            ++cases;
            Case(Default<CNodeList>(memory), false, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeList(a,b,"L"), false, cases);
            Case(Default<CNodeTree>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeTree("T",a,b,c), true, cases);
            Case(Default<CNodeToken>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeToken(&token), true, cases);
            Case(Default<CNodeProgram>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeProgram(seed,seed+1,seed+2,a), true, cases);
            Case(Default<CNodeScope>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeScope((_D3DXSCOPE_TYPE)(seed%8),"S",a,mask&2?&tree:0,mask&4?&parent:0), true, cases);
            Case(Default<CNodeDecl>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeDecl((_D3DXDECL_TYPE)(seed%8),a,b,c), true, cases);
            Case(Default<CNodeUsage>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeUsage(seed,a,b), true, cases);
            Case(Default<CNodeArray>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeArray(a,seed), true, cases);
            Case(Default<CNodeType>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeType((_D3DXTYPE_TEMPLATE)(seed%4),(_D3DXCOMPONENT_TYPE)(seed%30),seed,seed+1,mask), true, cases);
            Case(Default<CNodeFunction>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeFunction(seed,mask,seed*11,a,b,c,a,b,c,a), true, cases);
            Case(Default<CNodeVariable>(memory), false, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeVariable(seed,mask,(_D3DXSCOPE_TYPE)(seed%8),seed*13,a,b,c,a,b), false, cases);
            Case(Default<CNodeStatement>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeStatement((_D3DXSTMT_TYPE)(seed%6),a,b,c,a), true, cases);
            Case(Default<CNodeExpression>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeExpression(a,(_D3DXEXPR_OP)(seed%35),b,c,mask&1,&token), true, cases);
            Case(Default<CNodeValue>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeValue((_D3DXVALUE_TYPE)3,seed,&token), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeValue(VALUE_CODE_4,a,&token), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeValue((_D3DXVALUE_TYPE)1,seed*0.25,&token), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeValue((_D3DXVALUE_TYPE)2,seed,mask,&token), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            CNodeValue *pointerValue = ::new (memory) CNodeValue((_D3DXVALUE_TYPE)2,(unsigned char *)&token,mask,&token);
            assert(pointerValue->value.data.words.low == (unsigned)&token);
            pointerValue->value.data.words.low = 0x12345678;
            Case(pointerValue, false, cases);
            _D3DXVALUE value = {(_D3DXVALUE_TYPE)3,seed};
            value.data.words.low = seed+7;
            value.data.words.high = mask;
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeValue(&value,&token), true, cases);
            Case(Default<CNodeBuffer>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeBuffer(&token,(unsigned char *)&token,seed), true, cases);
            Case(Default<CNodeState>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeState(a,b,c), true, cases);
            Case(Default<CNodeRegister>(memory), true, cases);
            memset(memory, 0xa5, sizeof(memory));
            Case(::new (memory) CNodeRegister(a,b), true, cases);
        }
    }
    assert(!CNode::Copy(0) && CNode::IsEqual(0,0));
    CNode first, second, third;
    assert(CNode::Append(0,&first) == &first);
    assert(CNode::Append(&first,&second) == &first && first.next == &second);
    assert(CNode::Append(&first,&third) == &first && second.next == &third);
    CNode::SetAlloc(previous);
    printf("CASES %u\n", cases);
    return 0;
}
