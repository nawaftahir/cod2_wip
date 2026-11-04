"""Exercise the shared pushback body and actual public entry."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work/'src/universal/q_parse.cpp').read_text()
a = text.index('void Com_UngetToken()')
public = text[a:text.index('\n}\n',a)+3]
a = text.index('char *Com_Parse( const char **data_p )')
public += text[a:text.index('\n}\n',a)+3]
shared = (work/'src/universal/parse_inline.h').read_text().replace('#pragma once','')
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#define __forceinline inline
struct parseInfo_t {bool ungetToken,spaceDelimited;int untouched,lines,backup_lines;const char *backup_text;};
struct ParseThreadInfo {parseInfo_t parseInfo[2];int parseInfoNum;const char *tokenPos,*prevTokenPos;};
ParseThreadInfo state;int errors,parseCalls;char fresh[]="fresh";
ParseThreadInfo *Com_GetParseThreadInfo(){return &state;}
char *Com_ParseExt(const char **text,int allowBreaks){assert(allowBreaks==1&&*text);++parseCalls;return fresh;}
void Com_ScriptErrorDrop(const char *message,...){assert(!strcmp(message,"UngetToken called twice"));++errors;throw 1;}
''' + shared + public + r'''
int main(){int cases=0;
 for(int index=0;index<2;++index)for(int usePublic=0;usePublic<2;++usePublic){
  memset(&state,0,sizeof(state));state.parseInfoNum=index;errors=0;
  state.tokenPos="current";state.prevTokenPos="previous";state.parseInfo[index].untouched=99;
  if(usePublic)Com_UngetToken();else Com_UngetTokenInternal();
  assert(state.parseInfo[index].ungetToken&&state.tokenPos==state.prevTokenPos&&errors==0);
  assert(state.parseInfo[index].untouched==99&&!state.parseInfo[1-index].ungetToken);++cases;
  try {if(usePublic)Com_UngetToken();else Com_UngetTokenInternal();assert(false);}
  catch(int error){assert(error==1&&errors==1);}
  assert(state.tokenPos==state.prevTokenPos&&state.parseInfo[index].ungetToken);++cases;
 }
 for(int index=0;index<2;++index)for(int unget=0;unget<2;++unget)for(int usePublic=0;usePublic<2;++usePublic)for(int space=0;space<2;++space){
  memset(&state,0,sizeof(state));state.parseInfoNum=index;parseCalls=0;
  auto &info=state.parseInfo[index];info.ungetToken=unget;info.spaceDelimited=space;info.lines=5;info.backup_lines=2;
  const char original[]="original",backup[]="backup";info.backup_text=backup;const char *text=original;
  assert((usePublic?Com_Parse(&text):Com_ParseInternal(&text))==fresh&&parseCalls==1);
  assert(!info.ungetToken&&info.spaceDelimited==space);
  assert(text==(unget?backup:original)&&info.lines==(unget?2:5));++cases;
 }
 printf("PASS: %d actual token/pushback cases, duplicate error, newline allowance, restore direction and state isolation\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_pushback_') as d:
    binary = str(Path(d)/'test')
    subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
