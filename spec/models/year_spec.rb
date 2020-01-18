require 'rails_helper'

describe Year do
  describe '#create' do

    # 1, yearが存在すれば登録出来る
    it "is valid with a year" do
      year = build(:year)
      expect(year).to be_valid
    end

    # 2, yearが空では登録できないこと
    it "is invalid without a year" do
      year = build(:year, year: nil)
      year.valid?
      expect(year.errors[:year]).to include("を入力してください")
    end

    # 3. 同じuserで重複したyearが存在する場合登録できないこと
    it "is invalid with a duplicate year address" do
      year = create(:year)
      another_year = build(:year, year: year.year, user_id: year.user_id)
      another_year.valid?
      expect(another_year.errors[:year]).to include("はすでに存在します")
    end
    
    # 4. yearが１以上であれば登録出来ること
    it "is valid with a year that is more than 1" do
      year = build(:year, year: "1")
      year.valid?
      expect(year).to be_valid
    end

    # 5, yearが0以下であれば登録出来ないこと
    it "is invalid with a year that is less than 0 " do
      year = build(:year, year: "0")
      year.valid?
      expect(year.errors[:year]).to include("は1以上の値にしてください")
    end
  end
end

# bundle exec rspec spec/models/year_spec.rb