describe Board do

  subject {Board.new}

  describe "#init" do
    it "should initialize with 9 elements filled with - " do
      expect(subject.board.flatten.length).to eq 9
      expect(subject.board.flatten.all?{|e| e == '-'}).to eq true
    end
  end

  describe "#get_element_value" do
    it "should get the value of the selected element" do
      expect(subject.get_element_value(0, 0)).to eq '-'
    end
  end

  describe "#claim_field" do
    it "should change the selected element to x or o" do
      subject.claim_field(0,0,'x')
      expect(subject.board[0][0]).to eq 'x'
    end

    it "should not change the element if it has already been taken" do
      subject.claim_field(0,0,'o')
      expect {subject.claim_field(0,0,'x')}.to_not change {subject.board[0][0]}
    end
  end

  describe "#is_field_free?" do
    it "should return true if the element contains - " do
      expect(subject.is_field_free?(0,0)).to eq true
      expect {subject.claim_field(0,0,'x')}.to change {subject.is_field_free?(0,0)}
    end
  end
end
