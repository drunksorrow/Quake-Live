#! /bin/bash
# quakestartsingle.sh modified - quake live single server spawning script.
# TEST
# TEST

export qPathToStartScript="~/steamcmd/steamapps/common/qlds/run_server_x64.sh"

echo "========== QuakeStart.sh has started. =========="
echo "========= $(date) ========="
cd ~/steamcmd/steamapps/common/qlds/baseq3

exec $qPathToStartScript \
    +set net_strict 1 \
    +set sv_hostname "Drunk Test Server simplified" \
    +set zmq_rcon_enable 1 \
    +set zmq_rcon_password "password" \
    +set zmq_stats_enable 1 \
    +set zmq_stats_password "password" \
    +set sv_tags "drunk,test,ffa" \
    +set g_voteFlags "0" \
    +set g_accessFile "access.txt" \
    +set sv_mappoolFile "mappool.txt"
