require 'byebug'

@win_count = 0
@lose_count = 0

def set_game_count
    puts "何本勝負？(press 1 or 3 or 5)"
    game_count = gets.to_i
    @game_count = game_count

    if game_count == 1
        puts "#{game_count}本を選びました"
    elsif game_count == 3
        puts "#{game_count}本を選びました"
    elsif game_count == 5
        puts "#{game_count}本を選びました"
    else
        puts "1、3、5の中からもう一度入力してください"
        set_game_count
    end
end

def janken
    set_game_count

    1.upto(@game_count) do |i|
        puts "#{i}本目"
        puts "じゃんけん…(press g or c or p)"
        player_hand = gets.chomp
        @player_hand = player_hand
        validation
        battle
    end
    result
end

def validation 
    if @player_hand != "g" || @player_hand != "c" || @player_hand != "p"
        puts 'もう一度入力してください (press g or c or p)'
        player_hand = gets.chomp
        @player_hand = player_hand
        validation
    end
end

def battle 
    hand = {"g"=>"グー","c"=>"チョキ","p"=>"パー"}
    computer_hand = hand.keys.sample
    @computer_hand = computer_hand

    puts "CPU…#{hand[@computer_hand]}\nあなた…#{hand[@player_hand]}"  

    if @player_hand == @computer_hand
        puts "あいこで...(press g or c or p)"
        battle
    elsif (@player_hand == hand.keys[0] && @computer_hand == hand.keys[1]) || (@player_hand == hand.keys[1] && @computer_hand == hand.keys[2]) || (@player_hand == hand.keys[2] && @computer_hand == hand.keys[0])
        puts "勝ち！"
        @win_count += 1
        puts "#{@win_count}勝#{@lose_count}敗"
    else
        puts "負け！"
        @lose_count += 1
        puts "#{@win_count}勝#{@lose_count}敗"
    end
end

def result
    puts "結果"
    if @win_count > @lose_count
        puts "#{@win_count}勝#{@lose_count}敗であなたの勝ち"
    else
        puts "#{@win_count}勝#{@lose_count}敗であなたの負け"
    end
end

janken