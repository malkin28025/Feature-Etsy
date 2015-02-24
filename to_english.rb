# this is going to be a method that converts
# integers into their English language representations.
class Fixnum

  def to_spanish
    names_as_array = %w( cero uno dos tres cuatro
                        cinco seis siete ocho
                        nueve diez once doce
                        trece catorce quince 
                        dieciséis diecisiete
                        dieciocho diecinueve
                       )


    if self >= 1_000_000
    elsif self >= 1000000
      internal_calculation(1000000, "million")
    elsif self >= 1000
      internal_calculation(1000, "mil")
    elsif self >= 100
      internal_calculation(100, "cien")
    elsif self > 19
      diez_names = %w(blank blank veinte treinta cuarenta
                      cincuenta sesenta setenta ochenta
                      noventa)
      diez = self / 10
      uno = self % 10
      if uno > 0
        "#{diez_names[diez]} #{uno.to_spanish}" 
      else
        diez_names[diez]
      end
    else
      names_as_array[self]  
    end 
  end
 
  def internal_calculation(place, name)
    remainder = self % place
    big_number = self / place
    if remainder > 0
      "#{big_number.to_spanish} #{name} #{remainder.to_spanish}"
    else
      "#{big_number.to_spanish} #{name}"
    end
  end
end
=begin Now that I'm using #to_spanish in the poker game, the puts get in the way
puts 0.to_spanish #=> "cero"
puts 1.to_spanish #=> "uno"
puts 2.to_spanish #=> "dos"
puts 9.to_spanish #=> "nueve"
puts 20.to_spanish #=> "veinte"
puts 21.to_spanish #=> "veinte uno"
puts 22.to_spanish #=> "veinte dos"
puts 30.to_spanish #=> "treinta"
puts 31.to_spanish #=> "treinta y uno"
puts 99.to_spanish #=> "noventa y nueve"
puts 100.to_spanish #=> "cien"
puts 101.to_spanish
puts 178.to_spanish
puts 200.to_spanish
puts 543.to_spanish
puts 1000.to_spanish
puts 2000.to_spanish
puts 3456.to_spanish
puts 10611.to_spanish
puts 999999.to_spanish
puts 1000000.to_spanish
=end