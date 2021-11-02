globalvar sound;
globalvar movementAllowed;

// start audio
sound = audio_play_sound(StayingAlive, 10, true);

// allow movement once audio plays
globalvar movementAllowed;

// play alarm 1
instance_create_layer(0, 0, "Instances", music_playing_obj);