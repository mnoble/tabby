module Tabby
  class CLI < Thor
    desc "open [project]", "Starts up the environment for a project."
    def open(project=nil)
      Tabby::Runner.new(project).run!
    end

    desc "create [project]", "Creates an empty project config."
    def create(project=nil)
      Tabby::Creator.new(project).run!
    end

    desc "edit [project]", "Opens the project config with $EDITOR."
    def edit(project=nil)
      Tabby::Editor.new(project).run!
    end

    desc "list", "List all projects."
    def list
      puts "Tabby Projects"
      Pathname.glob("#{TABBYDIR}/*.rb").each do |project|
        puts "  - #{project.basename(".rb")}"
      end
    end
  end
end