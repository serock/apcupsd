bin_PROGRAMS = gapcmon
gapcmon_SOURCES = gapcmon.c eggtrayicon.c gethostname.c

AM_CPPFLAGS = $(CPPFLAGS) $(GAPCMON_CFLAGS)
LDADD = $(GAPCMON_LIBS) -lX11

gsettings_SCHEMAS = data/org.apcupsd.Gapcmon.gschema.xml

@GSETTINGS_RULES@

EXTRA_DIST = $(gsettings_SCHEMAS)
