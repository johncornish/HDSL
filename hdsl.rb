class HDSL
	attr_reader :result
	def initialize(&block)
		instance_eval(&block)
	end

	def save(filename)
		file = File.open(filename, 'w')
		file.write @result
		rescue IOError => e
			puts "Could not open file for writing."
		ensure
			file.close unless file.nil?
	end
	
	private
		def do_content(*args, &block)
			content = args.first
			if block_given?
				instance_eval(&block)
			else
				@result << content unless !content
			end
		end

		def tagstart tagname
			@result ||= ''
			@result << "<#{tagname}>"
		end

		def tagend tagname
			@result << "</#{tagname}>\n"
		end

		def method_missing(name, *args, &block)
			tag = name.to_s

			tagstart tag
			do_content *args, &block
			tagend tag
		end

		def script(*args, &block)
			tagstart 'script type="text/javascript"'
			do_content *args, &block
			tagend 'script'
		end

		def par(*args, &block)
			tagstart 'p'
			do_content *args, &block
			tagend 'p'
		end
end