require File.dirname(__FILE__) + '/../spec_helper'

describe Tabby::CLI do
  let(:path)   { Tabby::TABBYDIR.join("battle.rb") }
  let(:runner) { mock('Tabby::Runner').as_null_object }

  before do
    Fakeout.activate!
    Tempfile.stub(:new).and_return { FakeFile.new }
  end

  it "should open an existing project" do
    Tabby::Runner.should_receive(:new).with("battle").and_return(runner)
    Tabby::CLI.start(["open", "battle"])
  end

  it "should create an empty project config" do
    Tabby::CLI.start(["create", "battle"])
    path.should exist
  end

  it "should list available projects" do
    FileUtils.mkdir_p(Tabby::TABBYDIR)
    FileUtils.touch(path.expand_path.to_s)

    Tabby::CLI.start(["list"])
    stdout.should include "- battle"
  end
end