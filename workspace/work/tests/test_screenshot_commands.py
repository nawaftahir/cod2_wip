"""Actual screenshot command routing, numbering, capture and ownership."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_screenshot_capture.cpp').read_text()
source = text[text.index('byte *R_TakeResampledScreenshot('):]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;
static int lastScreenShotNumber;
struct vidConfig_t {int width,height;} vidConfig;
struct World {const char *name,*baseName;} world={"world","map"};
struct {World *world;} rgp={&world};
std::vector<std::string> args,prints,checks;
std::vector<byte> pixels;
std::string savedPath;
int captures,resamples,jpegs,tgas,frees,levelWrites,occupied,overrideCounter,width,height;
bool captureFailure,resampleFailure,live,mutateSize;
char *arg(int index) {return index<int(args.size())?const_cast<char*>(args[index].c_str()):const_cast<char*>("");}
int count(){return args.size();}
void print(int channel,const char *format,...) {
    assert(channel==0);char out[512];va_list ap;va_start(ap,format);vsnprintf(out,sizeof(out),format,ap);va_end(ap);prints.push_back(out);
}
int Com_sprintf(char *out,unsigned int size,const char *format,...) {
    va_list ap;va_start(ap,format);int n=vsnprintf(out,size,format,ap);va_end(ap);return n;
}
void *allocate(int size) {
    assert(size==640*480*3&&!live);pixels.assign(size,0x5a);live=true;
    if(mutateSize)vidConfig={1024,768};return pixels.data();
}
void release(void *ptr){assert(live&&ptr==pixels.data());live=false;++frees;}
int exists(const char *name) {
    checks.push_back(name);if(overrideCounter>=0){lastScreenShotNumber=overrideCounter;overrideCounter=-1;}
    if(occupied){--occupied;return 1;}return 0;
}
int writeFile(const char *name,const void *buffer,int size) {
    assert(!strcmp(name,"levelshots/map.tga")&&buffer==pixels.data()&&live&&size==49170);
    const byte *b=(const byte*)buffer;assert(b[2]==2&&b[12]==128&&b[14]==128&&b[16]==24&&b[17]==0);
    ++levelWrites;return 0;
}
struct {char *(*Cmd_Argv)(int);int (*Cmd_Argc)();void (*Printf)(int,const char*,...);
    void *(*Z_MallocInternal)(int);void (*Z_FreeInternal)(void*);
    int (*FS_FileExists)(const char*);int (*FS_WriteFile)(const char*,const void*,int);
} ri={arg,count,print,allocate,release,exists,writeFile};
byte *R_TakeResampledScreenshot(int w,int h,int components,int header) {
    assert(components==3&&!live&&((w==128&&h==128&&header==18)||(w==512&&h==512&&!header)));
    ++resamples;if(resampleFailure)return 0;pixels.assign(w*h*3+header,0x5a);live=true;return pixels.data();
}
Bool R_GetFrontBufferData(int x,int y,int w,int h,int components,byte *buffer) {
    assert(!x&&!y&&w==640&&h==480&&components==3&&buffer==pixels.data()&&live);++captures;return !captureFailure;
}
void R_SaveJpg(const char *name,int quality,int w,int h,byte *buffer) {
    assert(quality==90&&buffer==pixels.data()&&live&&((w==640&&h==480)||(w==512&&h==512)));
    savedPath=name;width=w;height=h;++jpegs;
}
void R_TakeScreenshotTga(int x,int y,int w,int h,const char *name) {
    assert(!x&&!y&&w==640&&h==480&&!live);savedPath=name;width=w;height=h;++tgas;
}
''' + source + r'''
void reset() {
    args={"screenshot"};prints.clear();checks.clear();pixels.clear();savedPath.clear();
    captures=resamples=jpegs=tgas=frees=levelWrites=occupied=0;overrideCounter=-1;
    captureFailure=resampleFailure=live=mutateSize=false;vidConfig={640,480};lastScreenShotNumber=7;
}
int main() {
    int cases=0;
    for(int type:{0,1})for(int fail=0;fail<2;++fail)for(int special=0;special<4;++special) {
        reset();captureFailure=resampleFailure=fail;
        if(special==0)args={"cmd","levelshot","ignored"};
        if(special==1)args={"cmd","savegame","save/thumb"};
        if(special==2)args={"cmd","savegame"};
        if(special==3)args={"cmd","savegame",""};
        R_ScreenShotCmd(type);assert(!live);
        if(special==0)assert(resamples==1&&levelWrites==!fail&&frees==!fail&&jpegs==0&&tgas==0&&lastScreenShotNumber==7);
        else if(special==1)assert(resamples==1&&jpegs==!fail&&frees==!fail&&tgas==0&&prints.empty()&&lastScreenShotNumber==7&&(fail||savedPath=="save/thumb.jpg"));
        else {
            std::string name=special==2?"screenshots/savegame.":"screenshots/shot0007.";name+=type?"tga":"jpg";
            assert(tgas==int(type==1)&&jpegs==int(type==0&&!fail));
            if(type||!fail)assert(savedPath==name);
            assert(prints.size()==1&&prints[0]=="Wrote "+name+"\n"&&lastScreenShotNumber==(special==2?7:8));
        }
        ++cases;
    }
    for(int type:{0,1})for(int start:{-1,0,9998,9999,10000})for(int used:{0,2})for(int silent=0;silent<2;++silent) {
        reset();lastScreenShotNumber=start;occupied=used;if(silent)args.push_back("silent");
        R_ScreenShotCmd(type);assert(!live);
        bool success=start<9999&&(start+used)<9999;
        if(success) {
            assert(jpegs+tgas==1&&prints.size()==size_t(!silent));
            int chosen=start<0?(used?used-1:9999):start+used;
            char number[80];sprintf(number,"screenshots/shot%04i.%s",chosen,type?"tga":"jpg");assert(savedPath==number);
            assert(lastScreenShotNumber==(start<0?(used?used:0):start+used+1));
        } else assert(!jpegs&&!tgas&&prints.size()==1&&prints[0]=="ScreenShot: Couldn't create a file\n");
        assert(checks.size()==size_t(start>9999?0:success?used+1:start==9999?(used?1:1):2));++cases;
    }
    reset();lastScreenShotNumber=10000;args={"cmd","custom"};R_ScreenShot_f();
    assert(savedPath=="screenshots/custom.tga"&&checks.empty()&&lastScreenShotNumber==10000);++cases;
    reset();overrideCounter=9999;R_ScreenShotJpeg_f();assert(!jpegs&&!tgas&&lastScreenShotNumber==9999&&prints.size()==1);++cases;
    reset();R_ScreenShot_f();assert(savedPath=="screenshots/shot0007.tga");R_ScreenShotJpeg_f();assert(savedPath=="screenshots/shot0008.jpg"&&lastScreenShotNumber==9);++cases;
    reset();mutateSize=true;R_ScreenShotJpeg_f();assert(jpegs==1&&width==640&&height==480&&vidConfig.width==1024);++cases;
    for(int type:{-1,2,99}){reset();R_ScreenShotCmd(type);assert(checks.empty()&&prints.empty()&&!jpegs&&!tgas&&lastScreenShotNumber==7);++cases;}
    printf("PASS: %d actual screenshot command routes, JPEG/TGA wrappers, level/savegame paths, cached dimensions, numbering edge cases, capture failures and ownership\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_screenshot_commands_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
