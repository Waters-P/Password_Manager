
require_relative "new_admin_info_2"

require_relative "password"



class Password_Manager
  

  def initialize
    @admin_info_storage = {}

    @admin_pw_storage = {}
  end
  

  def add_admin
    print "Type your 1st name: "
    fst_name = gets.chomp
    #print "Type your surname: "
    #lst_name = gets.chomp
    #print "Type your email: "
    #email = gets.chomp
    #print "Create a username: "
    #username = gets.chomp
    #print "Create a password. It will be encrypted for maximum account protection: "
    #pass_word = gets.chomp

    user = Admin_info.new(fst_name)  #lst_name, email, username,

    account_id = user.account_id.to_s

    @admin_info_storage.store(:fst_name, user.fst_name)
    #@admin_info_storage.store(:pass_word, user.pass_word)
    @admin_info_storage.store(:account_id, user.account_id.to_s)

    print  "Create a password. It will be encrypted for maximum account protection: "
    pass_to_be_encrpt = gets.chomp

    new_pw = Password.new(pass_to_be_encrpt)

    @admin_pw_storage.store(:pass_to_be_encrpt, new_pw.pass_to_be_encrpt) 
   
   

    #puts @admin_info_storage.values_at(:fst_name, :pass_word) 
    #puts "first name: " + @admin_info_storage.fetch(:fst_name) + " \n" + "password: " + @admin_info_storage.fetch(:pass_word)
    


    puts "New Administrator saved! Your user_id is: " + @admin_info_storage.fetch(:account_id)

    
  end


  def show_admins
    print "Here, you will enter your first name then user_id to lookup your account info. \n"
    print "enter first name: \n"
    name = gets.chomp
      if @admin_info_storage.has_value?(name)
        puts "enter your user_id: "
        id = gets.chomp
        if @admin_info_storage.has_value?(id)

          puts "yes, you are in db"
          # show admin info
        end
      end
  end



  def encrpt_pw

    box_of_chars = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher.shuffle!

    # encrypting

    plain_text = @admin_pw_storage.fetch(:pass_to_be_encrpt)
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
  
  #manager.add_pw
  
  manager.encrpt_pw

  print "keep running?: \n \n"

  if gets.chomp == "stop"
    break
  else
    print "ok: keep running program \n \n"
  end
end
