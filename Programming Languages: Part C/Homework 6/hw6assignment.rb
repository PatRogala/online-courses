# frozen_string_literal: true

# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

# MyPiece for enhanced Tetris
class MyPiece < Piece
  def self.next_piece(board)
    MyPiece.new(ALL_MY_PIECES.sample, board)
  end

  def self.cheat_piece(board)
    MyPiece.new(CHEAT_PIECE, board)
  end

  CHEAT_PIECE = [[[0, 0]]].freeze
  ALL_MY_PIECES = [[[[0, 0], [1, 0], [0, 1], [1, 1]]],
                   rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]),
                   [[[0, 0], [-1, 0], [1, 0], [2, 0]],
                    [[0, 0], [0, -1], [0, 1], [0, 2]]],
                   [[[0, -2], [0, -1], [0, 0], [0, 1], [0, 2]],
                    [[-2, 0], [-1, 0], [0, 0], [1, 0], [2, 0]]],
                   [[[0, 0], [1, 0], [0, 1], [1, 1], [1, 2]],
                    [[0, 0], [1, 0], [0, 1], [1, 1], [2, 0]],
                    [[0, 0], [1, 0], [0, 1], [1, 1], [0, -1]],
                    [[0, 0], [1, 0], [0, 1], [1, 1], [-1, 1]]],
                   [[[0, 0], [1, 0], [1, 1]], [[0, 0], [1, 0], [0, 1]],
                    [[0, 0], [1, 1], [0, 1]], [[1, 1], [1, 0], [0, 1]]],
                   rotations([[0, 0], [0, -1], [0, 1], [1, 1]]),
                   rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]),
                   rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]),
                   rotations([[0, 0], [1, 0], [0, -1], [-1, -1]])].freeze
end

# MyBoard for enhanced Tetris
class MyBoard < Board
  def initialize(game)
    super(game)
    @current_block = MyPiece.next_piece(self)
    @cheat = false
  end

  def next_piece
    @current_block = @cheat ? MyPiece.cheat_piece(self) : MyPiece.next_piece(self)

    @cheat = false
    @current_pos = nil
  end

  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..(locations.size - 1)).each do |index|
      current = locations[index]
      @grid[current[1] + displacement[1]][current[0] + displacement[0]] = @current_pos[index]
    end
    remove_filled
    @delay = [@delay - 2, 80].max
  end

  def rotate_180_deg
    rotate_clockwise
    rotate_clockwise
  end

  def cheat
    return unless @score >= 100 && !@cheat

    @score -= 100
    @cheat = true
  end
end

# MyTetris for enhanced Tetris
class MyTetris < Tetris
  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

  def key_bindings
    super
    @root.bind('c', proc { @board.cheat })
    @root.bind('u', proc { @board.rotate_180_deg })
  end
end
