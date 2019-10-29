require 'stop_watch'
#require 'math'
# Creates a new Stopwatch
# watch = StopWatch::Timer.new

# # Marks the current time and starts the timer
# watch.mark

# puts "The song has ended. Please guess what song.... "
# answer = gets.chomp

# # A system which lets the timer go on as the user is entering
# for i in 0..1
#     puts "Hi, what is the song you think you guessed? "
#     answer = gets.chomp
#     puts "You guessed: #{answer}" 
# end

# # Stops the timer and returns an array
# puts "You took: #{watch.mark.first} seconds"
# puts watch.h


play_Again = true

while play_Again == true do

    watch = StopWatch::Timer.new
    # Marks the current time and starts the timer
    watch.mark


    
    #play song between this, timer keeps running
    #run tests, unit tests



    # A system which lets the timer go on as the user is entering
    for i in 0...1
        puts "Hi, what is the song you think you guessed? "
        answer = gets.chomp
        puts "You guessed: #{answer}" 
    end

    # Stops the timer and returns an array
    puts "#{watch.mark[0].round(2)} seconds"

    #points, store points in an array? total +=
    def calculate_points(seconds)
        points = 1108.8 * (2.71 ** (-0.103 * seconds)) 
        return points.to_i
    end 

    puts calculate_points(watch.mark[0])
    
    # New Array which stores the time
    #array1 = Array.new()

    #for i in 0...watch.mark.length() - 1
    #    array1.push(watch.mark[i])
    #end

    #puts array1

    puts "Do you want to play the snippet again? "
    repeat = gets.chomp

    if repeat.downcase == "no" 
        play_Again = false
    end
end
    puts "Next round!"



# puts "You took: #{watch.h} seconds"

# # An array that converts the seconds to two decimal places
# secondsArray = watch.mark.map! { |s| s.to_i}

# puts secondsArray


