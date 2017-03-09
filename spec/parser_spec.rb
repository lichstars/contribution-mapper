require 'spec_helper'
require './lib/parser'

describe Parser do
  describe ".parse" do

    context "given a filename" do
      it "will be accessible via attribute" do
      	parser = Parser.new('repos/nlopes:slack.git')
      	actual = parser.filename
      	expected = 'repos/nlopes:slack.git'
    	expect(actual).to eq(expected)
      end
    end

    context "given a valid file" do
      it "can create a hash object" do
      	parser = Parser.new('repos/nlopes:slack.git')
      	parser.parse
      	actual = parser.details_h['admin.go']
      	expected = {"Kris Hicks"=>107, "Joe Fitzgerald"=>51, "Brad Harris"=>24, "Norberto Lopes"=>8}
    	expect(actual).to eq(expected)
      end
    end

    context "given a parsed file" do
      it "can ratio authors correctly over whole population" do
      	parser = Parser.new('repos/nlopes:slack.git')
      	parser.parse
      	actual = parser.authors_h['Joe Fitzgerald']
      	expected = 19.52
    	expect(actual).to eq(expected)
      end
    end

    context "given a parsed file" do
      it "will return a master list of authors all having 0 as their summed value" do
      	parser = Parser.new('repos/nlopes:slack.git')
      	parser.parse
      	result = 0
      	parser.master_h.each { |k,v| result += v }
      	expected = 0
    	expect(result).to eq(expected)
      end
    end

    context "given a parsed file" do
      it "will check an author exists" do
      	parser = Parser.new('repos/nlopes:slack.git')
      	parser.parse
      	actual = parser.master_h['Alexander Krasnukhin']
      	expected = 0
    	expect(actual).to eq(expected)
      end
    end

    context "given a parsed file" do
      it "will check total is correct" do
      	parser = Parser.new('repos/nlopes:slack.git')
      	parser.parse
      	actual = parser.total
      	expected = 7234
    	expect(actual).to eq(expected)
      end
    end

  end
end