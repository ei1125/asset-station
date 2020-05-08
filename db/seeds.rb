# coding: utf-8

newSelects = []
newSelects << Select.new(id: 1001, item: '給料', category: 'income')
newSelects << Select.new(id: 1002, item: '不動産', category: 'income')
newSelects << Select.new(id: 1003, item: 'ビジネス', category: 'income')
newSelects << Select.new(id: 1004, item: '株の配当', category: 'income')
newSelects << Select.new(id: 1005, item: 'その他', category: 'income')

newSelects << Select.new(id: 2001, item: '家賃', category: 'expense')
newSelects << Select.new(id: 2002, item: '税金', category: 'expense')
newSelects << Select.new(id: 2003, item: '自動車ローン', category: 'expense')
newSelects << Select.new(id: 2004, item: '銀行ローン', category: 'expense')
newSelects << Select.new(id: 2005, item: 'クレジットカードローン', category: 'expense')
newSelects << Select.new(id: 2006, item: '保険料', category: 'expense')
newSelects << Select.new(id: 2007, item: 'その他', category: 'expense')

newSelects << Select.new(id: 3001, item: '不動産', category: 'asset')
newSelects << Select.new(id: 3002, item: '土地', category: 'asset')
newSelects << Select.new(id: 3003, item: '株式', category: 'asset')
newSelects << Select.new(id: 3004, item: '債権', category: 'asset')
newSelects << Select.new(id: 3005, item: '貯金', category: 'asset')
newSelects << Select.new(id: 3006, item: 'その他', category: 'asset')

newSelects << Select.new(id: 4001, item: '自動車ローン残債', category: 'debt')
newSelects << Select.new(id: 4002, item: '住宅ローン残債', category: 'debt')
newSelects << Select.new(id: 4003, item: '銀行ローン残債', category: 'debt')
newSelects << Select.new(id: 4004, item: 'クレジットカードローン残債', category: 'debt')
newSelects << Select.new(id: 4005, item: '知人への借金残高', category: 'debt')
newSelects << Select.new(id: 4006, item: 'その他', category: 'debt')

Select.import newSelects, on_duplicate_key_update: [:id, :item, :category]
