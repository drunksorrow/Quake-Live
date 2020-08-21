#! /bin/bash
# quakestart.sh - quake live multiple server spawning script.
# I am not very sure about what I did here. I've tried to simplify things.
# These modifications might not really help or may they will... Use at your own risk.

# Defining variables.
export qPathToStartScript="~/steamcmd/steamapps/common/qlds/run_server_x86.sh"
sponsortag="drunk,test"

# Executing a random delay to stagger the spawning of each server, as
# supervisord starts everything at once, thus lowering the load surge.
#	echo "Sleeping for random delay (5-30 seconds) before spawning..."
#	sleep $(((RANDOM%120)+10))
# No-one cares about this anymore, sleeping on a per-server basis now?
# Finally works, should mean that all servers should be up after 45 seconds.

# Starts servers with different settings, based off the process number parsed
# as argument 1 by supervisord. 

echo "========== QuakeStart.sh has started. =========="
echo "========= $(date) ========="
#echo "arg1 is equal to $1"
cd ~/steamcmd/steamapps/common/qlds/baseq3

echo "Starting free for all server 1..."
exec $qPathToStartScript \
    +set net_strict 1 \
    +set sv_hostname "DrunkTestFFA" \
    +set zmq_rcon_enable 1 \
    +set zmq_rcon_password "password" \
    +set zmq_stats_enable 1 \
    +set zmq_stats_password "password" \
    +set sv_tags "$sponsortag" \
    +set bot_enable 1 \
   	+set bot_nochat 1 \
    +set g_accessFile "access.txt" \
    +set sv_mappoolFile "mappool_pqlffa.txt"
