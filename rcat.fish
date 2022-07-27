function rcat --description 'Colorized cat'
    if string match $argv[1] *.md
        glow $argv
    else
        bat --theme=ansi $argv
    end
end
