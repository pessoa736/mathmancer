#!/bin/sh

LUAROCKS_SYSCONFDIR='/etc/luarocks' exec '/usr/bin/lua5.4' -e 'package.path="/home/davi/Documents/mathmancer/lua_modules/share/lua/5.4/?.lua;/home/davi/Documents/mathmancer/lua_modules/share/lua/5.4/?/init.lua;/home/davi/.luarocks/share/lua/5.4/?.lua;/home/davi/.luarocks/share/lua/5.4/?/init.lua;/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;"..package.path;package.cpath="/home/davi/Documents/mathmancer/lua_modules/lib/lua/5.4/?.so;/home/davi/.luarocks/lib/lua/5.4/?.so;/usr/lib/lua/5.4/?.so;"..package.cpath' $([ "$*" ] || echo -i) "$@"
