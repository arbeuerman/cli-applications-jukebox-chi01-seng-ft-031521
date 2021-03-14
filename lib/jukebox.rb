require 'pry'

def request_command
  puts "Please enter a command:"
end 

def get_user_input
  gets.strip 
end 

def invalid_command(input)
  puts "#{input} is not a valid command."
  request_command
  get_user_input
end 

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end 

def list(songs)
  songs.each_with_index do |song, index|
    song_number = index + 1
    puts song_number.to_s + ". " + song
  end 
end 

def play(songs)
  puts "Please enter a song name or number:"
  input = get_user_input
  output_message = "Invalid input, please try again"
  songs.each_with_index do |song, index|
    if input == song || input.to_i == index + 1
      output_message = "Playing #{song}"
    end 
  end 
  puts output_message
end 

def exit_jukebox
  puts "Goodbye"
end 

def respond_to_input(input, songs)
  case input
  when "help"
    help
  when "list"
    list(songs) 
  when "play"
    play(songs)
  when "exit"
    exit_jukebox
  else
    invalid_command(input)
  end 
end 

def run(songs)
  input  = nil 
  while input != "exit" do 
    request_command
    input = get_user_input
    respond_to_input(input, songs)
  end 
end 