
class Password

  attr_reader :pass_to_be_encrpt

  def initialize (pass_to_be_encrpt)

    @pass_to_be_encrpt = pass_to_be_encrpt
    
  end

end

=begin
  def add_pw

    print  "Create a password. It will be encrypted for maximum account protection: "
    pass_to_be_encrpt = gets.chomp

    new_pw = Password.new(pass_to_be_encrpt)

    @admin_pw_storage.store(:pass_to_be_encrpt, new_pw.pass_to_be_encrpt) 

  end
=end  




