# Defined interactively
function mandarin_generator --description 'generate arbitrary length mandarin string'
    set TWO_CHARS '好的'
    set TIMES_TO_REPEAT (math "$argv[1] / 2")
    for i in (seq $TIMES_TO_REPEAT)
        echo -n $TWO_CHARS
    end
    echo ""
end
