function cheat --description 'Access cht.sh with curl'
    curl "http://cht.sh/$argv" | less -R
end
