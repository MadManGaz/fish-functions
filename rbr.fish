function rbr --description 'remove branch'
git for-each-ref --format='%(refname:short)' refs/heads/ \
| fzf | xargs git branch -D
end
