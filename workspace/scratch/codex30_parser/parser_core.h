namespace D3DXShader
{
int __stdcall PARSE();
class PARSER_CLASS
{
protected:
    static PARSER_CLASS *PARSER_INSTANCE;
    int Token();
    void Production(unsigned rule, unsigned values);
    void Error(const char *format, ...);
    friend int __stdcall PARSE();
};

extern short YY(lhs)[], YY(len)[], YY(defred)[], YY(dgoto)[];
extern short YY(sindex)[], YY(rindex)[], YY(gindex)[], YY(table)[], YY(check)[];
extern short YY(ss)[500], *YY(ssp);
extern int YY(vs)[500], *YY(vsp), YY(val), YY(lval);
extern int YY(char), YY(errflag), YY(nerrs);

int __stdcall PARSE()
{
    int yym, yyn, yystate;
    YY(nerrs) = 0;
    YY(errflag) = 0;
    YY(ssp) = YY(ss);
    YY(vsp) = YY(vs);
    YY(char) = -1;
    *YY(ssp) = yystate = 0;
yyloop:
    if ((yyn = YY(defred)[yystate]) != 0)
    {
        goto yyreduce;
    }
    if (YY(char) < 0)
    {
        if ((YY(char) = PARSER_CLASS::PARSER_INSTANCE->Token()) < 0)
        {
            YY(char) = 0;
        }
    }
    if ((yyn = YY(sindex)[yystate]) != 0 &&
        (yyn += YY(char)) >= 0 && yyn <= TABLE_SIZE && YY(check)[yyn] == YY(char))
    {
        if (YY(ssp) >= YY(ss) + 499)
        {
            goto yyoverflow;
        }
        *++YY(ssp) = yystate = YY(table)[yyn];
        *++YY(vsp) = YY(lval);
        YY(char) = -1;
        if (YY(errflag) > 0)
        {
            --YY(errflag);
        }
        goto yyloop;
    }
    if ((yyn = YY(rindex)[yystate]) != 0 &&
        (yyn += YY(char)) >= 0 && yyn <= TABLE_SIZE && YY(check)[yyn] == YY(char))
    {
        yyn = YY(table)[yyn];
        goto yyreduce;
    }
    if (YY(errflag) == 0)
    {
        PARSER_CLASS::PARSER_INSTANCE->Error("syntax error");
        ++YY(nerrs);
    }
    if (YY(errflag) < 3)
    {
        YY(errflag) = 3;
        for (;;)
        {
            if ((yyn = YY(sindex)[*YY(ssp)]) != 0 &&
                (yyn += 256) >= 0 && yyn <= TABLE_SIZE && YY(check)[yyn] == 256)
            {
                if (YY(ssp) >= YY(ss) + 499)
                {
                    goto yyoverflow;
                }
                *++YY(ssp) = yystate = YY(table)[yyn];
                *++YY(vsp) = YY(lval);
                goto yyloop;
            }
            if (YY(ssp) <= YY(ss))
            {
                goto yyabort;
            }
            --YY(ssp);
            --YY(vsp);
        }
    }
    if (YY(char) == 0)
    {
        goto yyabort;
    }
    YY(char) = -1;
    goto yyloop;
yyreduce:
    yym = YY(len)[yyn];
    YY(val) = YY(vsp)[1 - yym];
    switch (yyn)
    {
#include ACTIONS
    }
    YY(ssp) -= yym;
    yystate = *YY(ssp);
    YY(vsp) -= yym;
    yym = YY(lhs)[yyn];
    if (yystate == 0 && yym == 0)
    {
        yystate = FINAL_STATE;
        *++YY(ssp) = FINAL_STATE;
        *++YY(vsp) = YY(val);
        if (YY(char) < 0)
        {
            if ((YY(char) = PARSER_CLASS::PARSER_INSTANCE->Token()) < 0)
            {
                YY(char) = 0;
            }
        }
        if (YY(char) == 0)
        {
            goto yyaccept;
        }
        goto yyloop;
    }
    if ((yyn = YY(gindex)[yym]) != 0 &&
        (yyn += yystate) >= 0 && yyn <= TABLE_SIZE && YY(check)[yyn] == yystate)
    {
        yystate = YY(table)[yyn];
    }
    else
    {
        yystate = YY(dgoto)[yym];
    }
    if (YY(ssp) >= YY(ss) + 499)
    {
        goto yyoverflow;
    }
    *++YY(ssp) = yystate;
    *++YY(vsp) = YY(val);
    goto yyloop;
yyoverflow:
    PARSER_CLASS::PARSER_INSTANCE->Error("yacc stack overflow");
yyabort:
    return 1;
yyaccept:
    return 0;
}
}
