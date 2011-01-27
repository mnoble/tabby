module Tabby
  class Runner
    TABBYDIR = File.expand_path("~/.tabby")

    attr_reader :project

    def initialize(argv)
      @project = argv[0]
      @klass   = @project.split("_").map { |p| p.capitalize }.join.to_sym
    end

    def start
      require File.join(TABBYDIR, "#{@project}.rb")
      ObjectSpace.class.const_get(@klass).new.call

    rescue LoadError
      puts "=> ERROR: Project (#{TABBYDIR}/#{@project}.rb) does not exist."

    rescue NameError
      puts %(=> ERROR: Project filename/classname mismatch.

          Filename is:           #{@project}.rb
          Classname should be:   #{@klass}
      )
    end
  end
end
