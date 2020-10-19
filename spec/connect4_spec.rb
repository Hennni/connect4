# spec/connect4_spec.rb

require './lib/connect4'

describe Board do
  describe 'draw_board' do
    it 'returns upper right corner of 7x6 matrix' do
      board = Board.new
      expect(board.draw_board[0][6]).to eql('')
    end
    it 'returns lower left corner of 7x6 matrix' do
      board = Board.new
      expect(board.draw_board[5][0]).to eql('')
    end
    it 'returns upper left corner of 7x6 matrix' do
      board = Board.new
      expect(board.draw_board[0][0]).to eql('')
    end
    it 'returns lower right corner of 7x6 matrix' do
      board = Board.new
      expect(board.draw_board[5][6]).to eql('')
    end
  end
end
