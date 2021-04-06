# Defined interactively
function set_llvm --description 'Change to brew LLVM+Clang build'
    export PATH="$PATH:"(get_llvm_bin_path)
end
