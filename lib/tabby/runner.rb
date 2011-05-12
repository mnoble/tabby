module Tabby
  class Runner
    attr_reader :project

    def initialize(project)
      @project = project
    end

    def dasherize
      @project.gsub("_", "-")
    end

    def klass
      @project.split(/_|-/).map { |p| p.capitalize }.join.to_sym
    end

    def run!
      require TABBYDIR.join("#{@project}.rb")
      ObjectSpace.class.const_get(klass).new.call
    end
  end
end
