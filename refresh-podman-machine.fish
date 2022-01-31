function refresh-podman-machine --description 'Nuke the machine and remake it. Removes all saved containers.'
podman machine stop
podman machine rm --force podman-default-machine
podman machine init --cpus 12 --memory 14000 --disk-size 80
podman machine start
end
