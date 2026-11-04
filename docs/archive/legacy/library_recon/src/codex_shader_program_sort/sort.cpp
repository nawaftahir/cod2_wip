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
    if (split > 0)
    {
        unsigned firstChild = split * 2 + 1;
        while (split > 0)
        {
            split--;
            firstChild -= 2;
            unsigned hole = split;
            unsigned value = array[hole];
            unsigned child = firstChild;
            while (child < count)
            {
                unsigned selected = array[child];
                unsigned right = child + 1;
                if (right < count)
                {
                    unsigned other = array[child + 1];
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
        unsigned value = array[count];
        array[count] = array[0];
        unsigned hole = 0;
        unsigned child = 1;
        while (child < count)
        {
            unsigned selected = array[child];
            unsigned right = child + 1;
            if (right < count)
            {
                unsigned other = array[child + 1];
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
