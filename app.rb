require 'sinatra/base'
require 'json'
require './lib/parser'
require './lib/googlechart'

class ContributionMapper < Sinatra::Base
	get '/' do
		git_parser = Parser.new('repos/nlopes:slack.git')	
		git_parser.parse

		@filename = git_parser.filename
			
		googlechart = GoogleChart.new
		@breakdown = googlechart.create(git_parser.details_h, git_parser.master_h)
		@authors = git_parser.authors_h.to_a

		@ranking = git_parser.authors_h.sort_by { |name, value| value }.reverse

		erb :main
	end
end