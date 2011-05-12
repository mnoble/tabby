require File.dirname(__FILE__) + "/../spec_helper"
require File.dirname(__FILE__) + "/../.tabby/spec_blog"

describe Tabby::Runner do
  let(:tabbydir) { Pathname.new(File.dirname(__FILE__) + "/../.tabby").expand_path }
  let(:runner)   { Tabby::Runner.new("spec_blog") }

  before do
    Tabby::Base.stub(:new).and_return(mock.as_null_object)
  end

  it "should convert an underscored project to hyphenated" do
    Tabby::Runner.new("time_cop").dasherize.should == "time-cop"
  end

  it "should determine the class of a project with underscores" do
    Tabby::Runner.new("time_cop").klass.should == :TimeCop
  end

  it "should determine the class of a project with hyphens" do
    Tabby::Runner.new("time-cop").klass.should == :TimeCop
  end

  it "should determine the class of a project with underscores and hyphens" do
    Tabby::Runner.new("jean-claude_van_damme").klass.should == :JeanClaudeVanDamme
  end

  it "should find the project file" do
    runner.should_receive(:require).with(tabbydir.join("spec_blog.rb"))
    runner.run!
  end
  
  it "should call the project class" do
    SpecBlog.should_receive(:new).and_return(mock.as_null_object)
    runner.run!
  end
end