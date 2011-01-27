require File.expand_path("../spec_helper", __FILE__)
require File.expand_path("../.tabby/spec_blog", __FILE__)

describe Tabby::Runner do
  let(:output) { [] }
  subject      { Tabby::Runner.new(["blog"]) }
  
  before :each do
    Kernel.stub(:system) { Proc.new { |s| output << s }}
  end

  it "should tell the user when the project file is missing" do
    subject.should_receive(:require).and_raise(LoadError)
    subject.should_receive(:puts).with(/does not exist/)
    subject.start
  end

  it "should tell the user when the filename and classname don't match" do
    ObjectSpace.class.should_receive(:const_get).and_raise(NameError)
    subject.should_receive(:puts).with(/mismatch/)
    subject.start
  end

  it "should call the Tabby class" do
    Tabby::Runner.with_constants :TABBYDIR => expand("../.tabby", __FILE__) do
      blog = SpecBlog.new
      blog.should_receive(:call)
      SpecBlog.stub(:new) { blog }
      runner = Tabby::Runner.new(["spec_blog"])
      runner.start
    end
  end
end