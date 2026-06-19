AC_DEFUN(AC_TYPE_SOCKETLEN_T,
[ dnl check for socklen_t (in Unix98)
  AC_MSG_CHECKING(for socklen_t)
  AC_TRY_COMPILE([
  #include <sys/types.h>
  #include <sys/socket.h>
  socklen_t x;
  ],[],[AC_MSG_RESULT(yes)],[
  AC_TRY_COMPILE([
  #include <sys/types.h>
  #include <sys/socket.h>
  int accept (int, struct sockaddr *, size_t *);
  ],[],[
  AC_MSG_RESULT(size_t)
  AC_DEFINE(socklen_t,size_t,[Define base type for socklen_t if needed])], [
  AC_MSG_RESULT(int)
  AC_DEFINE(socklen_t,int)])])
])

dnl
dnl Find GNU make
dnl
AC_DEFUN(
   [AC_PROG_GMAKE],
   [AC_CACHE_CHECK(for GNU make,_cv_gnu_make_command,
      _cv_gnu_make_command='' ;
      dnl Search all the common names for GNU make
      for a in "$MAKE" make gmake gnumake ; do
         if test -z "$a" ; then continue ; fi ;
         if  ( sh -c "$a --version" 2> /dev/null | grep GNU  2>&1 > /dev/null ) ; then
            _cv_gnu_make_command=$a ;
            break;
         fi
      done ;
   ) ;
   MAKE=$_cv_gnu_make_command;
   if test -z "$_cv_gnu_make_command" ; then
      AC_MSG_ERROR([Could not find GNU make]) ;
   fi ; ]
)

dnl
dnl AC_PATH_PROGS but fail with an error if none can be found
dnl
AC_DEFUN(
   [AC_REQ_PATH_PROGS],
   [AC_PATH_PROGS($1,$2,)
    if test "$$1" = "" ; then
       AC_ERROR(Missing required tool; need any one of: $2)
    fi
   ])

dnl
dnl AC_PATH_PROG but fail with an error if it cannot be found
dnl
AC_DEFUN(
   [AC_REQ_PATH_PROG],
   [AC_PATH_PROG($1,$2,)
    if test "$$1" = "" ; then
       AC_ERROR(Missing required tool: $2)
    fi
   ])

dnl
dnl AC_CHECK_TOOL but fail with an error if it cannot be found
dnl
AC_DEFUN(
   [AC_REQ_TOOL],
   [AC_CHECK_TOOL($1,$2,)
    if test "$$1" = "" ; then
       AC_ERROR(Missing required tool: $2)
    fi
   ])

dnl
dnl Adds a compile flag if the compiler supports it
dnl
AC_DEFUN(
   [AX_ADD_COMPILE_FLAG],
   [AX_CHECK_COMPILE_FLAG([$1],[CXXFLAGS="$CXXFLAGS $1"])])
