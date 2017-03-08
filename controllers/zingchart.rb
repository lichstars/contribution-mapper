class ZingChart
	attr_reader :plot

	def initialize		
		@plot = {"tooltip":{"text":"%t"},"value-box":{"font-size":0,"placement":"in","text":"%t","offsetR":"30%","rules":[{"rule":"%v === 0","text":""}]}}
	end

	def create(details_h, master_h)
		charts = Hash.new
		details_h.each do |item|
			temp = master_h.clone
			title = get_title(item[0])
			authors = item[1]
			authors.each { |author, value| temp[author] = value }			
			charts[title] = make_series(temp)
		end
		return charts
	end

	def get_authors(authors_h)
		results = []
		authors_h.each do |author, value|
			values = []
			values[0] = authors_h[author]
			results.push({ 'values' => values, 'text' => author })
		end
		return results
	end

	def rank_authors(contributors)
		ranked_list = []
		ranked_list = contributors.sort_by { |name, value| value }.reverse
		return ranked_list
	end
	
	def make_series(data)
		series = []
		data.each do |k,v|
			value = []
			value[0] = v
			series.push({ 'values' => value, 'text' => k})
		end
		return series
	end

	def get_title(name)
		{'text' => name, 'font-size' => 10}
	end
end
