class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets 
    
    while (input != "exit")
      input = gets
    end
    
  end
  
  def list_songs
    all_songs = []
    Song.all.each do |song|
      all_songs << song
    end
    
    all_songs = all_songs.sort_by!{ |song| song.name }
    
    all_songs.each_with_index do |song, index|
      result = "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      
      puts result
    end
    
  end
  
  def list_artists

    Artist.all..sort_by!{ |song| song.name }.each do |artist|
      puts "#{index + 1}. #{artist.name}"
    end
  
  end
end