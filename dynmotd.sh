#!/bin/bash
# MOTD created by Sam Liu <sam@ambushnetworks.com> for RapGameJusticeKennedy.
#
# Modify as desired.

# Define colors.
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
normal=$(tput sgr0)


# for amazon linux
printf "${cyan}

your banner is here

${normal}"

# Print System info. I like to print when the server was rebuilt.
printf "${yellow}This server was born on 6-28-2015 at 1:13AM PST${normal}\n"

# Memory usage Information.
MemFreeB=`cat /proc/meminfo | grep MemFree | awk {'print $2'}`
MemTotalB=`cat /proc/meminfo | grep MemTotal | awk {'print $2'}`
MemUsedB=`expr $MemTotalB - $MemFreeB`
MemFree=`printf "%0.2f\n" $(bc -q <<< scale=2\;$MemFreeB/1024/1024)`
MemUsed=`printf "%0.2f\n" $(bc -q <<< scale=2\;$MemUsedB/1024/1024)`
MemTotal=`printf "%0.2f\n" $(bc -q <<< scale=2\;$MemTotalB/1024/1024)`

# Swap Usage Information.
SwapFreeB=`cat /proc/meminfo | grep SwapFree | awk {'print $2'}`
SwapTotalB=`cat /proc/meminfo | grep SwapTotal | awk {'print $2'}`
SwapUsedB=`expr $SwapTotalB - $SwapFreeB`
SwapFree=`printf "%0.2f\n" $(bc -q <<< scale=2\;$SwapFreeB/1024/1024)`
SwapUsed=`printf "%0.2f\n" $(bc -q <<< scale=2\;$SwapUsedB/1024/1024)`
SwapTotal=`printf "%0.2f\n" $(bc -q <<< scale=2\;$SwapTotalB/1024/1024)`

# Root Usage Information.
RootFreeB=`df -k / | tail -1 | awk '{print $3}'`
RootUsedB=`df -k / | tail -1 | awk '{print $2}'`
RootTotalB=`expr $RootFreeB + $RootUsedB`
RootFree=`printf "%0.2f\n" $(bc -q <<< scale=2\;$RootFreeB/1024/1024)`
RootUsed=`printf "%0.2f\n" $(bc -q <<< scale=2\;$RootUsedB/1024/1024)`
RootTotal=`printf "%0.2f\n" $(bc -q <<< scale=2\;$RootTotalB/1024/1024)`

BlueScheme="\e[0;34m#####"
CyanScheme="\e[0;36m#####"
LightBlueScheme="\e[1;34m#####"
LightCyanScheme="\e[1;36m#####"
MaxLeftOverChars=35
Hostname=`hostname`
HostChars=$((${#NICKNAME} + 8))
LeftoverChars=$((MaxLeftOverChars - HostCHars -10))
PreHostScheme=$BlueScheme$BlueScheme$LightBlueScheme$LightBlueScheme
HostScheme=`head -c $HostChars /dev/zero|tr '\0' '#'`
PostHostScheme=`head -c $LeftoverChars /dev/zero|tr '\0' '#'`

GlobalIp=$(/usr/bin/curl -sq http://169.254.169.254/latest/meta-data/public-ipv4)

# Output.
echo -e "
$PreHostScheme$LightBlueScheme\e[1;36m$HostScheme$LightBlueScheme\e[1;34m$PostHostScheme$BlueScheme
$PreHostScheme$LightCyanScheme\e[1;36m### \e[1;32m$NICKNAME \e[1;36m###$LightCyanScheme\e[1;34m$PostHostScheme$BlueScheme
$PreHostScheme$LightBlueScheme\e[1;36m$HostScheme$LightBlueScheme\e[1;34m$PostHostScheme$BlueScheme
\e[0;34m##   \e[1;33mGlobal Ip \e[1;34m= \e[0;32m${GlobalIp}
\e[0;34m##     \e[1;33mRelease \e[1;34m= \e[0;32m`cat /etc/*release | grep PRETTY_NAME | awk -F = '{ print $2 }'`
\e[0;34m##      \e[1;33mKernel \e[1;34m= \e[0;32m`uname -rs`
\e[0;34m##      \e[1;33mUptime \e[1;34m= \e[0;32m`awk '{print int($1/3600)":"int(($1%3600)/60)":"int($1%60)}' /proc/uptime`
\e[0;34m##    \e[1;33mCPU Util \e[1;34m= \e[0;32m`LANG=en_GB.UTF-8 mpstat 1 1 | awk '$2 ~ /CPU/ { for(i=1;i<=NF;i++) { if ($i ~ /%idle/) field=i } } $2 ~ /all/ { print 100 - $field "%"}' | tail -1`
\e[0;34m##    \e[1;33mCPU Load \e[1;34m= \e[0;32m`uptime | grep -ohe '[s:][: ].*' | awk '{ print "1m: "$2 " 5m: "$3 " 15m: " $4}'`
\e[0;34m##      \e[1;33mMemory \e[1;34m= \e[0;32mFree: ${MemFree}GB, Used: ${MemUsed}GB, Total: ${MemTotal}GB
\e[0;34m##        \e[1;33mSwap \e[1;34m= \e[0;32mFree: ${SwapFree}GB, Used: ${SwapUsed}GB, Total: ${SwapTotal}GB
\e[0;34m##        \e[1;33mRoot \e[1;34m= \e[0;32mFree: ${RootFree}GB, Used: ${RootUsed}GB, Total: ${RootTotal}GB
\e[0;34m##    \e[1;33mSessions \e[1;34m= \e[0;32m`who | grep -v whoami | wc -l` sessions
\e[0;34m##   \e[1;33mProcesses \e[1;34m= \e[0;32m`ps -Afl | wc -l` running processes of `ulimit -u` maximum processes
$PreHostScheme$LightBlueScheme$HostScheme$LightBlueScheme\e[1;34m$PostHostScheme$BlueScheme
\e[0;37m
"
