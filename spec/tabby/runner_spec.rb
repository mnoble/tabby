require File.dirname(__FILE__) + "/../spec_helper"
require File.dirname(__FILE__) + "/../.tabby/spec_blog"

describe Tabby::Runner do
  let(:tabbydir) { File.expand_path("../../.tabby", __FILE__) }
  let(:runner)   { Tabby::Runner.new(["spec_blog"]) }

  before do
    Tabby::Runner.stub_constant(:TABBYDIR => tabbydir)
    FakeSTDOUT.activate!
  end

  after do
    Tabby::Runner.unstub_constant(:TABBYDIR)
    FakeSTDOUT.deactivate!
  end

  it "should tell the user when the project file is missing" do
    runner.stub(:require).and_raise(LoadError)
    runner.start
    output.should include "does not exist"
  end

  it "should tell the user when the filename and classname don't match" do
    ObjectSpace.class.stub(:const_get).and_raise(NameError)
    Tabby::Runner.new(["mismatch"]).start
    output.should include "mismatch"
  end

  it "should call the Tabby class" do
    blog = SpecBlog.new
    blog.should_receive(:call)
    SpecBlog.stub(:new) { blog }
    runner.start
  end
end