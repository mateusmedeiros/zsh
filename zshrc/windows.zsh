# alias psql so that it doesn't try to connect using an unix socket
alias psql="psql -h localhost"

# windows workspace on CDPATH
export CDPATH="/mnt/c/Users/Mateus/Workspace:$CDPATH"
export CDPATH="/mnt/c/Users/Mateus/Workspace/ecostage:$CDPATH"

# don't make the annoying windows beep sound when pressing down, tab, etc
unsetopt beep

# report the terminal as an xterm 256 colors
export TERM="xterm-256color"

# manually export the display number of the x server running on windows
export DISPLAY=:0
