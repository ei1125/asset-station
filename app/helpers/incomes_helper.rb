module IncomesHelper

  def total_cf(moneys)
    total = 0
    moneys.each do |money|
      total += money.cf.to_i
    end
    return total
  end

  def profit_cf(month)
    incomes = month.incomes
    expenses = month.expenses
    profit_cf =total_cf(incomes) - total_cf(expenses)
    return profit_cf
  end

end
