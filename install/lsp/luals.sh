#!/bin/bash

VERSION=3.8.3
URL="https://github.com/LuaLS/lua-language-server/releases/download/${VERSION}/lua-language-server-${VERSION}-linux-x64.tar.gz"
INSTALLDIR=/opt/luals

sudo mkdir -p $INSTALLDIR

curl -sL $URL | sudo tar zxvf - -C $INSTALLDIR

echo -e "#!/bin/bash\\nexec $INSTALLDIR/bin/lua-language-server \"\$@\"" | sudo tee /usr/local/bin/lua-language-server > /dev/null
sudo chmod 755 /usr/local/bin/lua-language-server
