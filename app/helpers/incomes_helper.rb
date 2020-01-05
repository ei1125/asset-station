module IncomesHelper

  def total_cf(incomes)
    total = 0
    incomes.each do |income|
      total += income.cf.to_i
    end
    return total
  end

  def profit_cf(month)
    incomes = month.incomes
    expenses = month.expenses
    profit_cf =total_cf(incomes) - total_cf(expenses)
    return profit_cf
  end

  def total_money(assets)
    total = 0
    assets.each do |asset|
      total += asset.money.to_i
    end
    return total
  end
  

end
