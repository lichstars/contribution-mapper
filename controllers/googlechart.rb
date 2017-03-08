class GoogleChart
	def create(details_h, master_h)
		charts = Hash.new
		details_h.each do |item|
			temp = master_h.clone
			title = get_title(item[0])
			authors = item[1]
			authors.each { |author, value| temp[author] = value }		
			charts[title] = temp
		end
		charts.each_pair { |key, value| charts[key] = value.to_a }
		return charts
	end

	def get_title(name)
		name
	end
end