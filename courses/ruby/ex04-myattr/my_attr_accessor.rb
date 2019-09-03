module MyAcc
  def my_attr_accessor(name, path)
    begin
      public_key=OpenSSL::PKey::RSA.new(File.read(path))
      @@public_key= public_key
    rescue
      return "File not found"
    end
    flag = 0
    define_method("#{name}") do
      enc=instance_variable_get("@#{name}")
      if flag == 1
        @@public_key.public_decrypt(Base64.decode64(enc))
      else
        enc
      end
    end

    define_method("#{name}_set=") do |code|
      line = code.split('.')
      enc_str = line[0]
      signature = line[1]
      begin
        str=@@public_key.public_decrypt(Base64.decode64(enc_str))
        if @@public_key.verify_pss("SHA256", Base64.decode64(signature), str, salt_length: :auto, mgf1_hash: "SHA256")
          flag = 1
          instance_variable_set("@#{name}", enc_str)
          "OK"
        else
          flag = 0
          instance_variable_set("@#{name}", "Error")
        end
      rescue
        instance_variable_set("@#{name}", "Wrong Key")
      end
    end
  end
end
