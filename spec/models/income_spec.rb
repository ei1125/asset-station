require 'rails_helper'

describe Income do
  describe '#create' do
    # 1, incomeが存在すれば登録出来る
    it "is valid with a income" do
      income = build(:income)
      expect(income).to be_valid
    end

    # 2, incomeが空では登録できないこと
    it "is invalid without a income" do
      income = build(:income, item: nil)
      income.valid?
      expect(income.errors[:item]).to include("を入力してください")
    end
    
  end

end

# bundle exec rspec spec/models/income_spec.rb