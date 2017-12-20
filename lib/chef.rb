EXP_PER_YEAR = 3
DISH_PER_EXP = 3
MASTER_YEAR = 3
RETIREMENT_YEAR = 10

class Chef
  
  attr_reader :experience, :years_worked, :dish_counter
    
  def initialize
    @experience = 0
    @years_worked = 0
    @dish_counter = 0
  end
  
  def add_year
    @years_worked += 1
    produce_dishes unless (@years_worked < MASTER_YEAR)
    @experience += EXP_PER_YEAR
  end
  
  def taste_one
    @dish_counter -= 1 unless @dish_counter == 0
   
    if @years_worked < RETIREMENT_YEAR
      if @dish_counter == 0
        return 0
      else
        return 1
      end
    else
      return -1
    end
    
  end
  
  private
  
  def produce_dishes
    @dish_counter += DISH_PER_EXP * @experience
  end
    
end