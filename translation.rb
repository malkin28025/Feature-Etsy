# this is going to be a method that converts
# integers into their English language representations.
class Fixnum

  def to_spanish
    
    names_as_array = %w(cero uno dos tres cuatro cinco seis siete ocho nueve diez once doce trece catorce quince dieciseis diecisiete dieciocho diecinueve veinte veinteuno veintedos veintetres veintecuatro veintecinco veinteseis veintesiete veinteocho veintenueve)

    tens_names = %w(blank blank treinta cuarenta cincuenta sesenta setenta ochenta noventa)

    hundreds_names = %w(cien doscientos trescientos cuatrocientos quinientos seiscientos setecientos ochocientos novecientos)

    


    if self > 600
      internal_calculation(100, "cien")    

    elsif self > 500
      tens = (self - 500) / 10
      ones = (self - 500) % 10
      if ones > 0
        "quinientos #{tens_names[tens]} y #{ones.to_spanish}"
      else
        tens_names[tens]
      end

    elsif self > 200
      internal_calculation(200, "doscientos")

    elsif self > 100
      tens = (self - 100) / 10
      ones = (self - 100) % 10
      if ones > 0
        "cien #{tens_names[tens]} #{ones.to_spanish}"
      else
        tens_names[tens]
      end

    elsif self == 100
      "cien"
    
    elsif self > 29

      tens = self / 10
      ones = self % 10
      if ones > 0
        "#{tens_names[tens]} y #{ones.to_spanish}"
      else
        tens_names[tens]
      end
    else
      names_as_array[self]
    end 
  end

  def internal_calculation(place, name)   
      big_number = self / place
      remainder = self % place
    if remainder > 0
      "#{big_number.to_spanish}#{name} #{remainder.to_spanish}" 
    else
      "#{big_number.to_spanish}#{name}"
    end
  end

end

=begin
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
    names_as_array[self]
    end
  end

=begin
    #if self >= 1_000_000
    #elsif self >= 1000000
      #internal_calculation(1000000, "million")
    #elsif self >= 1000
      #internal_calculation(1000, "mil")
    #elsif self >= 100
      internal_calculation(100, "cien")
    elsif self > 19
      diez_names = %w(blank blank veinte treinta cuarenta
                      cincuenta sesenta setenta ochenta
                      noventa)
      diez = self / 10
      uno = self % 10
      if uno > 0
        "#{diez_names[diez]} #{uno.translation}" 
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
      "#{big_number.translation} #{name} #{remainder.translation}"
    else
      "#{big_number.translation} #{name}"
    end
  end
end
begin #Now that I'm usingtranslation in the poker game, the puts get in the way
puts 0.0 translation #=> "cero"
#puts 1.0 translation #=> "uno"
#puts 2.0 translation #=> "dos"
#puts 9.0 translation #=> "nueve"
#puts 20 translation #=> "veinte"
#puts 21 translation #=> "veinte uno"
#puts 22 translation #=> "veinte dos"
#puts 30 translation #=> "treinta"
#puts 31 translation #=> "treinta uno"
#puts 99 translation #=> "noventa nueve"
#puts 100 translation #=> "cien"
#puts 101.translation #=> "cienuno"
#puts 178.translation
#puts 200.translation
#puts 543.translation
#puts 1000.translation
#puts 2000.translation
#puts 3456.translation
#puts 10611.translation
#puts 999999.translation
#puts 1000000.translation
end
=end
