require "stringio"

module FakeSTDOUT
  class << self; attr_reader :output; end

  def self.activate!
    @stdout = $stdout
    @output = StringIO.new
    $stdout = @output
  end

  def self.deactivate!
    $stdout = @stdout

  end

  def output
    FakeSTDOUT.output.string
  end
end