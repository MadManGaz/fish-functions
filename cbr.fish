function cbr --description 'change branch'
git for-each-ref --format='%(refname:short)' refs/heads/ \
| fzf | xargs git checkout
end
