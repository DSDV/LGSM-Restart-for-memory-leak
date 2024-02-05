# LGSM-Restart-for-memory-leak
checks memory utilization and wars or restarts lgsm server on thresholds

its just a quick dirty copy and paste job that restarts the game on demand when memory usage gets to high
to help out a firend so the server does not have to crash or restart in fixed intervals (:

## Memory Leak Workaround
### memory check
Source: [How to simply check free memory and take action when a threshold is reached | Christophe Casalegno](https://www.christophe-casalegno.com/how-to-simply-check-free-memory-and-take-action-when-a-threshold-is-reached)

Fixed calculation from: [https://www.christophe-casalegno.com/tools/memorycheck.sh](https://www.christophe-casalegno.com/tools/memorycheck.sh)  

```
free | awk 'FNR == 2 {print 100-(($2-$3)/$2)*100}' |cut -d "." -f1
```

### rcon
client: [GitHub - gorcon/rcon-cli: RCON client for executing queries on game server.](https://github.com/gorcon/rcon-cli)
Official commands: [Palworld tech guide](https://tech.palworldgame.com/server-commands)

Test message
```
/home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon -c /home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon.yaml 'Broadcast This_is_a_testmesage_<3'
```

### crontab to automate
set `crontab -e` to run `mem_check_script.sh` every minute
```
*/1 * * * * /home/pwserver/mem_check_script.sh > /dev/null 2>&1
```
