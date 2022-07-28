function scd --description 'search and cd'
    ls -1 | fzf | read result
    cd $result
end
