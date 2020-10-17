class SpeedTyper
  attr_accessor :words

  EMOJIS = ["😢","😛","😒","😴","😂"]

  def initialize(array)
    @@words = array 
  end

  def self.add_to_word(item)
    """Can add more words in the list 
    of words"""

    @@words << item
  end
  
  def self.run
    """Runs the program """

    while true
      self.speed_typer
      puts"run again(n/y)" 
      if gets.chomp == "n"
        puts "bye !!"
        break
      end
    end
  end

  def self.time_diff(start, finish)
    """Outputs the time it spent for the user to correctly 
    enter the right word """

    Time.at(finish - start).utc.strftime("%H:%M:%S")
  end

  def self.speed_typer
    """Main Game Loop"""

    word = @@words.sample
    index = 0
    start = Time.now
    while true 
      puts "enter: #{word}"
      user_input = gets.chomp 
      
      if user_input == word
        stop = Time.now
        puts "Correct!"
        puts "🎉🎈🎊🥳"
        break
      else
        puts '------' 
        puts "wrong try again"
        puts EMOJIS[index]
        index += 1
        index = 0 if index > EMOJIS.length - 1
      end 
    end
    puts time_diff(start, stop)   
  end
end


SpeedTyper.new(["word","what","this","suck","hey","hello","this is a long sentence","😁 Bonus 😛"])
SpeedTyper.run
