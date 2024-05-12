
class Admin_main_Password

  attr_reader :main_pw_to_be_encrpt

  def initialize (main_pw_to_be_encrpt)

    @main_pw_to_be_encrpt = main_pw_to_be_encrpt
    
  end

end

=begin
  def add_pw

    print  "Create a password. It will be encrypted for maximum account protection: "
    main_pw_to_be_encrpt = gets.chomp

    new_pw = Password.new(main_pw_to_be_encrpt)

    @admin_pw_storage.store(:main_pw_to_be_encrpt, new_pw.main_pw_to_be_encrpt) 

  end
=end  
