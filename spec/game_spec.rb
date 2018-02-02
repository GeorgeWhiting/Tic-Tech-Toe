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

  describe "#do_turn" do
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

  describe "#game_over?" do
    it "should return true if remaining turns reach 0" do

      #will be changed when i start mocking
      subject.do_turn(0,0)
      subject.do_turn(0,1)
      subject.do_turn(0,2)
      subject.do_turn(1,0)
      subject.do_turn(1,1)
      subject.do_turn(1,2)
      subject.do_turn(2,0)
      subject.do_turn(2,1)
      subject.do_turn(2,2)

      expect(subject.game_over?).to eq true
    end
  end

  describe "#win_check" do
    it "should return false if the game isn't won" do
      subject.do_turn(0,0)
      expect(subject.win_check(0,0)).to eq false
    end

    it "should return true if row 0 contains all the same token" do
      subject.do_turn(0,1)
      subject.do_turn(1,2)
      subject.do_turn(0,2)
      subject.do_turn(2,2)
      subject.do_turn(0,0)
      expect(subject.win_check(0,0)).to eq true
    end

    it "should return true if row 1 contains all the same token" do
      subject.do_turn(1,0)
      subject.do_turn(0,0)
      subject.do_turn(1,1)
      subject.do_turn(2,0)
      subject.do_turn(1,2)
      expect(subject.win_check(1,2)).to eq true
    end

    it "should return true if row 2 contains all the same token" do
      subject.do_turn(2,0)
      subject.do_turn(0,0)
      subject.do_turn(2,1)
      subject.do_turn(1,2)
      subject.do_turn(2,2)
      expect(subject.win_check(2,2)).to eq true
    end

    it "should return true if column 0 contains all the same token" do
      subject.do_turn(1,0)
      subject.do_turn(1,2)
      subject.do_turn(2,0)
      subject.do_turn(2,2)
      subject.do_turn(0,0)
      expect(subject.win_check(0,0)).to eq true
    end

    it "should return true if column 1 contains all the same token" do
      subject.do_turn(1,1)
      subject.do_turn(1,2)
      subject.do_turn(2,1)
      subject.do_turn(2,2)
      subject.do_turn(0,1)
      expect(subject.win_check(0,1)).to eq true
    end

    it "should return true if column 2 contains all the same token" do
      subject.do_turn(1,2)
      subject.do_turn(1,1)
      subject.do_turn(2,2)
      subject.do_turn(2,1)
      subject.do_turn(0,2)
      expect(subject.win_check(0,2)).to eq true
    end

    it "should return true if the TL BR diagonal contains all the same token" do
      subject.do_turn(0,0)
      subject.do_turn(1,0)
      subject.do_turn(1,1)
      subject.do_turn(2,0)
      subject.do_turn(2,2)
      expect(subject.win_check(2,2)).to eq true
    end

    it "should return true if the BL TR diagonal contains all the same token" do
      subject.do_turn(0,2)
      subject.do_turn(1,0)
      subject.do_turn(1,1)
      subject.do_turn(2,1)
      subject.do_turn(2,0)
      expect(subject.win_check(2,0)).to eq true
    end
  end
end
