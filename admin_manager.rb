





alpha_table = { 0 => 'a', 1 => 'b', 2 => 'c', 3=>'d', 4=>'e', 5=>'f', 6=>'g', 7=>'h', 8=>'i', 9=>'j', 10=>'k', 11=>'l', 12=>'m', 13=>'n', 14=>'o', 15=>'p', 16=>'q', 17=>'r', 18=>'s', 19=>'t', 20=>'u', 21=>'v', 22=>'w', 23=>'x', 24=>'y', 25=>'z'}





while (true)
  dx = 0
  first_name = gets.chomp
  first_name_alphas = first_name.split("")

  state = true

  while (dx < first_name_alphas.length)
    if alpha_table.has_value?(first_name_alphas[dx])

    else
      puts "all letters in name must be alpha "
      state = false
    end
    dx += 1
  end
  if state == true
    break
  end

end
