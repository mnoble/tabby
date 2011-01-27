require "stringio"

class Object
  def self.with_constants(constants, &block)
    old_constants = {}
    stderr  = $stderr
    $stderr = StringIO.new
    
    constants.each do |constant, val|
      old_constants[constant] = const_get(constant)
      const_set(constant, val)
    end

    block.call

    old_constants.each do |constant, val|
      const_set(constant, val)
    end
    
    $stderr = stderr
  end
end