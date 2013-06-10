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

    # def test_if_raise_is_outputed_from_invalid_guess
    #     assert_raise("Invalid Guess") {@game.guess("booger")}
    # end

    def test_win_for_true
        @game.guess("b")
        @game.guess("o")
        @game.guess("g")
        @game.guess("e")
        @game.guess("r")
        assert_equal(true,@game.win?)
    end

    def test_for_lose
        @game.guess("1")
        @game.guess("2")
        @game.guess("3")
        @game.guess("4")
        @game.guess("5")
        @game.guess("6")
        @game.guess("7")
        @game.guess("8")
        puts @game.chances
        assert_equal(0,@game.chances)
    end
end

