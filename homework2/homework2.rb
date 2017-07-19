class Player
  def initialize(name)
    @name = name
   
      def get_gesture
         
          input = gets.chomp.upcase
          
      end
   
  end 
end

# 人類玩家的類別
class Human < Player
  
end

# 電腦的類別
class Computer < Player
  def get_gesture
  	input = ['R', 'P', 'S'].shuffle!.last
  end
end


class RPS
  def initialize
     intro 
     begin
     get_player_gestures 
     decide  
     continue?
     end while @continue == 'Y'
  end
  def intro
    #印出開場畫面，告訴玩家遊戲規
    puts "|===============================================|" 
    puts "|Welcome to Rock Paper Scissors!!!              |"
    puts "|===============================================|"
  end

  def decide
    #邏輯判斷式
    hash = {
      "S"=>"P",
      "P"=>"R",
      "R"=>"S"
    }
    if hash[@user_input] == @com_input
        puts "贏了！"
        elsif hash[@com_input] == @user_input
        puts "輸了！"
        else 
        puts "平手!!"

    end
  end
  
  def get_player_gestures
    #取得玩家和電腦兩個物件的
    begin
    puts "你要出石頭R，布P，剪刀S"
    human = Human.new(@user_input)
    @user_input = human.get_gesture
    end while !['R', 'P', 'S'].include?(@user_input)
    computer = Computer.new(@com_input)
    @com_input = computer.get_gesture
    puts "電腦出 " + @com_input + " 玩家出 " + @user_input

  end

  def continue?
    #判斷玩家是否要繼續下一輪
     begin
    puts '再玩一次?: Y / N'
    player = Player.new(@continue)
    @continue = player.get_gesture
     end while !["Y", "N"].include?(@continue)

  end

  def show_message
    #印出結果
  end
end

# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
game = RPS.new