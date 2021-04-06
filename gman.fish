# Defined interactively
function gman --description 'graphical man'
man -t $argv[1] | open -f -a "Preview"
end
