function brotli_decompress_entire_dir
    for file in *
        set --local file_no_extension (string split . $file)[1]
        brotli-decompress $file_no_extension &
    end
end
