# Defined interactively
function rgrep --wraps=grep --description 'Recursive grep'
    ggrep -rsn $argv
end
