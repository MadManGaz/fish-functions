function pacman_remove_unused_packages --description 'Remove orphaned (unused) packages from pacman'
    sudo pacman -Qtdq | sudo pacman -Rns -
end
