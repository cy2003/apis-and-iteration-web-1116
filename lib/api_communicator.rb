require 'rest-client'
require 'json'
require 'pry'
require 'byebug'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_hash["results"].collect do |info|
   
    if info["name"] == character

     info["films"].collect do |link|
      movie_info = RestClient.get(link)
      movie_hash = JSON.parse(movie_info)
    end 

    end
  end.flatten.compact

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end



# def convert_link_to_title(link)
#   movie_info = RestClient.get(link)
#   movie_hash = JSON.parse(movie_info)
#   title_of_movie = movie_hash["title"]
  
# end

def parse_character_movies(films_hash)
  movie_array = []
  films_hash.each do |hash|
      movie_array << hash["title"]
  end
  
  movie_array.each_with_index do |title, index|
    puts "#{index+1}. #{title}"
  end 



  # movie_names = []
  # films_hash.each do |film_hash|
  #   film_hash["title"].each do |film_title|
  #     binding.pry
  #     movie_names << film_title
  #   end 
  # end 
  # string = ""
  # movie_names.each_with_index do |name, index|
  #   string << "#{index+1}. #{name}"
  # end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

# require 'rest-client'
# require 'json'
# require 'pry'

# def get_character_movies_from_api(character)
#  #make the web request
#  all_characters = RestClient.get('http://www.swapi.co/api/people/')
#  character_hash = JSON.parse(all_characters)
 
#  def films(character_hash, character)
#    character_hash["results"].each do |character_array|
#      if character_array["name"] == character
#        return character_array["films"]
#      end
#    end 
#  end  

#  def info(character_hash, character)
#    films(character_hash, character).collect do |film_url|
#      film = RestClient.get(film_url)
#      film_info = JSON.parse(film)
#      film_info
#    end 
#  end    

#  films_hash = info(character_hash, character)

#  return films_hash

 

#  # iterate over the character hash to find the collection of `films` for the given
#  #   `character`
#  # collect those film API urls, make a web request to each URL to get the info
#  #  for that film
#  # return value of this method should be collection of info about each film.
#  #  i.e. an array of hashes in which each hash reps a given film
#  # this collection will be the argument given to `parse_character_movies`
#  #  and that method will do some nice presentation stuff: puts out a list
#  #  of movies by title. play around with puts out other info about a given film.
# end


# def parse_character_movies(films_hash)
#  films_hash.each do |film_hash|
#    puts film_hash["title"]
#  end 
#  # some iteration magic and puts out the movies in a nice list
# end


# def show_character_movies(character)
#  films_hash = get_character_movies_from_api(character)
#  parse_character_movies(films_hash)
# end

# show_character_movies("Luke Skywalker")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
