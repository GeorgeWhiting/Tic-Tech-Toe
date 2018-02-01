describe Game do

  subject {Game.new}

  describe "#next_turn" do
    it "should change who's turn it is" do
      expect(subject.current_turn).to eq 'x'
      subject.next_turn
      expect(subject.current_turn).to eq 'o'
    end
  end
end
