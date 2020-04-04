#!/bin/bash

declare -a programs=(

)

declare -a lazy_load=(
  
)


for program in "${programs[@]}"; do
   if pgrep $program; then
       :
   else
       $program &
   fi
done 

# Launch Polyabar
$HOME/.config/polybar/launch.sh &

# Launch Picom for transparency
picom --config ~/.config/bspwm/picom.conf &


sleep 30
for program in "${lazy_load[@]}"; do
   if pgrep $program; then
       return 0
   else
       $program &
   fi
done 

