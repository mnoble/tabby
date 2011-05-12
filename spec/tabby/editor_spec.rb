require File.dirname(__FILE__) + '/../spec_helper'

describe Tabby::Editor do
  let(:basedir) { Tabby::TABBYDIR }
  let(:path)    { basedir.join("helicopter.rb") }
  let(:editor)  { Tabby::Editor.new("helicopter") }

  before do
    Fakeout.deactivate!
    editor.stub(:path) { path }
  end

  it "should open a project file with $EDITOR" do
    path.stub(:exist?) { true }
    editor.should_receive(:system).with("$EDITOR #{path.expand_path}")
    editor.run!
  end

  it "should create a new project if it doesn't exist" do
    path.stub(:exist?) { false }
    creator = mock("Tabby::Creator").as_null_object
    Tabby::Creator.should_receive(:new).with("helicopter").and_return(creator)
    editor.run!
  end
end