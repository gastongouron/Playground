def play_battleship

  puts "Let's play Battleship!\n-----\nThis is your board!\n-----"
  human_board = Array.new(10)

  robot_board = Array.new(10) { Array.new(10, "O") }

  def print_robot_board(robot_board)
    robot_board.each do |row|
      puts row.each { |point| point }.join(" ")
    end
  end


  puts "Let's play Battleship!\n-----\nYou have 10 tries!\n-----"
  print_robot_board(robot_board)

  def random_row(board)
      return rand(10)
  end

  def random_col(board)
      return rand(10)
  end

  ship_row = random_row(robot_board)
  ship_col = random_col(robot_board)

  for turn in 1..10

    puts "Turn: #{turn}"
    puts "Guess Row (0-9): "
    guess_row = gets.chomp.to_i
    puts "Guess Collumn (0-9): "
    guess_col = gets.chomp.to_i

    if turn == 10
        puts "------\nGame Over!\nThe Battleship coordinates were:#{ship_row},#{ship_col}"
        break

    elsif (guess_row == ship_row) && (guess_col == ship_col)
        puts "Congratulations! You sunk my battleship!"
        break

    else

        if ((guess_row < 0) || (guess_row > 9)) || ((guess_col < 0) || (guess_col > 9))
            puts "There is now such row in the map."
        elsif(robot_board[guess_row][guess_col] == "X")
            puts "You already tried that."
        else
            puts "Try again"
            robot_board[guess_row][guess_col] = "X"
        end

    end
    print_robot_board(robot_board)
  end

end
play_battleship
