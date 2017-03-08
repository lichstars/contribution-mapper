require 'sinatra'
require 'json'
require './parser'
require './zingchart'

get '/' do
	# parse a local git repository
	git_parser = Parser.new('nlopes:slack.git')
	git_parser.parse

	@filename = git_parser.filename
		
	# create zingchart objects
	zingchart = ZingChart.new

	@plot = zingchart.plot	

	@breakdown = zingchart.create(git_parser.details_h, git_parser.master_h)

	@authors = zingchart.get_authors(git_parser.authors_h)

	@ranking = zingchart.rank_authors(git_parser.authors_h)

	erb :main
end