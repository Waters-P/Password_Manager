

class Password_vault

  #attr_reader :needs_encryption 

  def initialize()

    @pw_vault = {}

    @encrpt_pw_vault = {}
    
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

      b += 1
      c += 1
    end

  end


  def display_pw_in_vault

    print " this is the process: \n \n"
    @pw_vault.each_key {|value| puts value.class}

    @encrpt_pw_vault.each_value {|value| puts value}

  end

  def delete_pw_in_vault

    print "delete a password using its 'vault number': "

    #v_n = gets.chomp

    #if v_n = @encrpt_pw_vault.key

    @pw_vault.each_key {|value| puts value}

    @encrpt_pw_vault.each_value {|value| puts value}
    


  end

end




user = Password_vault.new

user.add_to_vault

user.encrpt_pw

user.display_pw_in_vault
