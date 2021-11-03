globalvar sound;
globalvar movementAllowed;
globalvar customFont;

customFont = font_add("DiscoBlingRegular-MjGJ.ttf", 24, false, false, 32, 128);

// start audio
sound = audio_play_sound(JaimeSong2, 10, true);

// allow movement once audio plays
movementAllowed = true;

// play alarm 1
instance_create_layer(0, 0, "Instances", music_playing_obj);