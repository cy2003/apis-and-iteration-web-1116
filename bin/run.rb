#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"




welcome
character = get_character_from_user
show_character_movies(character)


films_hash = get_character_movies_from_api(character)
parse_character_movies(films_hash)


