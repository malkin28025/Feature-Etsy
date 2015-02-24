require 'minitest/autorun'
require './translation'

class TestTranslation< Minitest::Unit::TestCase

	def test_number_0_is_cero_in_spanish
		assert_equal "cero", 0.to_spanish
	end

	def test_number_1_is_uno_in_spanish
		assert_equal "uno", 1.to_spanish
	end

	def test_number_20_is_veinte_in_spanish
		assert_equal "veinte", 20.to_spanish
	end

	def test_number_21_is_veinte_uno_in_spanish
		assert_equal "veinteuno", 21.to_spanish
	end

	
	def test_number_100_is_cien_in_spanish
		assert_equal "cien", 100.to_spanish
	end

	def test_number_150_is_doscientos_in_spanish
		assert_equal "doscientos", 200.to_spanish
	end

	

	
end

