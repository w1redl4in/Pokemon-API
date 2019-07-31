# gems
require 'open-uri'
require 'json'


# pegando ID do usuario
print "Insira um número de um Pokémon (1 a 807): "
pokemon_id = gets.chomp.to_i

# página da API
pokemon_species = open("https://pokeapi.co/api/v2/pokemon-species/#{pokemon_id}").read
pokemon_species_json = JSON.parse(pokemon_species)


pokemon = open("https://pokeapi.co/api/v2/pokemon/#{pokemon_id}").read
pokemon_json = JSON.parse(pokemon)


# Menu
puts "========================="
puts "   POKÉMON INFORMATION"
puts "========================="
a = 1
pokemon_species_json['varieties'].each do |i|
    print "Variedade #{a}: "
    puts i['pokemon']['name']
    a += 1
end
puts "Cor: " + pokemon_species_json['color']['name']
puts "Peso: " + pokemon_json['weight'].to_s
puts "Forma: " + pokemon_species_json['shape']['name']
puts "Chance de Captura: " + pokemon_species_json['capture_rate'].to_s + "%"
pokemon_json['types'].each do |z|
    print "Atributo(s): "
    puts z['type']['name']
end
puts "Experiência Base: " + pokemon_json['base_experience'].to_s

puts "========================="
puts "         SKILLS"
puts "========================="
pokemon_json['abilities'].each do |a|
    puts a['ability']['name']
end

puts "========================="
puts "         STATUS"
puts "========================="

puts "SPEED: " + pokemon_json['stats'][0]['base_stat'].to_s
puts "SPECIAL-DEFENSE: " + pokemon_json['stats'][1]['base_stat'].to_s
puts "SPECIAL-ATTACK: " + pokemon_json['stats'][2]['base_stat'].to_s
puts "DEFENSE: " + pokemon_json['stats'][3]['base_stat'].to_s
puts "ATTACK: " + pokemon_json['stats'][4]['base_stat'].to_s
puts "HP: " + pokemon_json['stats'][5]['base_stat'].to_s
puts "========================="

