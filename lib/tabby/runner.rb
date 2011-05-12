module Tabby
  class Runner
    attr_reader :project

    def initialize(project)
      @project = project
      @path    = TABBYDIR.join("#{@project}.rb")
    end

    def dasherize
      @project.gsub("_", "-")
    end

    def klass
      @project.split(/_|-/).map { |p| p.capitalize }.join.to_sym
    end

    def run!
      if @path.expand_path.exist?
        require TABBYDIR.join("#{@project}.rb")
        ObjectSpace.class.const_get(klass).new.call
      else
        puts ">> Project '#{@project}' does not exist."
      end
    end
  end
end
