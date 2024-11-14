# Welcome to Sonic Pi
# Sonic Pi - Ejemplos de Escalas Mayores, Menores y Armónicas

# ===== ESCALA MAYOR EN RE =====
# Usamos 'scale' para generar la escala mayor en Re.
# La función play_pattern_timed permite tocar las notas con una pausa entre ellas.

# Escala mayor de Re
use_synth :piano  # Cambiamos el sintetizador a un piano para variar el sonido
puts "Escala mayor de Re"
play_pattern_timed (scale :D4, :major), 0.5  # 'D4' es Re en la cuarta octava
sleep 1

# ===== ESCALA MENOR EN LA =====
# Generamos la escala menor natural en La
puts "Escala menor de La"
play_pattern_timed (scale :A4, :minor), 0.5  # 'A4' es La en la cuarta octava
sleep 1

# ===== ESCALA ARMÓNICA MENOR EN RE =====
# La escala armónica menor se diferencia de la menor natural en que sube
# el séptimo grado. Aquí la generamos en Re.
puts "Escala armónica menor de Re"
play_pattern_timed (scale :D4, :harmonic_minor), 0.5
sleep 1

# ===== ESCALA ARMÓNICA MENOR EN LA =====
# Probamos otra vez una escala armónica menor, esta vez en La.
puts "Escala armónica menor de La"
play_pattern_timed (scale :A4, :harmonic_minor), 0.5
sleep 1