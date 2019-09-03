require "base64"

module MyBase
  def my_attr_writer(*args)
    args.each do |arg|
      define_method("#{arg}=") do |str|
        if arg.to_s =~ /encoder/
          instance_variable_set("@#{arg}", Base64.encode64(str))
        else
          instance_variable_set("@#{arg}", Base64.decode64(str))
        end
      end
    end
  end
end
