function configure_git --description 'Configure git with my preferred settings.'
git config --global user.name "Gary Moore"
git config --global user.email "madmangaz@gmail.com"
git config --global init.defaultBranch main
git config --global core.editor "nvim"
end
