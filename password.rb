
class Password

  attr_reader :pass_to_be_encrpt

  def initialize (pass_to_be_encrpt)

    @pass_to_be_encrpt = pass_to_be_encrpt
    
  end

  


  def encrpt_pw

    box_of_chars = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]


    cipher = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher.shuffle!

    # encrypting

    plain_text = @admin_pw_storage.fetch(:pw)
    pop = plain_text.split("")

    cipher_text = ""

    a = 0 
    while (a < pop.length)
      dx = box_of_chars.index(pop[a])
      cipher_text += cipher[dx]
      a += 1
    end

    pp plain_text
    puts cipher_text

  end

end
