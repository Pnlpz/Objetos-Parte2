# Ruleta
class Roulette
  def play(numero)
    r = (1..10).to_a
    random_number = rand(r[r.length.to_i - 1])
    roulette_history(random_number)
    if random_number == numero
      winner(numero)
      puts "Ganaste!!!"
    else
      puts "Perdiste, el número era #{random_number}"

    end
  end

  def roulette_history(random_number)
    File.open('roulette_history.txt', 'a') do |f|
      f.puts random_number
    end
  end

  def winner(numero)
    File.open('winners.txt', 'a') do |f|
      f.puts numero
    end
  end

def self.numero_mayor
  numeros = []
  data = File.open('roulette_history.txt', 'r') { |file| file.readlines }
  data.each do |v|
    ls = v.split(', ')
    numeros << ls
  end
  n = numeros.max_by { |i| numeros.count(i) }
  print n
  end
end
# primer_numero = Roulette.new
# puts 'Ingresa un numero del 1 al 10'
# n = gets.chomp.to_i
# primer_numero.play(n)
Roulette.numero_mayor

# Terminar
