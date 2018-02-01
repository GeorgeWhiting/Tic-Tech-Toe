describe Game do

  subject {Game.new()}

  describe "#switch_player" do
    it "should change who's turn it is" do
      expect(subject.current_turn).to eq 'x'
      subject.switch_player
      expect(subject.current_turn).to eq 'o'
    end

    it "should lower the number of remaining turns by 1" do
      subject.switch_player
      expect(subject.remaining_turns).to eq 8
    end
  end

  describe "do_turn" do
    it "should place the current player's marker in a field then switch the current player" do
      expect(subject.current_turn).to eq 'x'
      subject.do_turn(1,1)
      expect(subject.current_turn).to eq 'o'
      expect(subject.board.get_element_value(1,1)).to eq 'x'
    end

    it "should only place markers in empty fields" do
      subject.do_turn(1,1)
      expect {subject.do_turn(1,1)}.to_not change {subject.board.get_element_value(1,1)}
    end

    it "should not change turn if an invalid move is attempted" do
      expect(subject.current_turn).to eq 'x'
      subject.do_turn(1,1)
      subject.do_turn(1,1)
      expect(subject.current_turn).to eq 'o'
    end
  end
end
