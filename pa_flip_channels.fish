function pa_flip_channels --description 'create a configuration to flip audio channels with pulse audio.'
if not test -d ~/.pulse
echo "Creating missing ~/.pulse folder 📁"
mkdir ~/.pulse
end
if not test -f ~/.pulse/default.pa
echo "Copying default pulse configuration 🗄️"
cp /etc/pulse/default.pa ~/.pulse/default.pa
echo "Writing flipped channels config to Pulse Audio config."
echo "load-module module-remap-sink sink_name=reverse-stereo master=1 channels=2 master_channel_map=front-right,front-left channel_map=front-left,front-right" >> ~/.pulse/default.pa
echo "set-default-sink reverse-stereo" >> ~/.pulse/default.pa
echo "Restarting Pulse Audio."
pactl exit
end
end
