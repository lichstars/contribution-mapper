class Parser
	attr_reader :total
	attr_reader :details_h
	attr_reader :master_h
	attr_reader :authors_h	
	attr_reader :filename

	def initialize(filename)
		@filename = filename
		@total = 0.0
		@details_h = Hash.new
		@master_h = Hash.new
		@authors_h = Hash.new
	end

	def parse
		@logfile = File.open(@filename ,"r")
		@logfile.each_line do |line| 
			details = {}
			i = 0
			elements = line.split(': ')
			title = elements[0]&.strip
			unless elements[1].nil?
				author_details = elements[1].gsub("\n", '').split(/(\d+ )/).delete_if(&:empty?)
				while( i < author_details.length) do
					value = author_details[i].to_i
					author = author_details[i+1]&.strip
					@master_h[author] ||= 0
					@authors_h[author] ||= 0
					@authors_h[author] += value
					@total += value

					details[author] = value
					i+=2
				end
				@details_h[title] = details
			end
		end
		@logfile.close

		ratio_authors
	end

	def ratio_authors
		@authors_h.each do |author, value|
			@authors_h[author] = ((value / @total) * 100.0).round(2)			
		end
	end

end