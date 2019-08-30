def my_attr_reader(*arg)
  arg.each do |arg|
    define_method(arg.to_s) do
      instance_variable_get("@#{arg}")
    end
  end
end
