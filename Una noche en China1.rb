use_bpm 120 
# Definición de los acordes de acompañamiento en guitarra
define :acorde_guitarra do |root, third, fifth|
  use_synth :pluck  # Simulación de guitarra con sintetizador 'pluck'
  play_chord [root, third, fifth], sustain: 0.3, release: 0.5
  sleep 0.5
end

# Definición de la melodía principal
define :melodia_cueca do
  use_synth :piano
  
  play_pattern_timed [:e4, :g4, :a4, :g4, :e4, :a4, :b4], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1]
  play_pattern_timed [:b4, :c5, :b4, :a4, :g4, :e4], [0.5, 0.5, 0.5, 0.5, 0.5, 1]
  play_pattern_timed [:a4, :b4, :g4, :e4, :g4, :a4, :b4], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1]
end

# Arreglo de acordes para la estructura típica de la cueca
define :acordes_cueca do
  acorde_guitarra :a3, :c4, :e4  # Acorde de La menor
  acorde_guitarra :d4, :f4, :a4  # Acorde de Re menor
  acorde_guitarra :e4, :g4, :b4  # Acorde de Mi mayor
  acorde_guitarra :a3, :c4, :e4  # Acorde de La menor
end

# Patrón rítmico de guitarra (acompañamiento) característico de cueca
define :ritmo_guitarra do
  use_synth :pluck
  play :a3, sustain: 0.2, release: 0.3
  sleep 0.25
  play :c4, sustain: 0.2, release: 0.3
  sleep 0.25
  play :e4, sustain: 0.2, release: 0.3
  sleep 0.5
end

# Estructura en vivo de la cueca
live_loop :guitarra do
  acordes_cueca
end

live_loop :ritmo, sync: :guitarra do
  ritmo_guitarra
end

live_loop :melodia, sync: :guitarra do
  melodia_cueca
end
