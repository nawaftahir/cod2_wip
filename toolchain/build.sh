#!/bin/sh
# Build the radiant compiler image: the clean VS2003 toolchain (dev/sdk/vs2003/msvc710_vs2003.tar.gz)
# plus x86 MFC/ATL 7.1 headers and libs from VS2003 disc 1. See README.md.
#   build.sh [image]
set -e
IMG=${1:-cod2-radiant-msvc71}
HERE=$(cd "$(dirname "$0")" && pwd)
SDK=$HERE/../../sdk/vs2003
VC7="$HERE/_extract/disc/Program Files/Microsoft Visual Studio .NET 2003/Vc7"
[ -d "$VC7/atlmfc/lib" ] || { echo "extract disc 1 first (README.md)"; exit 1; }
T=$(mktemp -d); trap 'rm -rf $T' EXIT
tar -xzf "$SDK/msvc710_vs2003.tar.gz" -C $T
mkdir -p $T/msvc710/Vc7/atlmfc/lib
cp -a "$VC7/atlmfc/include" $T/msvc710/Vc7/atlmfc/
cp -a "$VC7/atlmfc/lib/"*.lib $T/msvc710/Vc7/atlmfc/lib/
tar -C $T -czf $HERE/msvc710.tar.gz msvc710
cp $HERE/Dockerfile $HERE/msvc710.tar.gz $T/
docker build -t $IMG $T
sha256sum $HERE/msvc710.tar.gz
