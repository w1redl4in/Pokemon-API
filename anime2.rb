require 'rest-client'
require 'json'

# Menu
puts "==============="
puts "  TOP CHECKER"
puts "==============="
puts "1 - Anime"
puts "2 - Manga"
puts "3 - People"
puts "4 - Characters"
puts "==============="
print "Choose your option: "
op = gets.chomp.to_i



# SWITCH
case op
when 1
    system "clear"
    puts "================="
    puts "  Top 10 Animes "
    puts "================="
    url = RestClient.get "https://api.jikan.moe/v3/top/anime"
    urljson = JSON.parse(url)
    x = 0
    urljson['top'].each do |i|
        x = x + 1
        puts "Title: " + i['title'] + " - " + i['episodes'].to_s + " Episodes " + " Score: " + i['score'].to_s
        break if x == 10
    end

when 2
    system "clear"
    puts "================="
    puts "  Top 10 Manga "
    puts "================="
    url = RestClient.get "https://api.jikan.moe/v3/top/manga"
    urljson = JSON.parse(url)
    x = 0
    urljson['top'].each do |i|
        x = x + 1
        puts i['title']
        break if x == 10
    end
  
when 3
    system "clear"
    puts "================="
    puts "  Top 10 People "
    puts "================="
    url = RestClient.get "https://api.jikan.moe/v3/top/people"
    urljson = JSON.parse(url)
    x = 0
    urljson['top'].each do |i|
        x = x + 1
        puts i['title'] + "    " + i['name_kanji']
        break if x == 10
    end

when 4
    system "clear"
    puts "====================="
    puts "  Top 10 Characters "
    puts "====================="
    url = RestClient.get "https://api.jikan.moe/v3/top/characters"
    urljson = JSON.parse(url)
    x = 0
    urljson['top'].each do |i|
        x = x + 1
        puts i['title'] 
        break if x == 10
    end
  
  
end

