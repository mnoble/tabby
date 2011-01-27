class SpecBlog < Tabby::Base
  basedir "~/Dev/Blog"
  
  def jekyll
    exec "jekyll --auto --server"
  end
  
  def sass
    exec "sass --watch public/css/main.sass:public/css/main.css"
  end
end
