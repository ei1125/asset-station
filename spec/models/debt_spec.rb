require 'rails_helper'

describe Debt do
  describe '#create' do
    # 1, debtが存在すれば登録出来る
    it "is valid with a debt" do
      debt = build(:debt)
      expect(debt).to be_valid
    end

    # 2, debtが空では登録できないこと
    it "is invalid without a debt" do
      debt = build(:debt, item: nil)
      debt.valid?
      expect(debt.errors[:item]).to include("を入力してください")
    end
    
  end

end

# bundle exec rspec spec/models/debt_spec.rb