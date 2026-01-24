#!/bin/bash

# Calculate Used Memory (Active + Wired + Compressed) using AWK
# This avoids "bc" errors and works perfectly on Apple Silicon
USED_MEM=$(vm_stat | awk '
  /page size of/ { ps=$8 }
  /Pages active/ { active=$3 }
  /Pages wired/  { wired=$3 }
  /Pages occupied/ { occupied=$3 }
  /Pages speculative/ { spec=$3 }
  END { 
    # Calculate GB directly
    used = (active + wired + spec) * ps / 1024 / 1024 / 1024; 
    printf "%.1fGB", used 
  }')

# Send it to the bar
sketchybar --set $NAME label="$USED_MEM"
