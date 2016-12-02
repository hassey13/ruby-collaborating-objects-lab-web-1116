class Song
	attr_accessor :name, :artist

	def initialize(name)
		@name = name
	end

	def self.new_by_filename(file)
		file = file.slice(0,file.length - 4).split(" - ")
		artist = file[0]
		name = file[1]
		genre = file[2]
		song = Song.new(name)
		artist = Artist.find_or_create_by_name(artist)
		song.artist = artist
		song
	end
end