#!/bin/bash

#  '||'                                        '||         '||''|.          '||           '||                      
#   ||        ....   ... ...  .. ...     ....   || ..       ||   ||   ...    ||  .... ...  || ...   ....   ... ..  
#   ||       '' .||   ||  ||   ||  ||  .|   ''  ||' ||      ||...|' .|  '|.  ||   '|.  |   ||'  || '' .||   ||' '' 
#   ||       .|' ||   ||  ||   ||  ||  ||       ||  ||      ||      ||   ||  ||    '|.|    ||    | .|' ||   ||     
#  .||.....| '|..'|'  '|..'|. .||. ||.  '|...' .||. ||.    .||.      '|..|' .||.    '|     '|...'  '|..'|' .||.    
#                                                                                .. |                              
#                                                                                 ''                      

#Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if type "xrandr" > /dev/null; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    	if [ $m == "eDP-1" ]; then
    		MONITOR=$m polybar --reload mainbar-bspwm -c ~/.config/polybar/config &
    	else
    		MONITOR=$m polybar --reload vertical-bspwm -c ~/.config/polybar/config &
    	fi
    done
fi