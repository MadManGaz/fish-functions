# Defined interactively
function functionscode --description 'Open fish function in VSCode'
    set FUNCTION (functions -D $argv[1])
    code $FUNCTION
end
