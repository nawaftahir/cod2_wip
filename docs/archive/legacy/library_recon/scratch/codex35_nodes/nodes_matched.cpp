#include <string.h>
#pragma intrinsic(memset, memcpy, memcmp)

namespace D3DXCore
{
class CAlloc
{
public:
    unsigned char *Alloc(unsigned bytes, unsigned alignment);
};
}

namespace D3DXShader
{
// Numeric enum codes are target-confirmed; historical enumerator names are unknown.
enum _D3DXNODE_TYPE { NODE_CODE_0 = 0, NODE_CODE_17 = 17 };
enum _D3DXDECL_TYPE { DECL_CODE_0 = 0, DECL_CODE_7 = 7 };
enum _D3DXSCOPE_TYPE { SCOPE_CODE_0 = 0, SCOPE_CODE_7 = 7 };
enum _D3DXTYPE_TEMPLATE { TEMPLATE_CODE_0 = 0, TEMPLATE_CODE_3 = 3 };
enum _D3DXCOMPONENT_TYPE { COMPONENT_CODE_0 = 0, COMPONENT_CODE_29 = 29 };
enum _D3DXSTMT_TYPE { STMT_CODE_0 = 0, STMT_CODE_5 = 5 };
enum _D3DXEXPR_OP { EXPR_CODE_0 = 0, EXPR_CODE_34 = 34 };
enum _D3DXVALUE_TYPE { VALUE_CODE_0 = 0, VALUE_CODE_4 = 4 };
struct D3DXTOKEN
{
    unsigned words[8];
};

class CNode
{
public:
    _D3DXNODE_TYPE kind;
    CNode *child;
    CNode *next;
    CNode();
    CNode(_D3DXNODE_TYPE kind);
    virtual int IsEqual(CNode *other);
    virtual CNode *Copy();
    virtual void Print();
    static void *__stdcall operator new(unsigned size);
    static CNode *__stdcall Append(CNode *first, CNode *second);
    static CNode *__stdcall Copy(CNode *node);
    static int __stdcall IsEqual(CNode *first, CNode *second);
private:
    static D3DXCore::CAlloc *s_pAlloc;
    friend class CNodeVariable;
};

#define NODE_VIRTUALS(Class) \
    virtual int IsEqual(CNode *other); \
    virtual Class *Copy(); \
    virtual void Print();

class CNodeList : public CNode
{
public:
    const char *name;
    CNodeList();
    CNodeList(CNode *head, CNode *next, const char *name);
    NODE_VIRTUALS(CNodeList)
};
class CNodeToken : public CNode
{
public:
    D3DXTOKEN token;
    CNodeToken();
    CNodeToken(const D3DXTOKEN *token);
    NODE_VIRTUALS(CNodeToken)
};
class CNodeProgram : public CNode
{
public:
    unsigned field10, field14, field18;
    CNode *field1c;
    CNodeProgram();
    CNodeProgram(unsigned a, unsigned b, unsigned c, CNode *node);
    NODE_VIRTUALS(CNodeProgram)
};
class CNodeTree : public CNode
{
public:
    const char *name;
    CNode *field14;
    CNodeTree();
    CNodeTree(const char *name, CNode *a, CNode *b, CNode *c);
    NODE_VIRTUALS(CNodeTree)
};
class CNodeScope : public CNode
{
public:
    _D3DXSCOPE_TYPE scopeKind;
    const char *name;
    CNode *field18;
    CNodeTree *field1c;
    CNodeScope *parent;
    CNodeScope();
    CNodeScope(_D3DXSCOPE_TYPE kind, const char *name, CNode *node,
               CNodeTree *tree, CNodeScope *parent);
    NODE_VIRTUALS(CNodeScope)
};
class CNodeDecl : public CNode
{
public:
    _D3DXDECL_TYPE declKind;
    CNode *field14, *field18, *field1c;
    unsigned field20, field24, field28, field2c;
    CNodeDecl();
    CNodeDecl(_D3DXDECL_TYPE kind, CNode *a, CNode *b, CNode *c);
    NODE_VIRTUALS(CNodeDecl)
};
class CNodeUsage : public CNode
{
public:
    unsigned long flags;
    CNode *field14, *field18;
    CNodeUsage();
    CNodeUsage(unsigned long flags, CNode *a, CNode *b);
    NODE_VIRTUALS(CNodeUsage)
};
class CNodeArray : public CNode
{
public:
    CNode *field10;
    unsigned field14;
    CNodeArray();
    CNodeArray(CNode *node, unsigned count);
    NODE_VIRTUALS(CNodeArray)
};
class CNodeType : public CNode
{
public:
    _D3DXTYPE_TEMPLATE templateKind;
    _D3DXCOMPONENT_TYPE component;
    unsigned rows, columns;
    unsigned long flags;
    CNodeType();
    CNodeType(_D3DXTYPE_TEMPLATE kind, _D3DXCOMPONENT_TYPE component,
              unsigned rows, unsigned columns, unsigned long flags);
    NODE_VIRTUALS(CNodeType)
};
class CNodeFunction : public CNode
{
public:
    unsigned field10, field14;
    unsigned long flags;
    CNode *field1c, *field20, *field24, *field28, *field2c, *field30, *field34;
    unsigned field38, field3c;
    CNodeFunction();
    CNodeFunction(unsigned a, unsigned b, unsigned long flags, CNode *c,
                  CNode *d, CNode *e, CNode *f, CNode *g, CNode *h, CNode *i);
    NODE_VIRTUALS(CNodeFunction)
};
class CNodeVariable : public CNode
{
public:
    unsigned field10, field14;
    _D3DXSCOPE_TYPE scopeKind;
    unsigned long flags;
    CNode *field20, *field24, *field28, *field2c, *field30;
    unsigned field34;
    unsigned *field38, *field3c;
    CNodeVariable();
    CNodeVariable(unsigned a, unsigned b, _D3DXSCOPE_TYPE kind, unsigned long flags,
                  CNode *c, CNode *d, CNode *e, CNode *f, CNode *g);
    NODE_VIRTUALS(CNodeVariable)
};
class CNodeStatement : public CNode
{
public:
    _D3DXSTMT_TYPE statement;
    CNode *field14, *field18, *field1c, *field20;
    CNodeStatement();
    CNodeStatement(_D3DXSTMT_TYPE kind, CNode *a, CNode *b, CNode *c, CNode *d);
    NODE_VIRTUALS(CNodeStatement)
};
class CNodeExpression : public CNode
{
public:
    CNode *field10;
    unsigned field14, field18;
    _D3DXEXPR_OP operation;
    CNode *field20, *field24;
    int field28;
    unsigned unknown2c;
    D3DXTOKEN token;
    CNodeExpression();
    CNodeExpression(CNode *a, _D3DXEXPR_OP op, CNode *b, CNode *c, int raw,
                    const D3DXTOKEN *token);
    NODE_VIRTUALS(CNodeExpression)
};
class CNodeState : public CNode
{
public:
    CNode *field10, *field14, *field18;
    CNodeState();
    CNodeState(CNode *a, CNode *b, CNode *c);
    NODE_VIRTUALS(CNodeState)
};
class CNodeRegister : public CNode
{
public:
    CNode *field10, *field14;
    CNodeRegister();
    CNodeRegister(CNode *a, CNode *b);
    NODE_VIRTUALS(CNodeRegister)
};
struct _D3DXVALUE
{
    _D3DXVALUE_TYPE kind;
    unsigned unknown4;
    union
    {
        double real;
        CNode *node;
        struct
        {
            unsigned low, high;
        } words;
    } data;
};
class CNodeValue : public CNode
{
public:
    _D3DXVALUE value;
    D3DXTOKEN token;
    CNodeValue();
    CNodeValue(const _D3DXVALUE *value, const D3DXTOKEN *token);
    CNodeValue(_D3DXVALUE_TYPE kind, unsigned value, const D3DXTOKEN *token);
    CNodeValue(_D3DXVALUE_TYPE kind, double value, const D3DXTOKEN *token);
    CNodeValue(_D3DXVALUE_TYPE kind, CNode *value, const D3DXTOKEN *token);
    CNodeValue(_D3DXVALUE_TYPE kind, unsigned a, unsigned b, const D3DXTOKEN *token);
    CNodeValue(_D3DXVALUE_TYPE kind, unsigned char *a, unsigned b, const D3DXTOKEN *token);
    NODE_VIRTUALS(CNodeValue)
};
class CNodeBuffer : public CNode
{
public:
    D3DXTOKEN token;
    unsigned char *data;
    unsigned size;
    CNodeBuffer();
    CNodeBuffer(const D3DXTOKEN *token, unsigned char *data, unsigned size);
    NODE_VIRTUALS(CNodeBuffer)
};

#ifndef NODE_DECLARATIONS_ONLY
CNode::CNode() : kind(NODE_CODE_0), child(0), next(0)
{
}
CNode::CNode(_D3DXNODE_TYPE value) : kind(value), child(0), next(0)
{
}
CNodeList::CNodeList() : CNode((_D3DXNODE_TYPE)1), name(0)
{
}
CNodeList::CNodeList(CNode *head, CNode *tail, const char *label)
    : CNode((_D3DXNODE_TYPE)1)
{
    child = head;
    next = tail;
    name = label;
}
CNodeTree::CNodeTree() : CNode((_D3DXNODE_TYPE)2), name(0), field14(0)
{
}
CNodeTree::CNodeTree(const char *label, CNode *a, CNode *b, CNode *c)
    : CNode((_D3DXNODE_TYPE)2), name(label)
{
    child = a;
    next = b;
    field14 = c;
}
CNodeToken::CNodeToken() : CNode((_D3DXNODE_TYPE)3)
{
}
CNodeToken::CNodeToken(const D3DXTOKEN *value) : CNode((_D3DXNODE_TYPE)3)
{
    token = *value;
}
CNodeProgram::CNodeProgram(unsigned a, unsigned b, unsigned c, CNode *node)
    : CNode((_D3DXNODE_TYPE)4), field10(a), field14(b), field18(c), field1c(node)
{
}
CNodeProgram::CNodeProgram() : CNode((_D3DXNODE_TYPE)4),
    field10(0), field14(0), field18(0), field1c(0)
{
}
CNodeScope::CNodeScope() : CNode((_D3DXNODE_TYPE)5),
    scopeKind(SCOPE_CODE_0), name(0), field18(0), field1c(0), parent(0)
{
}
CNodeScope::CNodeScope(_D3DXSCOPE_TYPE k, const char *label, CNode *node,
                      CNodeTree *tree, CNodeScope *previous)
    : CNode((_D3DXNODE_TYPE)5), scopeKind(k), name(label), field18(node),
      field1c(tree), parent(previous)
{
}
CNodeDecl::CNodeDecl(_D3DXDECL_TYPE k, CNode *a, CNode *b, CNode *c)
    : CNode((_D3DXNODE_TYPE)6), declKind(k), field14(a), field18(b), field1c(c),
      field20(0), field24(0xffffffff), field28(0), field2c(0)
{
}
CNodeDecl::CNodeDecl() : CNode((_D3DXNODE_TYPE)6), declKind(DECL_CODE_0),
    field14(0), field18(0), field1c(0), field20(0), field24(0xffffffff),
    field28(0), field2c(0)
{
}
CNodeUsage::CNodeUsage() : CNode((_D3DXNODE_TYPE)7), flags(0), field14(0), field18(0)
{
}
CNodeUsage::CNodeUsage(unsigned long bits, CNode *a, CNode *b)
    : CNode((_D3DXNODE_TYPE)7), flags(bits), field14(a), field18(b)
{
}
CNodeType::CNodeType(_D3DXTYPE_TEMPLATE k, _D3DXCOMPONENT_TYPE c,
                    unsigned r, unsigned col, unsigned long bits)
    : CNode((_D3DXNODE_TYPE)9), templateKind(k), component(c), rows(r),
      columns(col), flags(bits)
{
}
CNodeArray::CNodeArray() : CNode((_D3DXNODE_TYPE)8), field10(0), field14(0)
{
}
CNodeArray::CNodeArray(CNode *node, unsigned count) : CNode((_D3DXNODE_TYPE)8),
    field10(node), field14(count)
{
}
CNodeType::CNodeType() : CNode((_D3DXNODE_TYPE)9), templateKind(TEMPLATE_CODE_0),
    component((_D3DXCOMPONENT_TYPE)9), rows(0), columns(0), flags(0)
{
}
CNodeFunction::CNodeFunction() : CNode((_D3DXNODE_TYPE)10), field10(0), field14(0),
    flags(0), field1c(0), field20(0), field24(0), field28(0), field2c(0),
    field30(0), field34(0), field38(0), field3c(0)
{
}
CNodeFunction::CNodeFunction(unsigned a, unsigned b, unsigned long bits, CNode *c,
    CNode *d, CNode *e, CNode *f, CNode *g, CNode *h, CNode *i)
    : CNode((_D3DXNODE_TYPE)10), field10(a), field14(b), flags(bits), field1c(c),
      field20(d), field24(e), field28(f), field2c(g), field30(h), field34(i),
      field38(0), field3c(0)
{
}
CNodeVariable::CNodeVariable() : CNode((_D3DXNODE_TYPE)11), field10(0), field14(0),
    scopeKind(SCOPE_CODE_0), flags(0), field20(0), field24(0), field28(0), field2c(0),
    field30(0), field34(0), field38(0), field3c(0)
{
}
CNodeVariable::CNodeVariable(unsigned a, unsigned b, _D3DXSCOPE_TYPE kind,
    unsigned long bits, CNode *c, CNode *d, CNode *e, CNode *f, CNode *g)
    : CNode((_D3DXNODE_TYPE)11), field10(a), field14(b), scopeKind(kind), flags(bits),
      field20(c), field24(d), field28(e), field2c(f), field30(g), field34(0),
      field38(0), field3c(0)
{
}
CNodeStatement::CNodeStatement() : CNode((_D3DXNODE_TYPE)12), statement(STMT_CODE_0),
    field14(0), field18(0), field1c(0), field20(0)
{
}
CNodeStatement::CNodeStatement(_D3DXSTMT_TYPE s, CNode *a, CNode *b, CNode *c, CNode *d)
    : CNode((_D3DXNODE_TYPE)12), statement(s), field14(a), field18(b), field1c(c), field20(d)
{
}
CNodeExpression::CNodeExpression() : CNode((_D3DXNODE_TYPE)13), field10(0),
    field14(0), field18(0), operation(EXPR_CODE_0), field20(0), field24(0), field28(1)
{
    memset(&token, 0, sizeof(token));
}
CNodeExpression::CNodeExpression(CNode *a, _D3DXEXPR_OP op, CNode *b, CNode *c,
    int raw, const D3DXTOKEN *value) : CNode((_D3DXNODE_TYPE)13), field10(a),
    field14(0), field18(0), operation(op), field20(b), field24(c), field28(raw)
{
    token = *value;
}
CNodeState::CNodeState() : CNode((_D3DXNODE_TYPE)16), field10(0), field14(0), field18(0)
{
}
CNodeState::CNodeState(CNode *a, CNode *b, CNode *c)
    : CNode((_D3DXNODE_TYPE)16), field10(a), field14(b), field18(c)
{
}
CNodeRegister::CNodeRegister(CNode *a, CNode *b)
    : CNode((_D3DXNODE_TYPE)17), field10(a), field14(b)
{
}
CNodeRegister::CNodeRegister() : CNode((_D3DXNODE_TYPE)17), field10(0), field14(0)
{
}

int CNode::IsEqual(CNode *other)
{
    if (!other)
    {
        return 0;
    }
    return other->kind == kind;
}
int __stdcall CNode::IsEqual(CNode *first, CNode *second)
{
    return first ? first->IsEqual(second) : second == 0;
}
CNode *__stdcall CNode::Copy(CNode *node)
{
    if (!node)
    {
        return 0;
    }
    return node->Copy();
}
CNode *CNode::Copy()
{
    return new CNode(kind);
}
CNode *__stdcall CNode::Append(CNode *first, CNode *second)
{
    if (!first)
    {
        return second;
    }
    CNode **tail = &first;
    do
    {
        tail = &(*tail)->next;
    }
    while (*tail);
    *tail = second;
    return first;
}
int CNodeUsage::IsEqual(CNode *other)
{
    CNodeUsage *value = (CNodeUsage *)other;
    return CNode::IsEqual(other) && flags == value->flags &&
        CNode::IsEqual(field14, value->field14) &&
        CNode::IsEqual(field18, value->field18);
}
int CNodeType::IsEqual(CNode *other)
{
    CNodeType *value = (CNodeType *)other;
    return CNode::IsEqual(other) && templateKind == value->templateKind &&
        component == value->component && rows == value->rows &&
        columns == value->columns && flags == value->flags;
}
int CNodeDecl::IsEqual(CNode *other)
{
    CNodeDecl *value = (CNodeDecl *)other;
    return CNode::IsEqual(other) && declKind == value->declKind &&
        field20 == value->field20 && field24 == value->field24 &&
        field28 == value->field28 && field2c == value->field2c &&
        CNode::IsEqual(field14, value->field14) &&
        CNode::IsEqual(field18, value->field18) &&
        CNode::IsEqual(field1c, value->field1c);
}
CNodeType *CNodeType::Copy()
{
    CNodeType *node = new CNodeType;
    if (!node)
    {
        return 0;
    }
    node->templateKind = templateKind;
    node->component = component;
    node->rows = rows;
    node->columns = columns;
    node->flags = flags;
    return node;
}

int CNodeProgram::IsEqual(CNode *other)
{
    CNodeProgram *value = (CNodeProgram *)other;
    if (!CNode::IsEqual(other) || field10 != value->field10 ||
        field14 != value->field14 || field18 != value->field18)
    {
        return 0;
    }
    return CNode::IsEqual(field1c, value->field1c) != 0;
}
int CNodeScope::IsEqual(CNode *other)
{
    CNodeScope *value = (CNodeScope *)other;
    return CNode::IsEqual(other) && scopeKind == value->scopeKind && name == value->name &&
        CNode::IsEqual(field18, value->field18) && CNode::IsEqual(field1c, value->field1c) &&
        CNode::IsEqual(parent, value->parent);
}
int CNodeFunction::IsEqual(CNode *other)
{
    CNodeFunction *value = (CNodeFunction *)other;
    return CNode::IsEqual(other) && field10 == value->field10 && field14 == value->field14 &&
        flags == value->flags && field38 == value->field38 && field3c == value->field3c &&
        CNode::IsEqual(field1c, value->field1c) && CNode::IsEqual(field20, value->field20) &&
        CNode::IsEqual(field24, value->field24) && CNode::IsEqual(field28, value->field28) &&
        CNode::IsEqual(field2c, value->field2c) && CNode::IsEqual(field30, value->field30) &&
        CNode::IsEqual(field34, value->field34);
}
int CNodeStatement::IsEqual(CNode *other)
{
    CNodeStatement *value = (CNodeStatement *)other;
    return CNode::IsEqual(other) && statement == value->statement &&
        CNode::IsEqual(field14, value->field14) && CNode::IsEqual(field18, value->field18) &&
        CNode::IsEqual(field1c, value->field1c) && CNode::IsEqual(field20, value->field20);
}
int CNodeState::IsEqual(CNode *other)
{
    CNodeState *value = (CNodeState *)other;
    return CNode::IsEqual(other) && CNode::IsEqual(field10, value->field10) &&
        CNode::IsEqual(field14, value->field14) && CNode::IsEqual(field18, value->field18);
}
int CNodeRegister::IsEqual(CNode *other)
{
    CNodeRegister *value = (CNodeRegister *)other;
    return CNode::IsEqual(other) && CNode::IsEqual(field10, value->field10) &&
        CNode::IsEqual(field14, value->field14);
}

// A failed child copy returns null without reclaiming the arena allocation.
#define COPY_CHILD(field) \
    if (field) \
    { \
        node->field = field->Copy(); \
        if (!node->field) \
        { \
            return 0; \
        } \
    }

CNodeToken *CNodeToken::Copy()
{
    CNodeToken *node = new CNodeToken;
    if (!node)
    {
        return 0;
    }
    node->token = token;
    return node;
}
CNodeTree *CNodeTree::Copy()
{
    CNodeTree *node = new CNodeTree;
    if (!node)
    {
        return 0;
    }
    node->field14 = field14;
    COPY_CHILD(child)
    COPY_CHILD(next)
    return node;
}
CNodeProgram *CNodeProgram::Copy()
{
    CNodeProgram *node = new CNodeProgram;
    if (!node)
    {
        return 0;
    }
    node->field10 = field10;
    node->field14 = field14;
    node->field18 = field18;
    COPY_CHILD(field1c)
    return node;
}
CNodeScope *CNodeScope::Copy()
{
    CNodeScope *node = new CNodeScope;
    if (!node)
    {
        return 0;
    }
    node->scopeKind = scopeKind;
    node->name = name;
    COPY_CHILD(field18)
    COPY_CHILD(field1c)
    COPY_CHILD(parent)
    return node;
}
CNodeDecl *CNodeDecl::Copy()
{
    CNodeDecl *node = new CNodeDecl;
    if (!node)
    {
        return 0;
    }
    node->declKind = declKind;
    node->field20 = field20;
    node->field24 = field24;
    node->field28 = field28;
    node->field2c = field2c;
    COPY_CHILD(field14)
    COPY_CHILD(field18)
    COPY_CHILD(field1c)
    return node;
}
CNodeUsage *CNodeUsage::Copy()
{
    CNodeUsage *node = new CNodeUsage;
    if (!node)
    {
        return 0;
    }
    node->flags = flags;
    COPY_CHILD(field14)
    COPY_CHILD(field18)
    return node;
}
CNodeArray *CNodeArray::Copy()
{
    CNodeArray *node = new CNodeArray;
    if (!node)
    {
        return 0;
    }
    node->field14 = field14;
    COPY_CHILD(field10)
    return node;
}
CNodeFunction *CNodeFunction::Copy()
{
    CNodeFunction *node = new CNodeFunction;
    if (!node)
    {
        return 0;
    }
    node->field10 = field10;
    node->field14 = field14;
    node->flags = flags;
    node->field38 = field38;
    node->field3c = field3c;
    COPY_CHILD(field1c)
    COPY_CHILD(field20)
    COPY_CHILD(field24)
    COPY_CHILD(field28)
    COPY_CHILD(field2c)
    COPY_CHILD(field30)
    COPY_CHILD(field34)
    return node;
}
CNodeStatement *CNodeStatement::Copy()
{
    CNodeStatement *node = new CNodeStatement;
    if (!node)
    {
        return 0;
    }
    node->statement = statement;
    COPY_CHILD(field14)
    COPY_CHILD(field18)
    COPY_CHILD(field1c)
    COPY_CHILD(field20)
    return node;
}
CNodeExpression *CNodeExpression::Copy()
{
    CNodeExpression *node = new CNodeExpression;
    if (!node)
    {
        return 0;
    }
    node->field14 = field14;
    node->field18 = field18;
    node->operation = operation;
    node->field28 = field28;
    node->token = token;
    if (field10)
    {
        node->field10 = field10->Copy();
        if (!node->field10)
        {
            goto failed;
        }
    }
    if (field20)
    {
        node->field20 = field20->Copy();
        if (!node->field20)
        {
            goto failed;
        }
    }
    if (field24)
    {
        node->field24 = field24->Copy();
        if (!node->field24)
        {
            goto failed;
        }
    }
    return node;
failed:
    return 0;
}
CNodeState *CNodeState::Copy()
{
    CNodeState *node = new CNodeState;
    if (!node)
    {
        return 0;
    }
    COPY_CHILD(field10)
    COPY_CHILD(field14)
    COPY_CHILD(field18)
    return node;
}
CNodeRegister *CNodeRegister::Copy()
{
    CNodeRegister *node = new CNodeRegister;
    if (!node)
    {
        return 0;
    }
    COPY_CHILD(field10)
    COPY_CHILD(field14)
    return node;
}
#undef COPY_CHILD

int __stdcall TokenEqual(const D3DXTOKEN *first, const D3DXTOKEN *second);
int CNodeVariable::IsEqual(CNode *other)
{
    CNodeVariable *value = (CNodeVariable *)other;
    if (!CNode::IsEqual(other) || field10 != value->field10 || field14 != value->field14 ||
        scopeKind != value->scopeKind || flags != value->flags || field34 != value->field34 ||
        !CNode::IsEqual(field20, value->field20) || !CNode::IsEqual(field24, value->field24) ||
        !CNode::IsEqual(field28, value->field28) || !CNode::IsEqual(field2c, value->field2c) ||
        !CNode::IsEqual(field30, value->field30))
    {
        return 0;
    }
    if (field34 && memcmp(field38, value->field38, field34 * sizeof(unsigned)))
    {
        return 0;
    }
    return 1;
}
CNodeValue::CNodeValue() : CNode((_D3DXNODE_TYPE)14)
{
    memset(&value, 0, sizeof(value));
    memset(&token, 0, sizeof(token));
    value.kind = (_D3DXVALUE_TYPE)3;
}
CNodeValue::CNodeValue(const _D3DXVALUE *source, const D3DXTOKEN *t)
    : CNode((_D3DXNODE_TYPE)14)
{
    value = *source;
    token = *t;
    if (value.kind == VALUE_CODE_4 && value.data.node)
    {
        value.data.node = CNode::Copy(value.data.node);
    }
}
CNodeValue::CNodeValue(_D3DXVALUE_TYPE k, unsigned x, const D3DXTOKEN *t)
    : CNode((_D3DXNODE_TYPE)14)
{
    value.kind = k;
    value.data.words.low = x;
    token = *t;
}
CNodeValue::CNodeValue(_D3DXVALUE_TYPE k, CNode *x, const D3DXTOKEN *t)
    : CNode((_D3DXNODE_TYPE)14)
{
    value.kind = k;
    value.data.node = x;
    token = *t;
}
CNodeValue::CNodeValue(_D3DXVALUE_TYPE k, double x, const D3DXTOKEN *t)
    : CNode((_D3DXNODE_TYPE)14)
{
    value.data.real = x;
    value.kind = k;
    token = *t;
}
CNodeValue::CNodeValue(_D3DXVALUE_TYPE k, unsigned a, unsigned b, const D3DXTOKEN *t)
    : CNode((_D3DXNODE_TYPE)14)
{
    value.kind = k;
    value.data.words.low = a;
    value.data.words.high = b;
    token = *t;
}
CNodeValue::CNodeValue(_D3DXVALUE_TYPE k, unsigned char *a, unsigned b, const D3DXTOKEN *t)
    : CNode((_D3DXNODE_TYPE)14)
{
    value.kind = k;
    value.data.words.low = (unsigned)a;
    value.data.words.high = b;
    token = *t;
}
int CNodeValue::IsEqual(CNode *other)
{
    CNodeValue *node = (CNodeValue *)other;
    if (!CNode::IsEqual(other))
    {
        return 0;
    }
    if (value.kind != node->value.kind)
    {
        return 0;
    }
    if (!memcmp(&value, &node->value, sizeof(value)))
    {
        return 1;
    }
    if (value.kind == VALUE_CODE_4 && CNode::IsEqual(value.data.node, node->value.data.node))
    {
        return 1;
    }
    return 0;
}
CNodeValue *CNodeValue::Copy()
{
    CNodeValue *node = new CNodeValue;
    if (!node)
    {
        return 0;
    }
    node->value = value;
    node->token = token;
    // PINNED: the original updates the source node here, not its copy.
    if (value.kind == VALUE_CODE_4 && value.data.node)
    {
        value.data.node = CNode::Copy(value.data.node);
        if (!value.data.node)
        {
            return 0;
        }
    }
    return node;
}
CNodeBuffer::CNodeBuffer() : CNode((_D3DXNODE_TYPE)15), data(0), size(0)
{
}
CNodeBuffer::CNodeBuffer(const D3DXTOKEN *t, unsigned char *d, unsigned n)
    : CNode((_D3DXNODE_TYPE)15)
{
    token = *t;
    data = d;
    size = n;
}
CNodeBuffer *CNodeBuffer::Copy()
{
    CNodeBuffer *node = new CNodeBuffer;
    if (!node)
    {
        return 0;
    }
    node->token = token;
    node->data = data;
    node->size = size;
    return node;
}
#endif
#undef NODE_VIRTUALS
}
