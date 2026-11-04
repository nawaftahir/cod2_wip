import os,subprocess,sys
BASE=os.getcwd()
specs=[("10022040","/O2"),("10022220","/O1"),("10021bf0","/O1")]
for a,fl in specs:
    n=os.listdir('src/draft')
    fn=[f for f in n if f.startswith(a+'_')][0]
    subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work","-w","/work/src/draft",
        "cod2-msvc71","sh","-c",
        f"cl /nologo /W0 {fl} /c {fn} /Fo../../build/objs_red/f_{a}.obj"],capture_output=True)
    r=subprocess.run(["python3","tools/match_gfx.py","diff",a,f"build/objs_red/f_{a}.obj"],
        capture_output=True,text=True)
    ok="100%" in r.stdout
    print(("OK  " if ok else "FAIL"),a,fn,r.stdout.strip().splitlines()[0] if r.stdout else "",flush=True)
    if ok:
        open(f"src/f/{fn}".replace('src/draft/','src/f/') if False else os.path.join(BASE,'src/f',fn),'w').write(open('src/draft/'+fn).read())
        print("   promoted",fn)
