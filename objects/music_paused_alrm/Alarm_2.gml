show_debug_message("Move now!");

// fade in audio
sound = audio_play_sound(JaimeSong2, 10, true);

// set movement allowed to true
movementAllowed = true;

// create pause for music to stop again, finishing loop
instance_create_layer(0, 0, "Instances", music_playing_obj);
