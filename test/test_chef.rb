require 'test/unit'
require 'lib/chef'

TIMES_TO_TEST = 10

class TrainChef < Test::Unit::TestCase
    
    def setup
      @chef = Chef.new()
    end
    
    def test_simple
      # Valores al inicializar
      assert_equal(@chef.experience, 0)
      assert_equal(@chef.years_worked, 0)
      assert_equal(@chef.dish_counter, 0)
      
      # Valores después de add_year
      3.times{ @chef.add_year }
      assert_equal(@chef.experience, 9)
      assert_equal(@chef.years_worked, 3)
      assert_equal(@chef.dish_counter, 18)
      
      # Valores después de taste_one
      3.times{ @chef.taste_one }
      assert_equal(@chef.experience, 9)
      assert_equal(@chef.years_worked, 3)
      assert_equal(@chef.dish_counter, 15)
    end
    
    def test_type_check
      assert_raise(ArgumentError) { Chef.new(5) }
      assert_not_nil(Chef.new)
      assert_respond_to(@chef, :add_year)
      assert_respond_to(@chef, :taste_one)
    end
    
end