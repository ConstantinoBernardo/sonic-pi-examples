#--------------
amp_hat =3
amp_voxy =2.5
amp_tum = 3
amp_hit=3

#--------------

define :tum do |v|
  play (chord  :C, :major), release: v, amp: amp_tum
end

define :tum2 do
  play (chord :F3, :minor), amp: amp_tum, release:0.2, release: rrand(1,2)
end

define :hat do
  sample :drum_cymbal_closed, amp: amp_hat, attack: 0, decay: 0.01, sustain: 0, release: 0
end

define :hat do
  sample :drum_cymbal_closed, amp: amp_hat, attack: 0, decay: 0.01, sustain: 0, release: 0
end


live_loop :melodia do
  use_synth :piano
  sync :melod
  tum 0.4
  sleep 1
  2.times do
    cue :boom
    tum2
    sleep 0.5
  end
  sleep  0.5
end

use_bpm 80

with_fx :slicer, phase:1, wave:2 do
  live_loop :voxy do
    sync :hit
    sample  :bass_voxy_c, rate: 3, release:0.2, attack: 2, amp: amp_voxy
    sleep 1
  end
end

live_loop :hit do
  #stop
  sample :bd_mehackit, amp:amp_hit
  tum rrand(0.4,1)
  sleep 1
  cue :hit
  sample :sn_generic, rate: 2, amp: amp_hit, attack: 0, sustain: 0, release: 0, decay: 0.06
  sleep 0.8
  cue :melod
  2.times do
    sample :sn_generic, rate: 2, amp: amp_hit, attack: 0, sustain: 0, release: 0, decay: 0.06
    sleep 0.5
  end
  2.times do
    sample :bd_mehackit, amp: amp_hit
    cue :hats
    sleep 0.25
    sample :sn_generic, rate: 2, amp: amp_hit, attack: 0, sustain: 0, release: 0, decay: 0.06
    sleep 0.25
  end
  sleep 0.25
end

live_loop :hats do
  sync :hats
  2.times do
    hat
    sleep 0.3
    hat
    sleep 0.3
    hat
    sleep 0.4
  end
end

live_loop :melodia do
  use_synth :piano
  sync :melod
  tum 0.4
  sleep 1
  2.times do
    cue :boom
    tum2
    sleep 0.5
  end
  sleep  0.5
end

use_bpm 80

with_fx :slicer, phase:1, wave:2 do
  live_loop :voxy do
    sync :hit
    sample  :bass_voxy_c, rate:2, release:0.2, amp: amp_voxy
    sleep 1
  end
end

live_loop :hit do
  #stop
  sample :bd_mehackit, amp:amp_hit
  tum rrand(0.4,1)
  sleep 1
  cue :hit
  sample :sn_generic, rate: 2, amp: amp_hit, attack: 0, sustain: 0, release: 0, decay: 0.06
  sleep 0.8
  cue :melod
  2.times do
    sample :sn_generic, rate: 2, amp: amp_hit, attack: 0, sustain: 0, release: 0, decay: 0.06
    sleep 0.5
  end
  2.times do
    sample :bd_mehackit, amp: amp_hit
    cue :hats
    sleep 0.25
    sample :sn_generic, rate: 2, amp: amp_hit, attack: 0, sustain: 0, release: 0, decay: 0.06
    sleep 0.25
  end
  sleep 0.25
end

live_loop :hats do
  sync :hats
  2.times do
    hat
    sleep 0.3
    hat
    sleep 0.3
    hat
    sleep 0.4
  end
end