require_relative 'hdsl'

page = HDSL.new do
	html do
		head do
			script "'window.onload = alert('1337 h4x');"
		end
		body do
			title "HDSL generated page"
			h2 "HDSL generated page"
			par "Some regular old memes."
		end
	end
end

page.save 'test.html'