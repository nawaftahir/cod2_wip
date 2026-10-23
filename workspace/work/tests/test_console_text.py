"""Packed console runs/icons and both real API callbacks, including draw geometry."""
from pathlib import Path
import subprocess
import tempfile
import struct
import pefile
import capstone

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_font.cpp').read_text()
source = text[text.index('static Glyph *R_GetCharacterGlyph('):]
start = source.index('typedef char consoleIconImportCheck')
source = source[:start] + source[source.index('];', start)+2:]
header = (work.parents[0] / 'src/opencod2/headers/PC/gfx_d3d/rb_backend.h').read_text()

def declaration(name):
    start = header.index('struct '+name+' {')
    return header[start:header.index('\n};',start)+3]

retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
assert retail.get_data(0x19bd54,4) == struct.pack('<f',1/255)
assert retail.get_data(0x19bf18,4) == struct.pack('<f',1/32)
assert retail.get_data(0x19bf3c,4) == struct.pack('<f',0.8)
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
width_body = list(decoder.disasm(retail.get_data(0xc390,192),0x1000c390))
assert width_body[-1].address == 0x1000c44f and width_body[-1].mnemonic == 'ret'
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cmath>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef float vec_t;
struct Material {int id;} defaultMaterial={0},iconMaterial={1},alternateMaterial={2};
typedef Material *MaterialHandle;
''' + declaration('Glyph') + declaration('Font_s') + r'''
typedef Font_s *FontHandle;
struct {Material *defaultMaterial;} rgp;
int nameCalls,registerCalls,nameIndex;bool emptyName,replaceDefault;
unsigned ReadChar(const char **text,int *){return (byte)*(*text)++;}
const char *GetName(int index){++nameCalls;nameIndex=index;if(replaceDefault)rgp.defaultMaterial=&alternateMaterial;return emptyName?"":"hud/icon";}
struct {unsigned (*SEH_ReadCharFromString)(const char **,int *);const char *(*CL_GetHudMsgIconMaterialName)(int);} ri={ReadChar,GetName};
Material *Material_Register(const char *name,int track){assert(!strcmp(name,"hud/icon")&&track==7);++registerCalls;return &iconMaterial;}
struct Draw {std::string text;float x,y,w,h,uv[4],color[4];int style;Material *material;};
std::vector<Draw> draws;
void R_AddCmdDrawTextWithCursor(const char *text,int limit,Font_s *,float x,float y,float xs,float ys,const float *color,int style,int cursor,char letter) {
    assert(limit==0x7fffffff&&cursor==-1&&!letter);Draw d={};d.text=text;d.x=x;d.y=y;d.w=xs;d.h=ys;d.style=style;memcpy(d.color,color,16);draws.push_back(d);
}
void R_AddCmdDrawStretchPic(float x,float y,float w,float h,float s0,float t0,float s1,float t1,const float *color,Material *material) {
    Draw d={};d.x=x;d.y=y;d.w=w;d.h=h;d.uv[0]=s0;d.uv[1]=t0;d.uv[2]=s1;d.uv[3]=t1;d.material=material;memcpy(d.color,color,16);draws.push_back(d);
}
''' + source + r'''
short entry(int type,int value){return (short)((type<<8)|value);}
bool close(float a,float b){return fabsf(a-b)<0.0001f;}
void reset(){nameCalls=registerCalls=0;nameIndex=-1;emptyName=replaceDefault=false;rgp.defaultMaterial=&defaultMaterial;draws.clear();}
int main() {
    static_assert(sizeof(Font_s)==20&&sizeof(Glyph)==24,"PC font records");
    int stringCases=0,iconCases=0,drawCases=0;
    for(int type=0;type<256;++type)for(int value:{0,32,65,255})for(int colors=0;colors<2;++colors) {
        short packed[]={entry(type,value),entry(18,1)};int limit=2;Bool found=99;
        struct {unsigned guard;char text[16];unsigned tail;} out;memset(&out,0x5a,sizeof(out));
        float color[]={.1f,.2f,.3f,.4f};const short *next=R_GetConsoleString(packed,&limit,out.text,colors?color:0,&found);
        bool firstIcon=type==13||type==16||type==17||type==18;
        assert(found&&next==packed+(firstIcon?0:1)&&limit==(firstIcon?2:1));
        if(firstIcon||type==10||type==11||type==12)assert(!out.text[0]);
        else if(type==7){assert((byte)out.text[0]==value&&!out.text[1]);}
        else {assert(out.text[0]=='^'&&(byte)out.text[1]==(byte)(type+'0')&&(byte)out.text[2]==value&&!out.text[3]);}
        for(int i=0;i<4;++i){float expected=colors&&type==10+i&&i<3?value*0.003921568859368563f:.1f*(i+1);assert(close(color[i],expected));}
        assert(out.guard==0x5a5a5a5a&&out.tail==0x5a5a5a5a);++stringCases;
    }
    {
        short packed[]={entry(7,'A'),entry(7,' '),entry(7,' ')};char out[16];int limit=3;Bool found=1;
        assert(!R_GetConsoleString(packed,&limit,out,0,&found)&&!limit&&!found&&!strcmp(out,"A"));
        packed[2]=entry(16,32);limit=3;
        assert(R_GetConsoleString(packed,&limit,out,0,&found)==packed+2&&limit==1&&found&&!strcmp(out,"A "));
        short cap[2048];for(auto &e:cap)e=entry(7,'x');char buffer[1024];limit=2048;
        assert(!R_GetConsoleString(cap,&limit,buffer,0,&found)&&!limit&&strlen(buffer)==1023&&!found);
        for(int negative:{0,-1,-999}){limit=negative;assert(!R_GetConsoleString(cap,&limit,buffer,0,&found)&&limit==negative&&!buffer[0]&&!found);}
    }
    for(int type=0;type<256;++type)for(int colors=0;colors<2;++colors)for(int flip=0;flip<2;++flip)for(int empty=0;empty<2;++empty) {
        reset();emptyName=empty;replaceDefault=true;
        short packed[]={entry(type,64),entry(18,1)};int limit=2;float width=-1,height=-1,color[]={.1f,.2f,.3f,.4f};Material *material=(Material *)1;Bool horz=99;
        const short *next=R_GetConsoleIcon(packed,&limit,&width,&height,&material,colors?color:0,flip?&horz:0);
        assert(next==packed+(type==18?1:2)&&limit==(type==18?1:0));
        assert(width==(type==16||type==19?2:1)&&height==(type==17?2:1));
        assert(!flip||horz==(type==19));assert(nameCalls==1&&nameIndex==(type==18?64:1)&&registerCalls==!empty);
        assert(material==(empty?&alternateMaterial:&iconMaterial));
        for(int i=0;i<4;++i){float expected=colors&&type==13+i&&i<3?64*0.003921568859368563f:.1f*(i+1);assert(close(color[i],expected));}
        ++iconCases;
    }
    for(int limitValue:{-1,0,1,2}) {
        reset();short packed[]={entry(16,64),entry(17,16)};int limit=limitValue;float w,h;Material *m;Bool flip=1;
        assert(!R_GetConsoleIcon(packed,&limit,&w,&h,&m,0,&flip)&&limit==limitValue&&!m&&!flip&&!nameCalls);
        assert(w==(limitValue>0?2:1)&&h==(limitValue>1?.5f:1));++iconCases;
    }
    Glyph glyphs[96]={};for(auto &g:glyphs)g.dx=1;glyphs['A'-32].dx=3;glyphs['B'-32].dx=5;
    Font_s font={"test",20,96,&defaultMaterial,glyphs};float color[]={.2f,.3f,.4f,.5f};
    reset();assert(!R_ConsoleTextWidth(0,1,0));R_DrawConsoleText(0,1,0,0,0,1,1,color,3);assert(draws.empty()&&!nameCalls);
    for(int flip=0;flip<2;++flip)for(int empty=0;empty<2;++empty)for(int widthScale:{16,32,64}) {
        reset();emptyName=empty;replaceDefault=true;
        std::vector<short> packed={entry(7,'A'),entry(16,widthScale)};
        if(flip)packed.push_back(entry(19,64));
        packed.push_back(entry(17,32));packed.push_back(entry(18,1));packed.push_back(entry(7,'B'));
        float iconWidth=(widthScale/32.0f)*(flip?2:1);
        assert(R_ConsoleTextWidth(packed.data(),packed.size(),&font)==int(8+iconWidth));
        assert(nameCalls==1&&registerCalls==!empty);
        nameCalls=registerCalls=0;
        R_DrawConsoleText(packed.data(),packed.size(),&font,10,100,2,3,color,9);
        assert(draws.size()==3&&draws[0].text=="A"&&draws[2].text=="B"&&draws[1].text.empty());
        const Draw &a=draws[0],&q=draws[1],&b=draws[2];float w=iconWidth*40;
        assert(a.x==10&&a.y==100&&a.w==2&&a.h==3&&a.style==9);
        assert(q.x==16&&close(q.y,46)&&q.w==w&&q.h==60&&q.material==(empty?&alternateMaterial:&iconMaterial));
        assert(q.uv[0]==flip&&!q.uv[1]&&q.uv[2]==!flip&&q.uv[3]==1);
        assert(b.x==16+w&&b.y==100&&b.style==9);
        for(auto &d:draws)assert(!memcmp(d.color,color,16));++drawCases;
    }
    {
        reset();short packed[]={entry(10,255),entry(7,'A'),entry(13,0),entry(14,128),entry(15,255),entry(16,32),entry(18,1),entry(7,'B'),entry(7,' ')};
        assert(R_ConsoleTextWidth(packed,9,&font)==9);
        R_DrawConsoleText(packed,9,&font,10,100,2,3,color,9);
        assert(draws.size()==3&&draws[0].text=="A"&&draws[2].text=="B");
        assert(draws[0].color[0]==1&&draws[0].color[1]==color[1]&&draws[0].color[2]==color[2]&&draws[0].color[3]==color[3]);
        for(int i=1;i<3;++i)assert(!draws[i].color[0]&&close(draws[i].color[1],128*0.003921568859368563f)&&draws[i].color[2]==1&&draws[i].color[3]==.5f);
        assert(draws[1].x==16&&draws[1].w==40&&draws[2].x==56);++drawCases;
        reset();short incomplete[]={entry(16,64)};
        assert(R_ConsoleTextWidth(incomplete,1,&font)==2&&!nameCalls);
        R_DrawConsoleText(incomplete,1,&font,10,100,2,3,color,9);
        assert(draws.size()==1&&!draws[0].material&&draws[0].x==10&&draws[0].w==80&&draws[0].h==60&&close(draws[0].y,46)&&!nameCalls);++drawCases;
    }
    printf("PASS: %d console-run,%d icon and%d integrated callback routes; retail controls/cap, spaces, material ownership, limit updates, color and draw geometry\n",stringCases,iconCases,drawCases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_console_text_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
