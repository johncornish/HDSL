require_relative 'hdsl'

page = HDSL.new {
	html {
		head {
			script "'window.onload = alert('1337 h4x');"
			stylesheet 'css/main.css'
		}
		body {
			title "HDSL generated page"
			h2 "HDSL generated page"
			par "Some regular old memes."
		}
	}
}

#page.save 'test.html'
puts page.result

assmblr = HDSL.new do
	with_attr('div', 'class="someClass"') { par 'I hope this works.' }
end

puts assmblr.result