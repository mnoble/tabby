module Tabby
  class Editor
    def initialize(project=nil)
      @project = project
    end

    def run!
      if path.exist?
        system("$EDITOR #{TABBYDIR.join("#{@project}.rb")}")
      else
        Tabby::Creator.new(@project).run!
      end
    end

    def path
      TABBYDIR.join("#{@project}.rb")
    end
  end
end