class Home < App

  def render
    ERB.new(File.read('views/layout.html.erb')).result(binding)
  end

  def content
    render do

      GitHub::Markup.render('readme.markdown', File.read("#{Sinatra::Application.settings.root}/readme.markdown"))
    end
  end

end