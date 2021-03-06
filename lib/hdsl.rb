class HDSL
  attr_reader :result
  def initialize(*args, &block)
    instance_eval(&block)
    if args.length == 1
      self.save args.first
    end
  end

  def save(filename)
    file = File.open(filename, 'w')
    file.write @result
    rescue IOError => e
      puts "Could not open file for writing."
    ensure
      file.close unless file.nil?
  end

#BEGIN special tags
  #p is shorthand for "puts", so this must be used instead
  def par(*args, &block)
    tagstart 'p'
    do_content *args, &block
    tagend 'p'
  end

  def stylesheet(href)
    @result ||= ''
    @result << "<link rel=\"stylesheet\" type=\"text/css\" href=\"#{href}\">"
  end
#END special tags

  private
    def with_attr *args, &block
      if block_given?
        tagname, *attrs = *args
      else
        tagname, *attrs, content = *args
      end

      content = '' if !content

      tagstart tagname + ' ' + attrs.join(' ')
      do_content content, &block
      tagend tagname
    end

    def tagstart tagname
      @result ||= ''
      @result << "<#{tagname}>"
    end

    def do_content *args, &block
      content = args.first
      if block_given?
        instance_eval(&block)
      else
        @result << content unless !content
      end
    end

    def tagend tagname
      @result << "</#{tagname}>"
    end

    def method_missing(name, *args, &block)
      tag = name.to_s

      tagstart tag
      do_content *args, &block
      tagend tag
    end
end