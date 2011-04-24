require "rspec"
require "fakefs/spec_helpers"
$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
$LOAD_PATH.unshift(File.expand_path('..', __FILE__))
require "tabby"
require "tabby/runner"
require "tabby/creator"

require "support/stub_constant"
require "support/fake_stdout"

RSpec.configure do |config|
  config.include(FakeSTDOUT)
  config.include(FakeFS::SpecHelpers)

  config.before do
    Kernel.stub(:system)
  end
end