require_relative "password_locker"

require_relative "init_admin_info"

require_relative "init_admin_password"





class The_Password_Manager
  

  def initialize
    @admin_info_storage = {}

    @admin_main_pw_storage = {}

    @id_vault = {}
  end
  

  def add_admin

    alpha_table = { 0=>'a', 1=>'b', 2=>'c', 3=>'d', 4=>'e', 5=>'f', 6=>'g', 7=>'h', 8=>'i', 9=>'j', 10=>'k', 11=>'l', 12=>'m',
                    13=>'n', 14=>'o', 15=>'p', 16=>'q', 17=>'r', 18=>'s', 19=>'t', 20=>'u', 21=>'v', 22=>'w', 23=>'x', 24=>'y', 25=>'z',
                    
                    26=>'A', 27=>'B', 28=>'C', 29=>'D', 30=>'E', 31=>'F', 32=>'G', 33=>'H', 34=>'I', 35=>'J', 36=>'K', 37=>'L', 38=>'M', 39=>'N',
                    40=>'O', 41=>'P', 42=>'Q', 43=>'R', 44=>'S', 45=>'T', 46=>'U', 47=>'V', 48=>'W', 49=>'X', 50=>'Y', 51=>'Z' }
    
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


    puts "\nNew Administrator saved! Your account_Badge ## is: " + @id_vault.fetch(:account_id) + "\n\nYou will need your Badge ## to access certain account services.\n\n"
    puts "Badge ##: " + @id_vault.fetch(:account_id)

    
  end


  def show_admins

    enter_pw_turns_3 = 3
    enter_id_turns_3 = 3
    enter_name_turns_3 = 3
    print "Now, you can enter your first name, user_id & password to see your account info. \n"
    print "For each category you have #{enter_name_turns_3} attempts remaining. \n\n"

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

                puts "yes, you are in db\n\n"

                @admin_info_storage.each_key {|key| print "#{key}: #{@admin_info_storage[key]}, "}
                print "\n\n"

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
    print "Change email requested: \n\n"

    enter_pw_turns_3 = 3
    enter_id_turns_3 = 3
    enter_name_turns_3 = 3
    print "Now, you can enter your first name, user_id & password for access to change your email. \n"
    print "For each category you have #{enter_name_turns_3} attempts remaining. \n\n"

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

                puts "type new email: "
                @admin_info_storage[:email] = gets.chomp

                print "new email#{@admin_info_storage[:email]} \n" 


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


  def change_password

    print "Change password requested: \n\n"

    enter_pw_turns_3 = 3
    enter_id_turns_3 = 3
    enter_name_turns_3 = 3
    print "Now, you can enter your first name, user_id & password for access to change your password. \n"
    print "For each category you have #{enter_name_turns_3} attempts remaining. \n\n"

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
                puts "create new password: "

                @admin_main_pw_storage[:main_pw_to_be_encrpt] = gets.chomp
                print "new password: #{@admin_main_pw_storage[:main_pw_to_be_encrpt]} \n"

                

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

    puts "Your Password is encrpyted for maximum security. "

    print "saved password is: " + plain_text + "\n"
    print "encrypted password is: " + cipher_text + "\n"

  end

end  


# run the app
def start

  start_ = true
  while (start_ == true)

    manager = The_Password_Manager.new
    the_pw_vault = Password_vault.new

    manager.add_admin

    puts "\nType 'show' to see admin account info\n\n"
    
      if gets.chomp == "show"
        print "\n"
        manager.show_admins

        menu_state = true
        while (menu_state == true)  
          menu_state = false
          
          puts "Next you can:
          1. Change Account Email
          2. Change Account Password
          3. Encrypt Account Password
          4. View Password Vault
          5. Exit\n"
        
          case gets.chomp
          when "1"
           
            manager.change_email
            puts "\npress 'm' for Main Menu"

            mainmenu = gets.chomp
            if (mainmenu == "m") || (mainmenu == "M")
              menu_state = true
            else
              raise "Invalid choice"
            end

          when "2"
            
            manager.change_password
            puts "\npress 'm' for Main Menu"
            mainmenu = gets.chomp
            if (mainmenu == "m") || (mainmenu == "M")
              menu_state = true
            else
              raise "No bueno"
            end
          
          when "3"

            manager.encrpt_pw
            puts "\npress 'm' for Main Menu"
            mainmenu = gets.chomp
            if (mainmenu == "m") || (mainmenu == "M")
              menu_state = true
            else 
              raise "yeah no"
            end

          when "4"
            
            the_pw_vault.display_pw_in_vault
            puts "\nVault options:
                  1. Add to Vault
                  2. Remove from Vault
                  3. Vault balance
                  4. Display Vault\n"

            option_state = false
            option = 0
            while (option_state == false)
              option = gets.chomp
              if(option!="1"&&option!="2"&&option!="3"&&option!="4")
                puts "Invalid input"
                     
              else
                option_state = true
              end
            end
                  
            case option
                    
            when "1"

              the_pw_vault.add_to_vault
              the_pw_vault.encrpt_pw_in_vault
              puts "press 'm' for Main Menu"
              mainmenu = gets.chomp
              if (mainmenu == "m") || (mainmenu == "M")
                menu_state = true
              else 
                 raise "yeah no"
              end
                  
            when "2"

              the_pw_vault.delete_pw_in_vault
              
              puts "\npress 'm' for Main Menu"
              mainmenu = gets.chomp
              if (mainmenu == "m") || (mainmenu == "M")
                menu_state = true
              else 
                raise "yeah no"
              end


            end
          end
        end
      else
        start_ = false  
       
      end       

    print "\ncontinue?: press any key\n \n"

    puts "Type 'stop' to save and exit.\n "
    if gets.chomp == "stop"
      print "Your password security is maximized. \n \n"
      break
    else
      print "ok: restarting app engine \n \n"
    end

  end

end
