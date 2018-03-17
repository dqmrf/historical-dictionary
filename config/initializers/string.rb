class String
  def underscore
    ActiveSupport::Inflector.underscore(self)
  end
end
