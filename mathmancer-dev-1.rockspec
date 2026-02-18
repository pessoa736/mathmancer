rockspec_format = "3.0"
package = "mathmancer"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***",
   tag = "1.0"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "MIT"
}
dependencies = {
   "lua ~> 5.4",
   "pudimbasicsgl",
   "vmsl"
}
build_dependencies = {
}
build = {
   type = "builtin",
   modules = {}
}
test_dependencies = {
}
