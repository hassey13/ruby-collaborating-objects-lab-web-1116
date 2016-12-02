require 'pry'

class MP3Importer
	attr_reader :path

	def initialize(path)
		@path = path
		@files = Dir.entries(path)

	end

	def files
		@files = (@files.select {|file| if !file.start_with?("."); file ;end})
		@files
	end

	def import
		files.each do |file|
			file = file.slice(0,file.length - 4).split(" - ")
			artist = file[0]
			name = file[1]
			genre = file[2]
			artist = Artist.find_or_create_by_name(artist)
			name = Song.new(name)
			artist.add_song(name)
		end
	end




end