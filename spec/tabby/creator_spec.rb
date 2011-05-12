require File.dirname(__FILE__) + '/../spec_helper'

describe Tabby::Creator do
  let(:basedir) { Tabby::TABBYDIR }
  let(:path)    { basedir.join("helicopter.rb") }
  let(:creator) { Tabby::Creator.new("helicopter") }

  before do
    FakeFS.activate!
    creator.run!
  end

  it "should create the tabby directory if it is missing" do
    File.directory?(path.dirname).should be_true
  end

  it "should create a tabby file" do
    File.exists?(path).should be_true
  end

  it "should have a project path" do
    creator.project_path.to_s.should =~ /helicopter\.rb/
  end

  it "should determine the class name for single word projects" do
    creator.klass.should == "Helicopter"
  end

  it "should determine the class name for multi word projects with underscores" do
    creator = Tabby::Creator.new("long_name_project")
    creator.klass.should == "LongNameProject"
  end

  it "should determine the class name for multi word projects with hyphens" do
    creator = Tabby::Creator.new("long-name-project")
    creator.klass.should == "LongNameProject"
  end

  it "should create a templated project file" do
    File.read(path).should == <<-PROJECT
class Helicopter < Tabby::Base
  basedir "~/Dev/helicopter"

  def server
    exec "rails s"
  end
end
    PROJECT
  end
  
  it "should know if it already exists or not" do
    creator.should exist
  end
  
  it "should not create projects that already exist" do
    creator.run!
    stdout.should include "Project already exists."
  end
end