# Renderer compiler inputs

The public Git tree contains recipes only. Never add compiler executables, SDK
headers/libraries, retail anchors, PDBs or built DLLs here.

Original compiler image: sha256:093ff3cf41bff5ef6b7ef1dafce5ace185814c694066cdeef2686042d5324c7d.
cl.exe SHA256: 2ecf86a3edfd3deae498e08298e210e984537ce9e11759930561e43f40bd2515.
link.exe SHA256: 0d5f9712d0da843d787bf4ce4e678abc6b737940996706b2c86101eac9df3e3c.
Retail SHA256: 4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6.

Dockerfile takes a PRIVATE build context containing sdk/{Include,Lib} from the
Summer 2004 SDK and anchor.dll. It extends the original local compiler image.
Its already-built local test image is cod2-gfx-ci-local:20261104. Registry
publication requires separate explicit authorization; never make it public.

For local work, set DXSDK and GFX_ANCHOR to your installed read-only inputs.
No inputs are fetched from the old gfx repository or archived workspaces.
