// this function turns off music

// turn down audio and call movement allowed alarm
show_debug_message("fading");
audio_sound_gain(sound, 0, 2000);


instance_create_layer(0, 0, "Instances", false_alrm);