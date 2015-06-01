class App
  attr_accessor :posts

  def initialize(post = nil)
    @posts = posts_array
    @post = post if post
  end

  def posts_array
    Dir['./posts/*.md'].sort.map do |file|
      {file: (File.basename file, File.extname(file).to_s), title: read_first_line(file)}
    end
  end

  def read_first_line(file)
    File.readlines(file).first
  end
end
