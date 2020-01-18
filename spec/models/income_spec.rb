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

    # 3. 同じuser,monthで重複したyearが存在する場合登録できないこと
    it "is invalid with a duplicate income address" do
      income = create(:income)
      another_income = build(:income, item: income.item, user_id: income.user_id, month_id: income.month_id)
      another_income.valid?
      expect(another_income.errors[:item]).to include("はすでに存在します")
    end

    # 4, cfが0以上だと登録出来る
    it "is valid without cf" do
      income = build(:income, cf: 0)
      expect(income).to be_valid
    end

    # 5, cfが-1以下だと登録出来ない
    it "is invalid with a cf that is less than -1 " do
      income = build(:income, cf: "-1")
      income.valid?
      expect(income.errors[:cf]).to include("は0以上の値にしてください")
    end
  end

end

# bundle exec rspec spec/models/income_spec.rb