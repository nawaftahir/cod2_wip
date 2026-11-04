namespace D3DXShader
{
void __stdcall HeapSort(int (__stdcall *compare)(unsigned, unsigned, const void *),
    unsigned *array, unsigned count, const void *context)
{
    if (count <= 1)
    {
        return;
    }
    unsigned split = count / 2;
#if SORT_SHARED_LOCALS
    unsigned hole, value, child, selected, right, other;
#endif
    if (split > 0)
    {
    unsigned firstChild = split * 2 + 1;
    while (split > 0)
    {
        split--;
        firstChild -= 2;
#if SORT_SHARED_LOCALS
        hole = split;
        value = array[hole];
        child = firstChild;
#else
        unsigned hole = split;
        unsigned value = array[hole];
        unsigned child = firstChild;
#endif
        while (child < count)
        {
#if SORT_SHARED_LOCALS
            selected = array[child];
            right = child + 1;
#else
            unsigned selected = array[child];
            unsigned right = child + 1;
#endif
            if (right < count)
            {
#if SORT_SHARED_LOCALS
                other = array[child + 1];
#else
                unsigned other = array[child + 1];
#endif
                if (compare(other, selected, context) > 0)
                {
                    child = right;
                    selected = other;
                }
            }
            if (compare(selected, value, context) <= 0)
            {
                break;
            }
            array[hole] = array[child];
            hole = child;
            child = child * 2 + 1;
        }
        array[hole] = value;
    }
    }
    while (--count)
    {
#if SORT_SHARED_LOCALS
        value = array[count];
        array[count] = array[0];
        hole = 0;
        child = 1;
#else
        unsigned value = array[count];
        array[count] = array[0];
        unsigned hole = 0;
        unsigned child = 1;
#endif
        while (child < count)
        {
#if SORT_SHARED_LOCALS
            selected = array[child];
            right = child + 1;
#else
            unsigned selected = array[child];
            unsigned right = child + 1;
#endif
            if (right < count)
            {
#if SORT_SHARED_LOCALS
                other = array[child + 1];
#else
                unsigned other = array[child + 1];
#endif
                if (compare(other, selected, context) > 0)
                {
                    child = right;
                    selected = other;
                }
            }
            if (compare(selected, value, context) <= 0)
            {
                break;
            }
            array[hole] = array[child];
            hole = child;
            child = child * 2 + 1;
        }
        array[hole] = value;
    }
}
}
