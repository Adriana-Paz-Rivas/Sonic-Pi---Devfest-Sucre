use_bpm 112  # Ajusta el tempo adecuado

# Configuración de efectos de reverb para dar profundidad y resonancia
with_fx :reverb, room: 0.9, mix: 0.5 do
  # Tema principal en piano
  define :melodia_principal do
    use_synth :piano
    play_pattern_timed [:c4, :eb4, :f4, :c5, :g4, :f4, :eb4, :c4], [0.75, 0.5, 1.25, 1.5, 0.75, 0.5, 1.25, 1.5]
    play_pattern_timed [:ab3, :c4, :eb4, :ab4, :g4, :f4, :eb4, :c4], [0.75, 0.5, 1.25, 1.5, 0.75, 0.5, 1.25, 1.5]
  end
  
  # Acompañamiento de cuerdas
  define :acorde_cuerdas do
    use_synth :blade
    play_chord [:c3, :g3, :c4], sustain: 4, release: 2
    sleep 4
    play_chord [:ab2, :eb3, :ab3], sustain: 4, release: 2
    sleep 4
  end
  
  # Bajo en forma de ostinato para dar profundidad
  define :bajo_ostinato do
    use_synth :fm
    play :c2, sustain: 0.5, release: 0.5
    sleep 1
    play :eb2, sustain: 0.5, release: 0.5
    sleep 1
    play :f2, sustain: 0.5, release: 0.5
    sleep 1
    play :c2, sustain: 0.5, release: 0.5
    sleep 1
    play :ab2, sustain: 0.5, release: 0.5
    sleep 1
    play :c2, sustain: 0.5, release: 0.5
    sleep 1
  end
  
  # Arpegio de fondo para crear una atmósfera épica
  define :arpegio_fondo do
    use_synth :prophet
    play_pattern_timed [:c5, :eb5, :g5, :c6], [0.5, 0.5, 0.5, 0.5], amp: 0.4
    play_pattern_timed [:ab4, :c5, :eb5, :g5], [0.5, 0.5, 0.5, 0.5], amp: 0.4
  end
  
  # Estructura de interpretación en vivo
  live_loop :tema_principal do
    melodia_principal
    sleep 4
  end
  
  live_loop :cuerdas, sync: :tema_principal do
    acorde_cuerdas
  end
  
  live_loop :bajo, sync: :tema_principal do
    bajo_ostinato
  end
  
  live_loop :arpegio, sync: :tema_principal do
    arpegio_fondo
  end
end
