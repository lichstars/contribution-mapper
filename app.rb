require 'sinatra'
require 'json'
require './controllers/parser'
# require './controllers/zingchart'
require './controllers/googlechart'

get '/' do
	# parse a local git repository
	git_parser = Parser.new('data/nlopes:slack.git')
	git_parser.parse

	@filename = git_parser.filename
		
	# zing charts
	# zingchart = ZingChart.new
	# @plot = zingchart.plot	
	# @breakdown = zingchart.create(git_parser.details_h, git_parser.master_h)
	# @authors = zingchart.get_authors(git_parser.authors_h)

	# google charts
	googlechart = GoogleChart.new
	@breakdown = googlechart.create(git_parser.details_h, git_parser.master_h)
	@authors = git_parser.authors_h.to_a


	@ranking = git_parser.authors_h.sort_by { |name, value| value }.reverse

	erb :main
end