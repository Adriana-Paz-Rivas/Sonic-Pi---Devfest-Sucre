# Noche de paz

use_bpm 100

mel1 = ring(72,74,72,57,60,62,60,57,67,67,64,65,65,60)
mel2 = ring(62,62,65,64,62,60,62,60,57)
mel3 = ring(67,67,70,67,64,65,69)
mel4 = ring(65,60,57,60,58,55,53)

tm1 = [3,1,2,6,3,1,2,6,4,2,6,4,2,6]
tm2 = [4,2,3,1,2,3,1,2,6]
tm3 = [4,2,3,1,2,6,6]
tm4 = [2,2,2,3,1,2,12]

bass = ring(53,53,60,53,58,53,58,53,60,53,55)
tb = [12]

puts mel4.length
puts tm4.length
puts tm4.sum
##| puts [tm1.sum+tm2.sum+tm3.sum+tm4.sum+tm5.sum]


live_loop :melody do
  tick(:i)
  mel = [mel1,mel2,mel2,mel3,mel4].ring.look(:i)
  tt = [tm1,tm2,tm2,tm3,tm4].ring.look(:i)
  tick_reset(:ii)
  with_fx :slicer, phase: 0.5, wave: 0, mix: 1 do
    silent = synth :dsaw, note: mel[0], sustain: tt.sum*0.5, release: 0
    tt.length.times do
      tick(:ii)
      control silent, note: mel.look(:ii)+0, amp: 1
      sleep tt.ring.look(:ii)*0.5
    end
  end
end

live_loop :bass do
  tick
  synth :zawa, note: chord(bass.look-0,:major), cutoff: 70, sustain: tb.ring.look*0.5, release: 0, range: 12, amp: 2
  synth :dsaw, note: bass.look-12, cutoff: 90, sustain: tb.ring.look*0.5, release: 0
  synth :dsaw, note: bass.look-24, cutoff: 90, sustain: tb.ring.look*0.5, release: 0
  ##| synth :dsaw, note: bass.look-36, cutoff: 90, sustain: tb.ring.look*0.5, release: 0
  sleep tb.ring.look*0.5
end

live_loop :beat do
  with_fx :gverb, room: 69, release: 4, mix: 0.5 do
    sample :bd_haus, cutoff: 90, amp: 5
    sleep 3
    sample :drum_snare_hard, rate: 0.8
    sleep 3
  end
end

