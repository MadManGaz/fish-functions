function install_utils --description 'Install required utils for fish functions'
if not which -s cargo
echo "installing rust"
curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly
end
if not which -s exa
echo "installing exa for ls"
cargo install exa
end
if not which -s bat
echo "installing bat for rcat"
cargo install bat
end
if not which -s deno
echo "installing deno for ts scripts"
cargo install deno --locked
end
if not which -s tokei
echo "installing tokei for cloc"
cargo install tokei
end
echo "finished installing required software"
end
