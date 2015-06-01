class Posts < App
  def render
    ERB.new(File.read('views/layouts/layout.erb')).result(binding)
  end

  def content
    render do
      GitHub::Markup.render(@posts.to_s + '.markdown', File.read('./posts/' + @post.to_s + '.md'))
    end
  end
end
