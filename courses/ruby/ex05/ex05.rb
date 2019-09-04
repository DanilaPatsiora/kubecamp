class StringAsk < String
  def method_missing(method, *_args)
    if method.to_s =~ /\?/
      method.to_s.chop == self
    elsif method.to_s == "parent"
      self.class.superclass
    else
      super
    end
  end
end

class String
  def ask
    StringAsk.new(self)
  end
end
