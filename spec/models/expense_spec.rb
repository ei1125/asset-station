require 'rails_helper'

describe Expense do
  describe '#create' do
    # 1, expenseが存在すれば登録出来る
    it "is valid with a expense" do
      expense = build(:expense)
      expect(expense).to be_valid
    end

    # 2, incomeが空では登録できないこと
    it "is invalid without a expense" do
      expense = build(:income, item: nil)
      expense.valid?
      expect(expense.errors[:item]).to include("を入力してください")
    end

  end

end

# bundle exec rspec spec/models/expense_spec.rb