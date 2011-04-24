module Kernel
  def stub_constant(constants)
    silence!
    constants.each do |name, value|
      instance_variable_set("@unstubbed_#{name}", const_get(name))
      const_set(name, value)
    end
    noise!
  end

  def silence!
    @__verbose = $VERBOSE
    $VERBOSE   = nil
  end

  def noise!
    $VERBOSE = @__verbose
  end

  def unstub_constant(name)
    silence!
    const_set(name, instance_variable_get("@unstubbed_#{name}"))
    noise!
  end
end