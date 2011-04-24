require File.dirname(__FILE__) + '/../spec_helper'

class TabbySpecBlog < Tabby::Base
  basedir "~/Dev/Blog"
  def foo
    exec "whoami"
    exec "pwd"
  end
end

class FakeFile < StringIO
  def path; "/tmp/#{object_id}"; end
end

describe Tabby::Base do
  before do
    Tempfile.stub(:new).and_return(FakeFile.new)
    FakeFS.deactivate!
  end

  subject { TabbySpecBlog.new }

  it "should set a base directory" do
    subject.basedir.should == "~/Dev/Blog"
  end

  it "should queue commands to be executed" do
    subject.exec("ls")
    subject.commands.should include("write text \"ls\"")
  end

  it "should call all tab methods" do
    subject.should_receive(:foo)
    subject.call
  end

  it "should create actual iTerm2 tab before each method call" do
    subject.call
    subject.template.should match /launch session "Default"/
  end

  it "should set the title" do
    subject.call
    subject.template.should match /set name to "foo"/
  end

  it "should change directory into the base directory" do
    subject.call
    subject.template.should match %r{write text "cd ~/Dev/Blog"}
  end

  it "should execute all commands" do
    subject.call
    subject.template.should match /write text "whoami"/
  end
end