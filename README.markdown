# Tabby
Tabby is a simple iTerm2 environment configuration tool. It allows you to create different environments for different projects, each with their own set of tabs and command sets.

## Usage

### Defining Environments
Environments should be stored in `~/.tabby/`, using a simple and short name. We'll walk through building my `~/.tabby/blog.rb` environment.

Tabby environments are just regular Ruby classes. The filename and classname should match, with the classname following regular Ruby standards:

    class Blog < Tabby::Base
    end

Define your project's root directory with `basedir`:

    class Blog < Tabby::Base
      basedir "~/Dev/Blog"
    end

Creating tabs is just a matter of creating methods. There should be one method per tab. The method name becomes the tab's title; replacing underscores with spaces.

    class Blog < Tabby::Base
      basedir "~/Dev/Blog"
      
      def jekyll
        exec "jekyll --auto --server"
      end
      
      def sass
        exec "sass --watch public/css/main.sass:public/css/main.css"
      end
    end

Each tab will start off by `cd`'ing into the environment's `basedir`. Then it will execute it's list of commands in order.

### Starting An Environment
    tabby blog

![tabby](https://github.com/mnoble/tabby/raw/master/screenshot.png)

## License
See LICENSE