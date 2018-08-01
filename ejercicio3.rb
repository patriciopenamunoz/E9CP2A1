# Crear una clase llamada Roulette.

# Crear un método de instancia llamado play que reciba como argumento un
# número al cual se está apostando. Luego debe tomar un valor -del array- al
# azar y compararlo con el número al cual se apostó.

# Crear un método de instancia que:

# Debe almacenar el número generado al azar en un archivo
# llamado roulette_history.txt

# Si el número al cual se apostó corresponde al generado al azar entonces,
# debe además almacenar ese número en un archivo llamado winners.txt

# Crear un método que lea el archivo rouletter_history.txt y retorne el valor
# que más ha generado la ruleta históricamente.

class Roulette
  def initialize
    @r = (1..10).to_a
  end

  def get_rand
    rand(0..(@r.size - 1))
  end

  def play(number)
    number == @r[get_rand]
  end

  def play_game
    random = get_rand
    File.open('roulette_history.txt', 'a') { |file| file.puts(get_rand) }
    if play(get_rand)
      File.open('winner.txt', 'a') { |file| file.puts get_rand }
    end
  end

  def most_played
    file = File.open('roulette_history.txt', 'r')
    numbers = file.readlines.map(&:to_i)
    coinc = {}
    numbers.group_by { |i| i }.each { |k, v| coinc[k] = v.size }
    puts "El más repetido es: #{coinc.max_by { |_, v| v }[0]}"
  end
end

roulette = Roulette.new
roulette.play_game
print roulette.most_played
