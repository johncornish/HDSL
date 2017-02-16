# HDSL
Ruby-based domain-specific language for HTML 
## Installation
### Linux
`gem install hdsl`
### Windows
I don't know; I don't develop on Windows.

## Usage
```ruby
#After installation, you should be able to include it like this
require 'hdsl'

#You can pass a file in the constructor
page = HDSL.new 'optionalFilename.html' do
  html {
    head {
      stylesheet 'css/main.css'
      title 'Some Title'
    }
    body {
      par 'Some paragraph content.'
      with_attr 'div', 'class="someClass"', 'Inner content'
    }
  }
end

#You can access the generated HTML like this
puts page.result

#You can also save to any file at any time after construction
page.save 'index.html'
```
###
