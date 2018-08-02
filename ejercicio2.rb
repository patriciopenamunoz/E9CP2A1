# Se pide:

# Crear una clase Course cuyo constructor reciba el nombre del curso y
# las fechas de inicio y término.

# Crear un método que permita leer el archivo y crear una instancia de la
# clase Course por línea del archivo.

# Crear métodos que permitan:

## Saber qué cursos comienzan previo a una fecha entregada como argumento.

## Saber qué cursos finalizan posterior a una fecha entregada como argumento.

### En ambos el métodos argumento por defecto debe ser la fecha de hoy.

### Ambos métodos deben levantar una excepción si la fecha recibida
### es >= 2018-01-01.

require 'date'

class Course
  attr_reader :name, :start_date, :end_date
  def initialize(name, start_date, end_date)
    @name = name
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
  end
end

def is_2018?(date)
  if date >= Date.new(2018, 1, 1)
    puts 'ERROR: Fecha entregada es igual/mayor a 2018-01-01'
    true
  else
    false
  end
end

def beforeStartDate(list, date = Date.today)
  list.select { |e| date >= e.start_date }
      .each { |e| puts "#{e.name}: #{e.start_date}" } unless is_2018?(date)
end

def afterEndDate(list, date = Date.today)
  list.select { |e| date <= e.end_date }
      .each { |e| puts "#{e.name}: #{e.end_date}" } unless is_2018?(date)
end

courses = []
file = File.open('cursos.txt', 'r')
file.readlines.each { |line| courses << Course.new(*line.split(', ')) }
file.close

beforeStartDate(courses, Date.new(2017, 7, 9))
puts '---'
afterEndDate(courses, Date.new(2017, 7, 9))
