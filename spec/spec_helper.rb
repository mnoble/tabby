require "rspec"
require "stringio"
$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
$LOAD_PATH.unshift(File.expand_path('..', __FILE__))
require "tabby"
require "tabby/runner"
require "support/with_constants"
require "support/expand"