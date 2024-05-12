

class Password_vault

  #attr_reader :needs_encryption 

  def initialize()

    @pw_vault = {}

    @encrpt_pw_vault = {}

    @decrpt_pw_vault = {}
    
   # @needs_encryption = needs_encryption

  end



  def add_to_vault

    a = 1

    while (true)
      print "Enter a password into the encyption vault: \n "
      print "Your 1st password will be in 'vault 1', 2nd will be in 'vault 2' and so on: Remember your 'vault numbers'! "
      
      needs_encryption = gets.chomp
      #new_pw = Password_vault.new
      @pw_vault.store(a, needs_encryption) 

      print "type 'stop' to exit or press 'y' to add more \n"

      if gets.chomp == "stop"
        print "Your Password is encrypted and security is maximized. \n \n"
        break
      else
        print "ok: Add another password into the encryption vault:  \n \n"
      end

      a+=1

    end
  end



  def encrpt_pw

    box_of_chars = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher.shuffle!

    # encrypting

    b = 1
    c = 1
    d = 1

    while (b < (@pw_vault.length) + 1)

      plain_text = @pw_vault.fetch(b)
      grandma = plain_text.split("")

      cipher_text = ""

      a = 0 
      while (a < grandma.length)
        dx = box_of_chars.index(grandma[a])
        cipher_text += cipher[dx]
        a += 1
      end

      @encrpt_pw_vault.store(c, cipher_text)

      #Decrypt

      cipher_text = @encrpt_pw_vault.fetch(d)
      grandma = cipher_text.split("")

      plain_text = ""

      a = 0 
      while (a < grandma.length)
        dx = cipher.index(grandma[a])
        plain_text += box_of_chars[dx]
        a += 1
      end

      @decrpt_pw_vault.store(d, plain_text)


      b += 1
      c += 1
      d += 1
    end

  end


  def display_pw_in_vault

    print " this is the process: \n \n"

    @encrpt_pw_vault.each_key {|key| puts "#{key}: #{@encrpt_pw_vault[key]} "}
 

    #Decrpt

    @decrpt_pw_vault.each_key {|key| puts"#{key}: #{@decrpt_pw_vault[key]} "}
   
  end


  def delete_pw_in_vault

    while (true)

      print "delete a password using its 'vault number': "

      v_n = gets.chomp
      v_n = v_n.to_i

      if @encrpt_pw_vault.has_key?(v_n)

      @pw_vault.delete(v_n)
      @encrpt_pw_vault.delete(v_n)
      @decrpt_pw_vault.delete(v_n)
     
      end

      print "delete more passwords? 'y' for yes, 'n' for no: \n \n"

      if gets.chomp == "n"
        print "Your Password security is maximized. \n \n"
        break
      else
        print "ok: delete more \n \n"
      end
      
    end

  end


  def vault_balance

    print "#{@pw_vault.length} \n"
    print "#{@encrpt_pw_vault.length} \n"
    print "#{@decrpt_pw_vault.length} \n"



  end 


end




user = Password_vault.new

user.add_to_vault

user.encrpt_pw

user.display_pw_in_vault

user.delete_pw_in_vault

user.display_pw_in_vault

user.vault_balance
