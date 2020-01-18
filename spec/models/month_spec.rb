require 'rails_helper'

describe Month do

  describe '#create' do
    # 1, monthが存在すれば登録出来る
    it "is valid with a month" do
      month = build(:month)
      expect(month).to be_valid
    end
  end

  # 2, yearが空では登録できないこと
  it "is invalid without a month" do
    month = build(:month, month: nil)
    month.valid?
    expect(month.errors[:month]).to include("を入力してください")
  end

  # 3. 同じuser,yearで重複したyearが存在する場合登録できないこと
  it "is invalid with a duplicate month address" do
    month = create(:month)
    another_month = build(:month, month: month.month, user_id: month.user_id, year_id: month.year_id)
    another_month.valid?
    expect(another_month.errors[:month]).to include("はすでに存在します")
  end
  
  # 4. yearが１以上であれば登録出来ること
  it "is valid with a month that is more than 1" do
    month = build(:month, month: "1")
    month.valid?
    expect(month).to be_valid
  end

  # 5, yearが0以下であれば登録出来ないこと
  it "is invalid with a month that is less than 0 " do
    month = build(:month, month: "0")
    month.valid?
    expect(month.errors[:month]).to include("は1以上の値にしてください")
  end

  # 6. yearが12以下であれば登録出来ること
  it "is valid with a month that is less than 12" do
    month = build(:month, month: "12")
    month.valid?
    expect(month).to be_valid
  end

  # 7, yearが13以上であれば登録出来ないこと
  it "is invalid with a month that is more than 13 " do
    month = build(:month, month: "13")
    month.valid?
    expect(month.errors[:month]).to include("は12以下の値にしてください")
  end

end

# bundle exec rspec spec/models/month_spec.rb