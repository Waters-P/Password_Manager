

class Password_vault

  #attr_reader :needs_encryption 

  def initialize()

    @pw_vault = {}

    @encrpt_pw_vault = {}

    @decrpt_pw_vault = {}
    
   # @needs_encryption = needs_encryption

  end



  def add_to_vault

    print " to add password, find the mystery word, in the mystery answer to the question: 'why do people 'drink' water?' \n"
    mystery_word = "eat"
    while (gets.chomp != mystery_word)
      print "try again. to add password, find the mystery word in the mystery answer to the question: 'why do people drink water?' \n"
    end
    print "'eat' is the answer \n"
    
      a = 1

      while (true)
        print "Enter password into the encyption vault: \n "
        print "Your 1st password will be in 'vault 1', 2nd will be in 'vault 2' and so on: Remember your 'vault numbers'! "
        
        needs_encryption = gets.chomp
        #new_pw = Password_vault.new
        @pw_vault.store(a, needs_encryption) 

        print "type 'stop' to exit or press 'press any button' to add more \n"

        if gets.chomp == "stop"
          print "Your Password is encrypted and security is maximized. \n \n"
          break
        else
          print "ok: create another password for the encryption vault  \n \n"
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

    @decrpt_pw_vault.each_key {|key| puts "#{key}: #{@decrpt_pw_vault[key]} "}
   
  end


  def delete_pw_in_vault
    v_n = 0
    while (true)

      v_n_state = false
      while (v_n_state == false)
        print "delete a password using its 'vault number': "
        v_n = gets.chomp
        v_n = v_n.to_f

        pp v_n.class

        if v_n.class == Float
          v_n = v_n.to_s
          
          if v_n.include? "." 
            puts "must be a whole number"
            break
          end          
          
          break

        else
          v_n = v_n.to_i
          v_n_state = true
        end
      end
      
      if @encrpt_pw_vault.has_key?(v_n)

        v_n_state = true
        puts "deleting vault: #{v_n}"
        @pw_vault.delete(v_n)
        @encrpt_pw_vault.delete(v_n)
        @decrpt_pw_vault.delete(v_n)
        
      else
        puts "key: #{v_n}, not in vault"
      end

      print "delete passwords? 'press any button' for yes,\n'n' for no: \n \n"

      if gets.chomp == "n"
        print "Your Password security is maximized. \n \n"
        break
      else
        print "ok: delete more \n \n"
      end
      
    end

  end

  def vault_balance

    print "pw vault balance: #{@pw_vault.length} \n"
    print "encrpt_pw_vault_balance: #{@encrpt_pw_vault.length} \n"
    print "decrpt_pw_vault_balance: #{@decrpt_pw_vault.length} \n"

  end 


end


user = Password_vault.new

user.add_to_vault

user.encrpt_pw

user.display_pw_in_vault

user.delete_pw_in_vault

user.display_pw_in_vault

user.vault_balance
