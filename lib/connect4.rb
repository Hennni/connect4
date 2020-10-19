class Board
  attr_accessor :game_board
  def initialize
    @game_board = draw_board
  end

  def draw_board
    board_matrix = []

    for i in 0..5 do
      board_matrix << []
      for j in 0..6 do
        board_matrix[i][j] = ' '
      end
    end
    board_matrix << [1, 2, 3, 4, 5, 6, 7]
    board_matrix
  end

  def print_board
    @game_board.each {|row| print row.join(' ') + "\n"}
    puts
  end
end

class PlayGame < Board
  attr_accessor :finished, :new_board, :round_counter
  def initialize
    @new_board = Board.new
    new_board.print_board
    game_loop
  end

  def game_loop
    @round_counter = 0
    loop do
      update_board
      who_won if check_win
      @round_counter += 1
    end
  end

  def update_board
    player_input = gets.chomp.to_i
    color = round_counter.even? ? "\u{2689}" : "\u{2687}"

    new_board.game_board.each_with_index do |row, i|
      if i == 5 && row[player_input - 1] == ' '
        new_board.game_board[i][player_input - 1] = color
        break
      elsif i.zero? && (row[player_input - 1] == "\u{2689}" || row[player_input - 1] == "\u{2687}")
        @round_counter -= 1
        break
      elsif row[player_input - 1] != ' ' && player_input < 8 && player_input.positive? && i.positive?
        new_board.game_board[i - 1][player_input - 1] = color
        break
      end
    end
    new_board.print_board
  end

  def check_win
    false
  end
end

PlayGame.new