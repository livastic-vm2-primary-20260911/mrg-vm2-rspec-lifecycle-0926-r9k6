module VM2State
  @dirty = false

  def self.perform
    path = File.expand_path("../app_state.txt", __dir__)
    @dirty = File.read(path).strip == "dirty"
    true
  end

  def self.dirty?
    @dirty
  end
end
