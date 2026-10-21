"""Exercise actual DX7 argument parsing and partial-write/error behavior."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('// PINNED10190250:'):text.index('// PINNED 10019480:')]
start = text.index('static Bool Material_MatchToken(const char **text, const char *match)\n{')
source = text[start:text.index('\n}', start) + 2] + '\n' + source
program = r'''
#include <cassert>
#include <cstddef>
#include <cstdlib>
#include <cstring>
#include <cstdarg>
#include <cstdio>
#include <string>
#include <vector>
typedef unsigned char Bool;
typedef unsigned char byte;
struct MaterialShaderArgument { unsigned short type,dest;union { int codeSampler; } u; };
// Native fixture models the PC state-map pointer slot as a32-bit handle.
const unsigned stateMap=0x1234;
struct MaterialPassDx7 {
    unsigned stateMap;Bool gridLighting,projectToInfinity,ambientLighting,objectiveGlow,fogToBlack;
    byte genTexCoords[2];MaterialShaderArgument samplers[2];int colorStageBits[8],alphaStageBits[8];
};
struct PassOptionDx7 { const char *name;size_t valueOffset; };
enum { MTL_TEXFUNC_VALID_BOTH=3 };
struct MtlTextureFunctionDx7 { const char *name;int enumerant,argCount,valid; };
std::vector<std::string> tokens,messages,printed;unsigned cursor;
const char *Com_Parse(const char **) { return cursor<tokens.size()?tokens[cursor++].c_str():""; }
void Com_UngetToken() { assert(cursor);--cursor; }
int Com_ParseInt(const char **text) { return atoi(Com_Parse(text)); }
void Com_ScriptWarning(const char *format,...) {
    char message[256];va_list args;va_start(args,format);
    vsnprintf(message,sizeof(message),format,args);va_end(args);messages.push_back(message);
}
int Com_MatchToken(const char **text,const char *match,int warning) {
    assert(warning==1);bool ok=!strcmp(Com_Parse(text),match);if(!ok)messages.push_back("mismatch");return ok;
}
void Com_Printf(const char *format,...) {
    char message[256];va_list args;va_start(args,format);
    vsnprintf(message,sizeof(message),format,args);va_end(args);printed.push_back(message);
}
Bool Material_ParseSamplerSource(const char **text,MaterialShaderArgument *argument) {
    if(strcmp(Com_Parse(text),"sampler")||strcmp(Com_Parse(text),"."))return 0;
    const char *name=Com_Parse(text);if(strcmp(name,"white")&&strcmp(name,"black"))return 0;
    argument->type=3;argument->u.codeSampler=!strcmp(name,"white");return 1;
}
Bool Material_LoadPassStateMap(const char **text,unsigned *out) {
    if(!Com_MatchToken(text,"stateMap",1)||strcmp(Com_Parse(text),"mock"))return 0;
    *out=stateMap;return Com_MatchToken(text,";",1)!=0;
}
'''+source+r'''
void reset(std::initializer_list<const char *> input) {
    tokens.clear();for(auto token:input)tokens.push_back(token);cursor=0;messages.clear();printed.clear();
}
int main() {
    const char *input="";
    for(int sampler=0;sampler<8;++sampler)for(int modifiers=0;modifiers<4;++modifiers)
    for(int kind=0;kind<4;++kind) {
        tokens.clear();cursor=0;messages.clear();
        if(modifiers&1)tokens.push_back("complement");
        if(modifiers&2)tokens.push_back("alphaReplicate");
        const char *names[]={"vertex","texture","stage","constant"};tokens.push_back(names[kind]);
        if(kind==0){tokens.push_back(".");tokens.push_back("color");}
        if(kind==1||kind==2){tokens.push_back("[");tokens.push_back(std::to_string(sampler-(kind==2)));tokens.push_back("]");}
        tokens.push_back("untouched");int argument=0x777;
        bool ok=Material_ParseTextureArgumentDx7(&input,sampler,&argument)!=0;
        int flags=((modifiers&1)?8:0)|((modifiers&2)?16:0);
        if(kind==2&&!sampler)assert(!ok&&argument==flags&&!messages.empty());
        else {
            const int values[]={2,5,1,6};
            assert(ok&&argument==(flags|values[kind])&&messages.empty()&&tokens[cursor]=="untouched");
        }
    }
    reset({"complement","texture","[","3","]"});int argument=123;
    assert(!Material_ParseTextureArgumentDx7(&input,2,&argument)&&argument==8);
    assert(messages==std::vector<std::string>({"expected 2, found 3 instead\n"}));
    reset({"alphaReplicate","missing"});
    assert(!Material_ParseTextureArgumentDx7(&input,1,&argument)&&argument==16);
    assert(messages==std::vector<std::string>({"unknown texture function argument 'missing'\n"}));
    reset({"(","vertex",".","color",",","complement","texture","[","2","]",",","constant",")",";"});
    int bits=0x1d;assert(Material_ParseTextureArgumentsDx7(&input,2,3,&bits));
    assert(bits==(0x1d|(2<<10)|(13<<15)|(6<<20))&&tokens[cursor]==";"&&messages.empty());
    reset({"(","constant",",","missing"});bits=0x1d;
    assert(!Material_ParseTextureArgumentsDx7(&input,2,2,&bits)&&bits==(0x1d|(6<<10)));
    reset({"(",")","next"});bits=0x1d;
    assert(Material_ParseTextureArgumentsDx7(&input,0,0,&bits)&&bits==0x1d&&tokens[cursor]=="next");
    reset({"(","constant","bad"});bits=0x1d;
    assert(!Material_ParseTextureArgumentsDx7(&input,1,1,&bits)&&bits==(0x1d|(6<<10)));
    for(int index=0;index<21;++index)for(int valid=1;valid<=3;++valid) {
        const auto &op=s_textureFuncsDx7[index];
        reset({});tokens={op.name,"("};int expected=op.enumerant;
        for(int arg=0;arg<op.argCount;++arg) {
            if(arg)tokens.push_back(",");tokens.push_back("constant");expected|=6<<(10+arg*5);
        }
        tokens.push_back(")");tokens.push_back(";");bits=0x777;
        assert(Material_ParseTextureFunctionDx7(&input,1,valid,&bits));
        assert(bits==expected&&tokens[cursor]==";"&&messages.empty()&&printed.empty());
    }
    reset({"missing"});bits=0x777;
    assert(!Material_ParseTextureFunctionDx7(&input,0,1,&bits)&&bits==0x777);
    assert(messages.size()==1&&printed.size()==22&&printed[0]=="Valid texture functions:.\n");
    reset({"select"});bits=0x777;
    assert(!Material_ParseTextureFunctionDx7(&input,0,0,&bits)&&bits==0x777);
    assert(messages==std::vector<std::string>({"select is only valid for color"}));
    reset({"modulate","(","constant",",","missing"});bits=0x777;
    assert(!Material_ParseTextureFunctionDx7(&input,1,3,&bits)&&bits==(3|(6<<10)));
    reset({"stage","[","1","]",".","color","=","select","(","constant",")",";","next"});
    bits=0x777;assert(Material_LoadPassTextureStateDx7(&input,1,"color",1,&bits));
    assert(bits==(1|(6<<10))&&tokens[cursor]=="next"&&messages.empty());
    reset({"stage","[","0","]",".","color","=","select","(","constant",")",";"});
    bits=0x777;assert(!Material_LoadPassTextureStateDx7(&input,1,"color",1,&bits)&&bits==0x777);
    for(int kind=0;kind<3;++kind) {
        reset({"texcoord","[","1","]","=",kind==0?"genEyeDirCoords":kind==1?"texScroll":"genEyeFacingDotCoords","(",")",";","next"});
        byte generator=0xa5;bool ok=Material_LoadPassTexCoordDx7(&input,1,&generator)!=0;
        assert(ok==(kind<2)&&generator==(kind<2?kind+1:0));
        if(ok)assert(tokens[cursor]=="next"&&messages.empty());else assert(messages.size()==1);
    }
    reset({"next"});byte generator=0xa5;
    assert(Material_LoadPassTexCoordDx7(&input,0,&generator)&&!generator&&!cursor);
    reset({"texcoord","[","0","]","=","texScroll","bad"});generator=0xa5;
    assert(!Material_LoadPassTexCoordDx7(&input,0,&generator)&&generator==2);
    reset({"texture","[","0","]","=","sampler",".","black",";","}"});
    MaterialPassDx7 pass;memset(&pass,0xa5,sizeof(pass));pass.stateMap=stateMap;
    assert(Material_LoadPassSamplersDx7(&input,&pass)&&tokens[cursor]=="}");
    assert(pass.samplers[0].type==3&&pass.samplers[0].dest==0xa5a5&&pass.samplers[0].u.codeSampler==0);
    assert(pass.samplers[1].type==3&&pass.samplers[1].dest==1&&pass.samplers[1].u.codeSampler==1);
    assert(!pass.genTexCoords[0]&&!pass.genTexCoords[1]&&pass.stateMap==stateMap);
    reset({"texture","[","0","]","=","sampler",".","white",";",
        "texcoord","[","0","]","=","texScroll","(",")",";",
        "texture","[","1","]","=","sampler",".","black",";","next"});
    memset(&pass,0xa5,sizeof(pass));assert(Material_LoadPassSamplersDx7(&input,&pass));
    assert(pass.genTexCoords[0]==2&&!pass.genTexCoords[1]&&tokens[cursor]=="next");
    assert(pass.samplers[1].dest==0xa5a5&&pass.samplers[1].u.codeSampler==0);
    reset({"wrong"});memset(&pass,0xa5,sizeof(pass));
    assert(!Material_LoadPassSamplersDx7(&input,&pass)&&pass.samplers[0].type==0xa5a5);
    for(int stages:{1,8}) {
        reset({});for(int i=0;i<stages;++i)for(const char *channel:{"rgb","a"}) {
            tokens.insert(tokens.end(),{"stage","[",std::to_string(i),"]",".",channel,"=","select","(","constant",")",";"});
        }
        tokens.push_back("}");memset(&pass,0xa5,sizeof(pass));
        assert(Material_LoadPassStagesDx7(&input,&pass)&&tokens[cursor]=="}");
        for(int i=0;i<8;++i)assert(pass.colorStageBits[i]==(i<stages?(1|(6<<10)):0)
            &&pass.alphaStageBits[i]==(i<stages?(1|(6<<10)):0));
    }
    reset({"stateMap","mock",";","fogToBlack","(",")",";",
        "texture","[","0","]","=","sampler",".","white",";",
        "stage","[","0","]",".","rgb","=","select","(","constant",")",";",
        "stage","[","0","]",".","a","=","select","(","constant",")",";","}"});
    memset(&pass,0xa5,sizeof(pass));assert(Material_LoadPassDx7(&input,&pass));
    assert(pass.stateMap==stateMap&&pass.fogToBlack&&!pass.ambientLighting&&tokens[cursor]=="}");
    assert(pass.samplers[1].dest==1&&pass.samplers[1].u.codeSampler==1);
    assert(pass.colorStageBits[0]==(1|(6<<10))&&!pass.colorStageBits[7]&&!pass.alphaStageBits[7]);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_texture_args_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: DX7 arguments,operators,stage syntax,coordinate generators,sampler wiring and partial writes')
