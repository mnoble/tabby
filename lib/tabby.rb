require "erb"
require "tempfile"
require "pathname"
require "thor"

module Tabby
  ROOT     = Pathname.new(File.dirname(__FILE__) + "/../").expand_path
  TABBYDIR = Pathname.new("~/.tabby").expand_path
end

require "tabby/base"
require "tabby/runner"
require "tabby/creator"
require "tabby/editor"