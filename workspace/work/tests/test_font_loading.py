"""Actual font file fixups and the shared16-entry registry."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
source=(work/'src/gfx_d3d/r_font.cpp').read_text()
source=source[source.index('static int registeredFontCount;'):source.index('void R_DuplicateFont(')]
start=source.index('typedef char fontFileLayoutCheck')
source=source[:start]+source[source.index('];',start)+2:]
program=r'''
#include <cassert>
#include <cstdarg>
#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <strings.h>
#include <string>
#include <vector>
typedef unsigned char byte;typedef int fileHandle_t;
enum {ERR_DROP=1};struct Material {} defaultMaterial,replacementMaterial,loadedMaterial;
struct Glyph {unsigned short letter;signed char x0,y0;byte dx,pixelWidth,pixelHeight;float s0,t0,s1,t1;};
struct Font_s {const char *name;int pixelHeight,glyphCount;const Material *material;Glyph *glyphs;};
struct {const Material *defaultMaterial;} rgp;
std::vector<byte> bytes;std::string request;
struct Allocation {byte *raw;int size;};std::vector<Allocation> allocations;
int result,reads,opens,closes,allocs,materials,errors,track,position;
bool shortRead,changeDefault,throwError;
void *lastAllocation;
std::vector<std::string> prints,errorTexts;
int Open(const char *name,int *handle,int unique){assert(request==name&&unique==1);++opens;*handle=37;return result;}
void *Alloc(int size){assert(opens==1&&closes==0&&size==result+4);++allocs;byte *p=(byte *)malloc(size+16);memset(p,0x5a,size+16);allocations.push_back({p,size});return lastAllocation=p+8;}
int Read(void *out,int length,int handle){assert(handle==37&&closes==0&&reads<2);assert(out==(byte *)lastAllocation+(reads?20:0)&&length==(reads?result-16:16));++reads;memcpy(out,bytes.data()+position,length);position+=length;return shortRead?0:length;}
void Close(int handle){assert(handle==37&&closes++==0);if(changeDefault)rgp.defaultMaterial=&replacementMaterial;}
struct {int (*FS_FOpenFileRead)(const char *,int *,int);void *(*Hunk_AllocInternal)(int);int (*FS_Read)(void *,int,int);void (*FS_FCloseFile)(int);} ri={Open,Alloc,Read,Close};
void Com_Printf(const char *format,...){char text[1024];va_list args;va_start(args,format);vsnprintf(text,sizeof(text),format,args);va_end(args);prints.push_back(text);}
struct Drop {};
void R_Error(int code,const char *format,...){assert(code==ERR_DROP);++errors;char text[1024];va_list args;va_start(args,format);vsnprintf(text,sizeof(text),format,args);va_end(args);errorTexts.push_back(text);if(throwError)throw Drop();}
int I_stricmp(const char *a,const char *b){return strcasecmp(a,b);}
Material *Material_Register(const char *name,int imageTrack){assert(!strcmp(name,"font_material")&&imageTrack==track&&closes==1);++materials;return &loadedMaterial;}
''' + source + r'''
void resetIO(const char *name) {request=name;reads=opens=closes=allocs=materials=errors=position=0;shortRead=changeDefault=throwError=false;prints.clear();errorTexts.clear();rgp.defaultMaterial=&defaultMaterial;}
void makeFile(const char *name,bool material) {
    const char *mat=material?"font_material":"";int stringOffset=16+sizeof(Glyph);
    bytes.assign(stringOffset+strlen(name)+1+strlen(mat)+1,0x2a);
    FontFileHeader header={(unsigned)stringOffset,48,1,(unsigned)(stringOffset+strlen(name)+1)};
    memcpy(bytes.data(),&header,16);strcpy((char *)bytes.data()+header.nameOffset,name);strcpy((char *)bytes.data()+header.materialOffset,mat);result=bytes.size();
}
void guards() {for(const auto &a:allocations)for(int i=0;i<8;++i){assert(a.raw[i]==0x5a&&a.raw[a.size+8+i]==0x5a);}}
int main() {
    static_assert(sizeof(Font_s)==20&&sizeof(Glyph)==24&&sizeof(FontFileHeader)==16,"primary font layouts");
    int cases=0;
    for(int length:{-3,-2,-1,0,1,15}) {
        resetIO("fonts/test");result=length;assert(!R_LoadFont(request.c_str(),1));
        assert(opens==1&&allocs==0&&reads==0&&closes==(length>=0)&&prints.size()==1);
        std::string expected=length==-2?"^1ERROR: Couldn't find font in iwd files or localized directories 'fonts/test'\n":length<0?"^1ERROR: Couldn't find font 'fonts/test'\n":"^1ERROR: Font file 'fonts/test' too small\n";assert(prints[0]==expected);++cases;
    }
    for(int material:{0,1})for(int shortResult:{0,1})for(int imageTrack:{-1,0,1,6})for(int lateDefault:{0,1}) {
        resetIO("fonts/test");makeFile("fonts/test",material);shortRead=shortResult;track=imageTrack;changeDefault=lateDefault;
        Font_s *font=R_LoadFont(request.c_str(),track);assert(font&&reads==2&&closes==1&&allocs==1&&materials==material&&prints.empty());
        assert(!strcmp(font->name,"fonts/test")&&font->pixelHeight==48&&font->glyphCount==1&&font->glyphs==(Glyph *)(font+1));
        assert(font->material==(material?&loadedMaterial:lateDefault?&replacementMaterial:&defaultMaterial));
        assert(!memcmp(font->glyphs,bytes.data()+16,sizeof(Glyph)));guards();++cases;
    }
    resetIO("fonts/minimal");bytes.assign(16,0);result=16;Font_s *minimal=R_LoadFont(request.c_str(),0);
    assert(minimal&&minimal->glyphCount==0&&minimal->glyphs==(Glyph *)(minimal+1)&&!minimal->name[0]&&materials==0&&closes==1);++cases;
    registeredFontCount=0;memset(registeredFont,0,sizeof(registeredFont));
    for(int i=0;i<16;++i) {
        std::string name="fonts/f"+std::to_string(i);resetIO(name.c_str());makeFile(name.c_str(),true);track=i;
        Font_s *font=R_RegisterFont(request.c_str(),track);assert(font&&registeredFontCount==i+1&&registeredFont[i]==font);++cases;
    }
    resetIO("FONTS/F0");Font_s *cached=R_RegisterFont(request.c_str(),999);assert(cached==registeredFont[0]&&opens==0&&registeredFontCount==16);++cases;
    for(int throwing:{0,1}) {
        resetIO("fonts/full");throwError=throwing;bool threw=false;try{assert(!R_RegisterFont(request.c_str(),1));}catch(Drop &){threw=true;}
        assert(threw==throwing&&errors==1&&opens==0&&registeredFontCount==16&&errorTexts[0]=="R_RegisterFont: Too many fonts registered already.\n");++cases;
    }
    for(int throwing:{0,1}) {
        resetIO("fonts/missing");registeredFontCount=0;result=-1;throwError=throwing;bool threw=false;
        try{assert(!R_RegisterFont(request.c_str(),1));}catch(Drop &){threw=true;}
        assert(threw==throwing&&errors==1&&registeredFontCount==!throwing&&errorTexts[0]=="R_RegisterFont: Error while reading font 'fonts/missing'");
        if(!throwing)assert(registeredFont[0]==0);++cases;
    }
    guards();for(auto &a:allocations)free(a.raw);
    printf("PASS: %d actual font load/registry cases; exact disk/runtime fixups,16-font cap, case cache, file ownership, ignored read returns and error publication\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_font_loading_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
