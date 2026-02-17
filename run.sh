program="mathmancer"
version="dev-1"

echo ""
echo "--------------------"
echo "lua_modules updating"
echo "--------------------"
echo ""

./luarocks make "$program-$version.rockspec"

echo ""
echo "--------"
echo "run game"
echo "--------"
echo ""

./lua ./init.lua