dnl check for socklen_t (in Unix98)
AC_DEFUN([APC_TYPE_SOCKETLEN_T], [
    AC_MSG_CHECKING([for socklen_t])
    AC_COMPILE_IFELSE([
        AC_LANG_PROGRAM([[
#include <sys/types.h>
#include <sys/socket.h>
socklen_t x;
        ]], [[
        ]])
    ], [
        AC_MSG_RESULT([yes])
    ], [
        AC_COMPILE_IFELSE([
            AC_LANG_PROGRAM([[
#include <sys/types.h>
#include <sys/socket.h>
int accept (int, struct sockaddr *, size_t *);
            ]], [[
            ]])
        ], [
            AC_MSG_RESULT([size_t])
            AC_DEFINE([socklen_t], [size_t], [Define base type for socklen_t if needed])
        ], [
            AC_MSG_RESULT([int])
            AC_DEFINE([socklen_t], [int], [Define base type for socklen_t if needed])
        ])
    ])
])

dnl
dnl Find GNU make
dnl
AC_DEFUN([APC_PROG_GMAKE],[
    AX_CHECK_GNU_MAKE(
        [MAKE=${ax_cv_gnu_make_command}],
        [AC_MSG_ERROR([Could not find GNU make])]
    )
])

dnl
dnl AC_PATH_PROGS but fail with an error if none can be found
dnl
AC_DEFUN([APC_REQ_PATH_PROGS],[
    AC_PATH_PROGS([$1],[$2],[])
    AS_IF([test -z "$$1"],
        [AC_MSG_ERROR([Missing required tool; need any one of: $2])]
    )
])

dnl
dnl AC_PATH_PROG but fail with an error if it cannot be found
dnl
AC_DEFUN([APC_REQ_PATH_PROG],[
    AC_PATH_PROG([$1],[$2],[])
    AS_IF([test -z "$$1"],
        [AC_MSG_ERROR([Missing required tool: $2])]
    )
])

dnl
dnl AC_CHECK_TOOL but fail with an error if it cannot be found
dnl
AC_DEFUN([APC_REQ_TOOL],[
    AC_CHECK_TOOL([$1],[$2],[])
    AS_IF([test -z "$$1"],
        [AC_MSG_ERROR([Missing required tool: $2])]
    )
])

dnl
dnl Adds a compile flag if the compiler supports it
dnl
AC_DEFUN([APC_ADD_COMPILE_FLAG],[
    AX_CHECK_COMPILE_FLAG([$1],[CXXFLAGS="$CXXFLAGS $1"])
])
