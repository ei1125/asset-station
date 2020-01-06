module YearsHelper
  def year_array(years)
    array = []
    years.each do |year|
      total_cf = year.incomes.sum(:cf) - year.expenses.sum(:cf)
      array << [ year.year, total_cf ]
    end
    return array
  end

  def month_array(months)
    array = []
    months.each do |month|
      total_cf = month.incomes.sum(:cf) - month.expenses.sum(:cf)
      array << [ month.month, total_cf ]
    end
    return array
  end
  
end
