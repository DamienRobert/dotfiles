# http://codereview.stackexchange.com/questions/53928/how-to-create-a-tee-command-in-ruby-for-a-unix-like-pipeline
class Pipe
  class Tee
    def initialize(pipe)
      @pipe = pipe
      @buffer = []
      @pipe.source = self.to_enum
    end

    def <<(item)
      @buffer << item
      # puts "Added '#{item}' to buffer: #{@buffer.inspect}"
    end

    def to_enum
      Enumerator.new do |yielder|
        item = @buffer.shift
        yielder << item if item
      end.lazy
    end
  end

  attr_writer :source

  def initialize
    @commands = []
    @source = nil
  end

  def add(command, opts = {})
    @commands << [command, opts]
    self
  end

  def run
    enum = @source

    @commands.each do |command, options|
      enum = send(command, enum, options)
    end

    enum.force
    enum
  end

  def cat(enum, options)
    Enumerator.new do |yielder|
      enum.map { |line| yielder << line } if enum

      options[:input].tap do |ios|
        ios.each { |line| yielder << line }
      end
    end.lazy
  end

  def out(enum, options)
    enum.lazy.map do |line|
      puts line
      line
    end
  end

  def cut(enum, options)
    enum.lazy.map do |line|
      fields = line.chomp.split(/#{options[:delimiter]}/)
      fields[ options[:field] ]
    end
  end

  def upcase(enum, options)
    enum.lazy.map(&:upcase)
  end

  def tee(enum, options)
    teed = Tee.new(options.fetch(:other))

    enum_lazy(enum) do |line, yielder|
      yielder << line
      teed << line
    end
  end

  def grep(enum, options)
    enum.lazy.select {|line| line =~ options[:pattern] }
  end

  private
  def enum_lazy(enum, &block)
    Enumerator.new do |yielder|
      enum.each do |line|
        yield(line, yielder)
      end
    end.lazy
  end
end

another_pipe = Pipe.new
another_pipe.add(:grep, pattern: /testing/i)
another_pipe.add(:out)

pipe = Pipe.new
pipe.add(:cat, :input => StringIO.new("testing\na new\nline"))
# pipe.add(:grep, pattern: /line/)
pipe.add(:tee, :other => another_pipe)
pipe.add(:upcase)
pipe.add(:out)
pipe.run

puts "================================================="
another_pipe.run

# TESTING
# A NEW
# LINE
# =================================================
# testing

