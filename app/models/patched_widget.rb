class PatchedWidget < Widget
  # Re-implement Rails 6 behaviour
  def attribute_names
    @attributes.keys
  end
end
