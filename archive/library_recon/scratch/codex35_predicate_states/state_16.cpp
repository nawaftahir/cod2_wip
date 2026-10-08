#include "state_header.h"
long CProgram::PropagatePredicates()
{
    struct PredicateDepthState
    {
        unsigned outputDepth;
        int changed;
        unsigned inputDepth;
        unsigned groups;
    } state;
    unsigned &outputDepth = state.outputDepth;
    int &changed = state.changed;
    unsigned &inputDepth = state.inputDepth;
    unsigned &groups = state.groups;
    changed = 0;
    unsigned j, k, reverse;
    for (unsigned index = 0; index < argumentCount; ++index)
    {
        CArgument *argument = arguments[index];
        CPool *pool = pools[argument->pool];
        argument->remap = argument->relative2;
        argument->opaque40 = argument->link;
        if (pool->flags & 0x10)
        {
            argument->link = 1;
            argument->relative2 = ~0u;
        }
        else if (!(pool->flags & 0x11028))
        {
            argument->link = 0;
            argument->relative2 = ~0u;
        }
    }
    reverse = instructionCount;
    while (reverse > 0)
    {
        CInstruction *instruction = instructions[--reverse];
        if (!(instruction->token & 0xfff00000))
        {
            continue;
        }
        for (j = 1; j < instruction->outputCount; ++j)
        {
            MergePredicates(arguments[instruction->outputs[0]], arguments[instruction->outputs[j]]);
        }
        for (j = 1; j < instruction->outputCount; ++j)
        {
            arguments[instruction->outputs[j]]->relative2 = arguments[instruction->outputs[0]]->relative2;
            arguments[instruction->outputs[j]]->link = arguments[instruction->outputs[0]]->link;
        }
        unsigned opcode = instruction->token & 0xfff00000;
        if (opcode == 0x20700000 || opcode == 0x20800000 || opcode == 0x11500000)
        {
            for (j = 0; j < instruction->outputCount; ++j)
            {
                arguments[instruction->outputs[j]]->relative2 =
                    arguments[arguments[instruction->inputs[j]]->relative2]->relative2;
                arguments[instruction->outputs[j]]->link =
                    arguments[arguments[instruction->inputs[j]]->relative2]->link;
            }
        }
        else if (opcode == 0x11200000)
        {
            groups = instruction->inputCount / instruction->fields.scalarCount;
            for (j = 0; j < instruction->outputCount; ++j)
            {
                for (k = 0; k < groups; ++k)
                {
                    for (unsigned input = instruction->inputs[j + instruction->outputCount * k];
                         input != ~0u; input = arguments[input]->relative)
                    {
                        MergePredicates(arguments[input],
                            arguments[arguments[instruction->outputs[j]]->relative2]);
                    }
                }
            }
        }
        else if ((instruction->token & 0xf0000000) >= 0x10000000 &&
                 (instruction->token & 0xf0000000) <= 0x40000000)
        {
            groups = instruction->inputCount / instruction->fields.scalarCount;
            for (j = 0; j < instruction->outputCount; ++j)
            {
                for (k = 0; k < groups; ++k)
                {
                    for (unsigned input = instruction->inputs[j + instruction->outputCount * k];
                         input != ~0u; input = arguments[input]->relative)
                    {
                        MergePredicates(arguments[input], arguments[instruction->outputs[j]]);
                    }
                }
            }
        }
        else if (instruction->outputCount)
        {
            for (k = 0; k < instruction->inputCount; ++k)
            {
                for (unsigned input = instruction->inputs[k]; input != ~0u;
                     input = arguments[input]->relative)
                {
                    MergePredicates(arguments[input], arguments[instruction->outputs[0]]);
                }
            }
        }
        else
        {
            for (k = 0; k < instruction->inputCount; ++k)
            {
                arguments[instruction->inputs[k]]->relative2 = ~0u;
                arguments[instruction->inputs[k]]->link = 1;
            }
        }
    }
    CArgument temporary;
    for (k = 0; k < instructionCount; ++k)
    {
        CInstruction *instruction = instructions[k];
        unsigned opcode = instruction->token & 0xfff00000;
        if (!opcode || opcode == 0x10f00000 || opcode == 0x20700000 ||
            opcode == 0x11100000 || opcode == 0x11200000 || opcode == 0x11300000 ||
            opcode == 0x11400000 || opcode == 0x20800000 || opcode == 0x20900000 ||
            opcode == 0x11500000)
        {
            continue;
        }
        unsigned outputId = instruction->outputs[0];
        CArgument *output = arguments[outputId];
        if (pools[output->pool]->flags & 0x1000)
        {
            continue;
        }
        outputDepth = 0;
        inputDepth = 0;
        PropagatePredicates_Depth(outputId, &outputDepth);
        for (unsigned relative = output->relative; relative != ~0u;
             relative = arguments[relative]->relative)
        {
            PropagatePredicates_Depth(relative, &inputDepth);
        }
        if (instruction->inputCount > 0)
        {
            unsigned *inputs = instruction->inputs;
            unsigned inputCount = instruction->inputCount;
            do
            {
                for (unsigned input = *inputs; input != ~0u;
                     input = arguments[input]->relative)
                {
                    PropagatePredicates_Depth(input, &inputDepth);
                }
                ++inputs;
            } while (--inputCount);
        }
        unsigned predicate = output->relative2;
        if (outputDepth > inputDepth)
        {
            outputDepth -= inputDepth;
            do
            {
                if (pools[arguments[predicate]->pool]->flags & 0x8000)
                {
                    for (j = 0; j < instruction->outputCount; ++j)
                    {
                        arguments[instruction->outputs[j]]->link = arguments[predicate]->link;
                        arguments[instruction->outputs[j]]->relative2 = arguments[predicate]->relative2;
                    }
                }
                --outputDepth;
                predicate = arguments[predicate]->relative2;
            } while (outputDepth);
        }
    }
    for (unsigned index = 0; index < argumentCount; ++index)
    {
        CArgument *argument = arguments[index];
        if (argument->remap != argument->relative2 || argument->opaque40 != static_cast<unsigned>(argument->link))
        {
            changed = 1;
        }
    }
    if (!changed)
    {
        return 1;
    }
    ReadWriteInfo();
    reverse = instructionCount;
    while (reverse > 0)
    {
        --reverse;
        CInstruction *instruction = instructions[reverse];
        if (!(instruction->token & 0xfff00000))
        {
            continue;
        }
        unsigned last = reverse;
        for (j = 0; j < instruction->outputCount; ++j)
        {
            unsigned predicate = arguments[instruction->outputs[j]]->relative2;
            if (predicate != ~0u && last < arguments[predicate]->instruction)
            {
                last = arguments[predicate]->instruction;
            }
        }
        if (last != reverse)
        {
            for (j = reverse; j < last; ++j)
            {
                instructions[j] = instructions[j + 1];
            }
            instructions[last] = instruction;
            ReadWriteInfo();
        }
    }
    return 0;
}

}
