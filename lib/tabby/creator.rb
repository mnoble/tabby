module Tabby
  class Creator
    TEMPLATE = ROOT.join("templates/project.rb.erb")

    attr_reader :project, :template

    def initialize(name)
      @project  = name
      @template = ERB.new(TEMPLATE.expand_path.read)
    end

    def run!
      if exists?
        puts ">> Project already exists."
      else
        create_project_directory
        create_project_file
        puts ">> Successfully created #{@project}."
        Tabby::Editor.new(@project).run!
      end
    end

    def exist?
      project_path.exist?
    end
    alias :exists? :exist?

    def create_project_directory
      FileUtils.mkdir_p(TABBYDIR) unless File.directory?(TABBYDIR)
    end

    def create_project_file
      project_path.open("w") { |f| f << template.result(binding) }
    end

    def project_path
      TABBYDIR.join("#{project}.rb").expand_path
    end

    def klass
      project.gsub(/_|-/, " ").split.map { |w| w.capitalize }.join
    end
  end
end