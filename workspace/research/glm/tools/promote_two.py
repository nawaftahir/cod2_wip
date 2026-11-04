import os,subprocess,sys
BASE=os.getcwd()
targets=[("100046e0","FUN_100046e0"),("10015740","FUN_10015740")]
for addr,name in targets:
    fn=[f for f in os.listdir('src/draft') if f.startswith(addr+'_')][0]
    subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work","-w","/work/src/draft",
      "cod2-msvc71","sh","-c",f"cl /nologo /W0 /O2 /c {fn} /Fo../../build/objs_red/v_{addr}.obj"],
      capture_output=True)
    for envmode in ("0","1"):
        e=dict(os.environ); e["MASK_INTRA"]=envmode
        r=subprocess.run(["python3","tools/match_gfx.py","diff",addr,f"build/objs_red/v_{addr}.obj"],
          capture_output=True,text=True,env=e)
        if "MATCH" in r.stdout or "100%" in r.stdout:
            open(os.path.join(BASE,'src/f',fn),'w').write(open('src/draft/'+fn).read())
            print(f"OK {addr} {name} (MASK_INTRA={envmode}) promoted")
            break
    else:
        print(f"FAIL {addr}")
