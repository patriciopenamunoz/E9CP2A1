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

class CourseList
  attr_reader :list
  def initialize
    @list = []
  end

  def add(course)
    @list.push(course)
  end

  def es_2018?(date)
    if date >= Date.new(2018, 1, 1)
      puts 'ERROR: Fecha entregada es igual/mayor a 2018-01-01'
      true
    else
      false
    end
  end

  def beforeStartDate(date = Date.today)
    @list.select { |e| date >= e.start_date }
         .each { |e| puts "#{e.name}: #{e.start_date}" } unless es_2018?(date)
  end

  def afterEndDate(date = Date.today)
    @list.select { |e| date <= e.end_date }
         .each { |e| puts "#{e.name}: #{e.end_date}" } unless es_2018?(date)
  end
end

class Course
  attr_reader :name, :start_date, :end_date
  def initialize(name, start_date, end_date)
    @name = name
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
  end
end

courses = CourseList.new
file = File.open('cursos.txt', 'r')
file.readlines.each { |line| courses.add(Course.new(*line.split(', '))) }
file.close

courses.beforeStartDate(Date.new(2017, 7, 9))
puts '---'
courses.afterEndDate(Date.new(2017, 7, 9))
