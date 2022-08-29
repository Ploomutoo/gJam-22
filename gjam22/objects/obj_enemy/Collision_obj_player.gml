if(array_length(engaged)>0 && !barge) exit;

soundRand(sndCombat);
with(other) event_user(0);
instance_destroy();
