describe Board do

  subject {Board.new}

  describe "#init" do
    it "should initialize with 9 elements filled with - " do
      expect(subject.board.flatten.length).to eq 9
      expect(subject.board.flatten.all?{|e| e == '-'}).to eq true
    end
  end
end
