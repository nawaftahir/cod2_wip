# MSVC 7.1 (cl 13.10.3077, link 7.10.3077) + MFC/ATL 7.1 under Wine 5.0 (bullseye), plus make and python.
# Same base as claude_client/toolchain: Wine 8 (bookworm) makes cl.exe hang on compile errors.
FROM i386/debian:bullseye-slim
RUN sed -i "/security/d" /etc/apt/sources.list && apt-get update \
 && apt-get -o Acquire::Retries=5 install -y --no-install-recommends wine make python3 python3-pip \
 && pip3 install --no-cache-dir capstone==4.0.2 pefile==2023.2.7 \
 && rm -rf /var/lib/apt/lists/*
ENV WINEDEBUG=-all WINEPREFIX=/root/.wine RADIANT_IN_IMAGE=1
ENV INCLUDE=Z:\\opt\\msvc710\\Vc7\\include;Z:\\opt\\msvc710\\Vc7\\atlmfc\\include;Z:\\opt\\msvc710\\Vc7\\PlatformSDK\\Include
ENV LIB=Z:\\opt\\msvc710\\Vc7\\lib;Z:\\opt\\msvc710\\Vc7\\atlmfc\\lib;Z:\\opt\\msvc710\\Vc7\\PlatformSDK\\Lib
ADD msvc710.tar.gz /opt/
WORKDIR /w
RUN wineboot -i >/dev/null 2>&1 || true
CMD ["/bin/bash"]
