
require_relative "manager"

class Password_vault 

  

  def initialize()

    @pw_vault = {}

    @encrpt_pw_vault = {}

    @decrpt_pw_vault = {}
    
   

  end



  def add_to_vault

    puts "Keep in mind you will not be able to edit any password stored in a vault :( \n"
  
    enter_badge_turns_1 = 1
    puts "\nThere is only #{enter_badge_turns_1} attempt to add to Vault\n"
    enter_badge_turns_1 -= 1

    id_state = false
    while (id_state == false)
    puts "enter badge ##: "
    id = gets.chomp

      if @id_vault.has_value?(id)

        id_state = true

      else 
        print "\ninvalid badge ## :( : '#{id}' not in db. \n"
        
        puts "#{enter_badge_turns_1} attempts remaining"
        
        puts "Too many incorrect badge ## entries\n"
        puts "Critical....\n"
        raise "Contact Support"
      end
    end

      a = 1
      while (true)

        print "\nYour 1st password will be in 'Vault 1', 2nd will be in 'Vault 2' and so on.\nRemember your 'Vault numbers'!\n"
        print "\nEnter password into the encyption Vault: \n"
        
        needs_encryption = gets.chomp
        #new_pw = Password_vault.new
        @pw_vault.store(a, needs_encryption) 

        print "\nType 'stop' to exit or press any button to add more \n"

        if gets.chomp == "stop"
          print "\nYour Password security is maximized. \n \n"
          break
        else
          print "\nok: create another password for the encryption vault  \n \n"
        end

        a+=1

      end
    
  
  end



  def encrpt_pw_in_vault

    box_of_chars = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher.shuffle!

    # encrypting

    progress =  rand(34).to_s 
    puts "Encrypting in progress (#{progress}%)....." 

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
        cipher_text += cipher[dx.to_i]
        a += 1
      end

      @encrpt_pw_vault.store(c, cipher_text)

      b += 1
      c += 1
      d += 1
    end

    puts "\nEncrypting done (100%)    ^_^ \n\n"
    puts "In a future update, Password Decryption will be enabled."
    puts "For now safeguard your encryption in the Vault.\n"

  end


  def display_pw_in_vault


    puts "\nPassword editing disabled :( \n\n"
    print "Required: enter the mystery word, in the mystery answer, to the question: why do people 'drink' water? \n"
    mystery_word = "eat"
    while (gets.chomp != mystery_word)
      print "Try again. To gain inside Vault access, find the mystery word, in the mystery answer, to the question: why do people 'drink' water? \n"
    end

    print "'eat' is the answer \n"

        enter_badge_turns_1 = 1
        puts "\nThere is only #{enter_badge_turns_1} attempt to view Vault holdings\n"
        enter_badge_turns_1 -= 1

        id_state = false
        while (id_state == false)
        puts "enter badge ##: "
        id = gets.chomp

          if @id_vault.has_value?(id)

            id_state = true

          else 
            print "\ninvalid badge ## :( : '#{id}' not in db. \n"
            
            puts "#{enter_badge_turns_1} attempts remaining"
            
            puts "Too many incorrect badge ## entries\n"
            puts "Critical....\n"
            raise "Contact Support"
          end
          
        end

    print "\nInside Access: \n"
    @encrpt_pw_vault.each_key {|key| puts "\nVault #{key}: #{@encrpt_pw_vault[key]}\n "}

    
   
  end


  def delete_pw_in_vault
    v_n = 0
    while (true)

      enter_badge_turns_1 = 1
        puts "\nThere is only #{enter_badge_turns_1} attempt to remove from Vault\n"
        enter_badge_turns_1 -= 1

        id_state = false
        while (id_state == false)
        puts "enter badge ##: "
        id = gets.chomp

          if @id_vault.has_value?(id)

            id_state = true

          else 
            print "\ninvalid badge ## :( : '#{id}' not in db. \n"
            
            puts "#{enter_badge_turns_1} attempts remaining"
            
            puts "Too many incorrect badge ## entries\n"
            puts "Critical....\n"
            raise "Contact Support"
          end
          
        end

      v_n_state = false
      while (v_n_state == false)
        print "\nTag a password for removal with its 'Vault number': "
        v_n = gets.chomp
       
        v_n = v_n.to_s

        

        if (v_n.include? ".")
        
          pp v_n
          puts "\nInvalid key"
          v_n = v_n.to_f
          if v_n == 0.0
            puts "\nInvalid key"
            break
          end  
                 
        else
          v_n = v_n.to_i
          v_n_state = true
        end
      end
      
      if @pw_vault.has_key?(v_n)||@encrpt_pw_vault.has_key?(v_n)||@decrpt_pw_vault.has_key?(v_n)

        v_n_state = true
        puts "\nRemoved from Vault: #{v_n}"
        @pw_vault.delete(v_n)
        @encrpt_pw_vault.delete(v_n)
        @decrpt_pw_vault.delete(v_n)
        
      else
        puts "\nVault number: <> Not found <>"
      end

      print "\nRemove passwords? 'press any button' for yes, or 'n' for no: \n \n"

      if gets.chomp == "n"
        print "Your Password security is maximized. \n \n"
        break
      else
        print "ok: Remove requested \n \n"
      end
      
    end

  end

  def vault_balance

    print "Vault balance: #{@pw_vault.length} \n"
    print "Encryptions in Vault: #{@encrpt_pw_vault.length} \n"
    #print "decrpt_pw_vault_balance: #{@decrpt_pw_vault.length} \n"

  end 


end
