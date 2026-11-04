namespace D3DXShader
{
// Component codes are pinned by the target; original enumerator names are unknown.
enum _D3DXCOMPONENT_TYPE { COMPONENT_CODE_0 = 0 };
class CParse
{
    friend struct CastFixture;
protected:
    int IsCast(_D3DXCOMPONENT_TYPE from, _D3DXCOMPONENT_TYPE to);
};

#ifndef INSTRUCTION_DECLARATIONS_ONLY
int CParse::IsCast(_D3DXCOMPONENT_TYPE from, _D3DXCOMPONENT_TYPE to)
{
    if (from == to)
    {
        return 0;
    }
    switch (from)
    {
    case 1:
    case 5:
        switch (to)
        {
        case 1: case 2: case 3: case 4:
        case 5: case 6: case 7: case 8: return 0;
        }
        break;
    case 2:
    case 6:
        switch (to)
        {
        case 1: case 2: case 5: case 6: return 0;
        }
        break;
    case 3:
    case 7:
        switch (to)
        {
        case 1: case 3: case 5: case 7: return 0;
        }
        break;
    case 4:
    case 8:
        switch (to)
        {
        case 1: case 4: case 5: case 8: return 0;
        }
        break;
    case 9:
        switch (to)
        {
        case 9: case 10: case 11: case 12: return 0;
        }
        break;
    case 10:
        switch (to)
        {
        case 9: case 10: return 0;
        }
        break;
    case 11:
        switch (to)
        {
        case 9: case 11: return 0;
        }
        break;
    case 12:
        switch (to)
        {
        case 9: case 12: return 0;
        }
        break;
    }
    return 1;
}
#endif
}

