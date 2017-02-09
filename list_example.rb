require_relative 'hdsl'

list = HDSL.new do
	ul do
		items = ['Item 1','Item 2','Item 3','Item 4','Item 5']
		items.each do |i|
			li i
		end
	end
end

puts list.result