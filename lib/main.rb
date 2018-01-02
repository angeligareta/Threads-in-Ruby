# CLASE PARA ENTRENAR AL CHEF
require 'lib/chef'
semaphore = Mutex.new

TIMES_TO_TEST = 10

@chef = Chef.new()

chef_thread = Thread.new do
    TIMES_TO_TEST.times {
        semaphore.synchronize {
            @chef.add_year 
        }
        sleep(0.5)
    }
end

client_thread = Thread.new do 
    TIMES_TO_TEST.times { 
        puts "Dish taster waiting patiently..."
        semaphore.synchronize {
            case @chef.taste_one
                when -1 
                    puts "Sorry, the Chef is retired."
                    Thread.kill(client_thread)
                    Thread.kill(chef_thread)
                when 0
                    puts "Sorry, no dishes to taste."
                when 1
                    puts "The dish is delicious."
            end
        }
        sleep(0.5)
    }
end

chef_thread.join
client_thread.join

Thread.kill(client_thread)
Thread.kill(chef_thread)