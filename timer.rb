require 'stop_watch'
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

watch = StopWatch::Timer.new
# Marks the current time and starts the timer
watch.mark

play_Again = true

while play_Again do

    # A system which lets the timer go on as the user is entering
    for i in 0...1
        puts "Hi, what is the song you think you guessed? "
        answer = gets.chomp
        puts "You guessed: #{answer}" 
    end

    puts "Do you want to play the snippet again?"
    repeat = gets.chomp

    play_Again = false if repeat == "No" 
end

# Stops the timer and returns an array
puts watch.mark

# New Array which stores the time
array1 = Array.new()

for i in 0...watch.mark.length() - 1
    array1.push(watch.mark[i])
end

puts array1

# puts "You took: #{watch.h} seconds"

# # An array that converts the seconds to two decimal places
# secondsArray = watch.mark.map! { |s| s.to_i}

# puts secondsArray


