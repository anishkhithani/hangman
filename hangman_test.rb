require 'test/unit'

require_relative 'Hangman'

class TestHangman < Test::Unit::TestCase

    def setup
        @game = Hangman.new
        @game.word = "booger"
        @game.board = @game.draw_board(@game.word)
    end

    def test_for_initialize_method
        assert_equal(8,@game.chances)
        assert_equal([],@game.guesses)
        assert_equal("______",@game.board)
    end

    def test_for_wordhas_check_tosee_ifword_has_letter_and_false
        assert_equal(true,@game.word_has?("o"))
        assert_equal(false,@game.word_has?("h"))
    end

    def test_for_putting_correct_letter_on_board
        @game.put_letter_on_board("b")
        assert_equal("b_____",@game.board)
    end

    def test_for_wrong_letter
        @game.wrong_letter("p")
        assert_equal(7,@game.chances)
        assert_equal(["p"],@game.guesses)
    end

    def test_valid_guess_trueandfalse
        assert_equal(true,@game.valid_guess?("b"))
        assert_equal(false,@game.valid_guess?("booger"))
    end


end

