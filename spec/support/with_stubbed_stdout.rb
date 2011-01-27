class Object
  def with_stubbed_stdout(&block)
    _stdout = $stdout
    $stdout = stdout = StringIO.new
    yield stdout.string
    $stdout = _stdout
  end
end