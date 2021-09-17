function brotli_decompress
    set --local current_file $argv[1]
    brotli -d $current_file.tar.br
    tar -xvf $current_file.tar
    rm $current_file.tar
end
