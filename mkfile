APE=/sys/src/ape
<$APE/config

LIB=/$objtype/lib/ape/libopusfile.a

OFILES=\
	info.$O \
	internal.$O \
	opusfile.$O \
	stream.$O \

HFILES=\
	/sys/include/ape/opus/opusfile.h \

UPDATE=\
	mkfile\
	$HFILES\
	${OFILES:%.$O=%.c}\

</sys/src/cmd/mksyslib

CFLAGS=$CFLAGS -c\
	-Iinclude \
	-I/sys/src/cmd/audio/libogg \
	-I/sys/include/ape/opus \
	-DPACKAGE_VERSION="fuckoff" \
	-D_POSIX_SOURCE

%.$O:	src/%.c
	$CC $CFLAGS src/$stem.c

$HFILES:
	mkdir -p /sys/include/ape/opus
	dircp include /sys/include/ape/opus
