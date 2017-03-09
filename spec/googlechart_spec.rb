require 'spec_helper'
require './lib/googlechart'

describe GoogleChart do
  describe ".create" do
    context "given a hash of details" do
      it "will create a chart object" do
      	googlechart = GoogleChart.new
        details_h = Hash.new
        details_h['admin.go'] = {"Kris Hicks"=>107, "Joe Fitzgerald"=>51, "Brad Harris"=>24, "Norberto Lopes"=>8}
        masters_h = Hash.new
        masters_h = {"John Smith"=>0, "Kris Hicks"=>0, "Joe Fitzgerald"=>0, "Brad Harris"=>0, "Norberto Lopes"=>0}
      	actual = googlechart.create(details_h,masters_h)
      	expected = {"admin.go"=>[["John Smith", 0],["Kris Hicks", 107], ["Joe Fitzgerald", 51], ["Brad Harris", 24], ["Norberto Lopes", 8]]}
    	  expect(actual).to eq(expected)
      end
    end

  end
end