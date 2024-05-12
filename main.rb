
require_relative "new_admin_info_2"

require_relative "admin_password"



class Password_Manager
  

  def initialize
    @admin_info_storage = {}

    @admin_main_pw_storage = {}

    @id_vault = {}
  end
  

  def add_admin

    alpha_table = { 0=>'a', 1=>'b', 2=>'c', 3=>'d', 4=>'e', 5=>'f', 6=>'g', 7=>'h', 8=>'i', 9=>'j', 10=>'k', 11=>'l', 12=>'m',
                    13=>'n', 14=>'o', 15=>'p', 16=>'q', 17=>'r',   18=>'s', 19=>'t', 20=>'u', 21=>'v', 22=>'w', 23=>'x', 24=>'y', 25=>'z'}
    
    print "Welcome, I am Password Manager, lets get you an account to explore my service \n"
   
    while (true)

      print "For now I only need your 1st name: "
      dx = 0
      state = true
      first_name = gets.chomp
      first_name_alphas = first_name.split("")

      while (dx < first_name_alphas.length)
        if alpha_table.has_value?(first_name_alphas[dx])
          
        else
          puts "All letters in name must be alpha "
          state = false
        end
        dx += 1
      end
      if state == true
        break
      end
    
    end
    #print "Type your surname: "
    #lst_name = gets.chomp
    print "And your email: "
    email = gets.chomp
    #print "Create a username: "
    #username = gets.chomp
   
    user = Admin_info.new(first_name, email)  #lst_name, , username,
    account_id = user.account_id.to_s


    @admin_info_storage.store(:first_name, user.first_name)
    @admin_info_storage.store(:email, user.email)
    @id_vault.store(:account_id, user.account_id.to_s)

    print  "And for you to create a password. It will be encrypted for maximum account protection: "
    main_pw_to_be_encrpt = gets.chomp
    new_pw = Admin_main_Password.new(main_pw_to_be_encrpt)


    @admin_main_pw_storage.store(:main_pw_to_be_encrpt, new_pw.main_pw_to_be_encrpt) 


    puts "\nNew Administrator saved! Your user_id is: " + @id_vault.fetch(:account_id) + "\n\nYou will need this to access certain account services."

    
  end


  def show_admins

    enter_pw_turns_3 = 3
    enter_id_turns_3 = 3
    enter_name_turns_3 = 3
    print "Now, you can enter your first name & user_id to lookup your account info. \n"
    print "For each category you have #{enter_name_turns_3} attempts remaining. \n"

    name_state = false
    while (name_state == false)
    print "enter first name: \n"
    first_name = gets.chomp

      if @admin_info_storage.has_value?(first_name)
        
        id_state = false
        while (id_state == false)
        puts "enter your user_id: "
        id = gets.chomp

          if @id_vault.has_value?(id)
            
            pw_state = false
            while (pw_state == false)
            print "What is your password? \n"
            pw = gets.chomp
            
              if pw == @admin_main_pw_storage.fetch(:main_pw_to_be_encrpt)

                puts "yes, you are in db\n"

                @admin_info_storage.each_key {|key| print "#{key}: #{@admin_info_storage[key]} "}
                print "\n"

                pw_state = true
                id_state = true
                name_state = true
                
              else 
                print "wrong password -x? : '#{pw}' not in db. \n"
                if enter_pw_turns_3 > 1
                  puts "Try again #{enter_pw_turns_3 - 1} attempts remaining"
                else 
                  puts "Too many incorrect passwords"
                end
              end  
              
              if pw_state == true
                break
              end
              enter_pw_turns_3 -= 1
              if enter_pw_turns_3 < 1
                puts "Contact Support."
                raise "#{enter_pw_turns_3} attempts remaining"
              end
            
            end

          else 
            print "wrong id :( : '#{id}' not in db. \n"
            if enter_id_turns_3 > 1
              puts "Try again #{enter_id_turns_3 - 1} attempts remaining"
            else 
              puts "Too many incorrect id numbers"
            end
          end

          if id_state == true
            break
          end
          enter_id_turns_3 -= 1
          if enter_id_turns_3 < 1
            puts "Contact Support."
            raise "#{enter_id_turns_3} attempts remaining"
          end

        end

      else
        print "'#{first_name}' not in db. Check Spelling \n \n"
        
            if enter_name_turns_3 > 1
              puts "Try again #{enter_name_turns_3 - 1} attempts remaining"
            else 
              puts "Too many incorrect name spelling"
            end
      end
    

    if name_state == true
      break
    end  
    enter_name_turns_3 -= 1  

    if enter_name_turns_3 < 1
      puts "Contact Support."
      raise "#{enter_name_turns_3} attempts remaining"
    end

    end
  end


  def change_email

    print  "current email is: #{@admin_info_storage[:email]} \n" 

    print "change email \n"

    @admin_info_storage[:email] = gets.chomp

    print "new email#{@admin_info_storage[:email]} \n" 


  end


  def change_password

    print "#{@admin_main_pw_storage[:main_pw_to_be_encrpt]} \n"
    print "change password \n"

    puts "to change password enter your user_id: "
    id = gets.chomp

    if @id_vault.has_value?(id)
      
      print "new password: "
      @admin_main_pw_storage[:main_pw_to_be_encrpt] = gets.chomp

      print "new password: #{@admin_main_pw_storage[:main_pw_to_be_encrpt]} \n"
    end

  end






  def encrpt_pw

    box_of_chars = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher.shuffle!

    # encrypting

    plain_text = @admin_main_pw_storage.fetch(:main_pw_to_be_encrpt)
    grandma = plain_text.split("")

    cipher_text = ""

    a = 0 
    while (a < grandma.length)
      dx = box_of_chars.index(grandma[a])
      cipher_text += cipher[dx]
      a += 1
    end

    print " orignal password is " + plain_text + "\n"
    print " encrypted password is " + cipher_text + "\n"

  end

end  


# run the app


while (true)

  manager = Password_Manager.new


  manager.add_admin

  manager.show_admins

  manager.change_email

  manager.change_password

  manager.show_admins



 
=begin
  
  manager.show_admins
  
  #manager.add_pw
  
  manager.encrpt_pw

  print "continue?: \n \n"

  if gets.chomp == "stop"
    print "Your Password security is maximized. \n \n"
    break
  else
    print "ok: starting app engine \n \n"
  end


=end

end
