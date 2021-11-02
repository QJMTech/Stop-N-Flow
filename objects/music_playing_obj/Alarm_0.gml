// this function turns off music

// turn down audio and call movement allowed alarm
audio_sound_gain(sound, 0, 4000);
instance_create_layer(0, 0, "Instances", false_alrm);