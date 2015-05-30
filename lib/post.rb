class Post < App
  # def initialize(post)
  #   @posts = Dir['./posts/*.markdown'].map{ |file| File.basename file, File.extname(file).to_s }
  # end

  def render
    ERB.new(File.read('views/layout.html.erb')).result(binding)
  end

  def content
    render do
      GitHub::Markup.render(@posts.to_s + '.markdown', File.read('./posts/' + @post.to_s + '.markdown'))
    end
  end
end