#!/bin/sh

#BANNER=`/usr/local/etc/banner`
PROCCOUNT=`ps -Afl | wc -l`
PROCCOUNT=`expr $PROCCOUNT - 5`
WHO=`whoami`
GROUPZ=`groups`
HOST=`hostname`
ADDR=`/sbin/ifconfig eth0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
KERNEL=`uname -r`
UP=`uptime | tr "," " " | cut -f4-7 -d" "`
MEM=`cat /proc/meminfo | grep MemTotal | awk {'print $2'}`
MEM=`expr $MEM / 1024`
SESSION=`who | grep $USER | wc -l  $ENDSESSION`
ULIMIT=`ulimit`

#echo $BANNER
#cat /usr/local/etc/banner;

echo '\033[0;35m++++++++++++++++++: \033[0;37mSystem Data\033[0;35m :++++++++++++++++++++
\033[0;35m+    \033[0;37mHostname     \033[0;35m=      \033[1;32m'$HOST'
\033[0;35m+    \033[0;37mAddress      \033[0;35m=      \033[1;32m'$ADDR'
\033[0;35m+    \033[0;37mKernel       \033[0;35m=      \033[1;32m'$KERNEL'
\033[0;35m+    \033[0;37mUptime       \033[0;35m=      \033[1;32m'$UP'
\033[0;35m+    \033[0;37mMemory       \033[0;35m=      \033[1;32m'$MEM' MB
\033[0;35m+++++++++++++++++++: \033[0;37mUser Data\033[0;35m :+++++++++++++++++++++
\033[0;35m+    \033[0;37mUsername     \033[0;35m=      \033[1;32m'$WHO'
\033[0;35m+    \033[0;37mSessions     \033[0;35m=      \033[1;32m'$SESSION'
\033[0;35m+    \033[0;37mProcesses    \033[0;35m=      \033[1;32m'$PROCCOUNT' of '$ULIMIT'
\033[0;35m+++++++++++++++++++++++++++++++++++++++++++++++++++++
'
