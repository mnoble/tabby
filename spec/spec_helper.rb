require "rspec"
require "fakefs/spec_helpers"
require "fakeout/spec_helpers"
require "stringio"
$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
$LOAD_PATH.unshift(File.expand_path('..', __FILE__))
require "tabby"
require "tabby/runner"
require "tabby/creator"
require "tabby/cli"

require "support/stub_constant"

class FakeFile < StringIO
  def path; "/tmp/#{object_id}"; end
end

# Disable Kernel#system
module Kernel
  def system(*args); end
end

RSpec.configure do |config|
  config.include(Fakeout::SpecHelpers)
  config.include(FakeFS::SpecHelpers)

  config.before do
    tabbydir = File.dirname(__FILE__) + "/.tabby/"
    Tabby.stub_constant(:TABBYDIR => Pathname.new(tabbydir).expand_path)
  end
end