import os,subprocess,sys
BASE=os.getcwd()
subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work","-w","/work/src/draft",
    "cod2-msvc71","sh","-c",
    "cl /nologo /W0 /O1 /c 10021bf0_R_ClearScreen.c /Fo../../build/objs_red/f_10021bf0.obj"],
    capture_output=True)
r=subprocess.run(["python3","tools/match_gfx.py","diff","10021bf0","build/objs_red/f_10021bf0.obj"],
    capture_output=True,text=True)
print(r.stdout[:400])
