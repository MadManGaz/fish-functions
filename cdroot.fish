# Defined interactively
function cdroot --description 'go to root of git repo'
cd (git rev-parse --show-toplevel)
end
