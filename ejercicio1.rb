# Se pide:

# Crear una clase Table cuyo constructor reciba el nombre de la mesa y las
# recaudaciones correspondientes de cada día.
# Hint: El constructor debe recibir 5 argumentos.
# Uno para el nombre de la mesa y los demás para cada recaudación
# correspondiente a esa mesa.

# Crear un método que permita leer el archivo e instanciar un objeto
# de la clase Table por cada línea del archivo.

# Crear métodos que permitan:
# Conocer el mayor valor recaudado, por mesa, y el nombre de la mesa y
# día corresponde (día 1, día 2, día 3 o día 4).

class Table
  attr_reader :name
  def initialize(name, *collections)
    @name = name
    @collections = collections.each_with_index
                              .map { |e, i| ["día #{(i + 1)}", e.to_i] }
                              .to_h
  end

  def max_day
    @collections.max_by { |_, v| v }
  end
end

def generate_tables
  tables = []
  File.open('casino.txt', 'r') do |file|
    file.readlines.each { |line| tables << Table.new(*line.split(', ')) }
  end
  tables
end

tables = generate_tables
tables.each { |e| print "#{e.name}: (#{e.max_day[0]}) #{e.max_day[1]}\n" }
