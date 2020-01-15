$(function(){
  
  function buildHTML_when(data){
    var html = 
      `${data.year}年${data.month}月`
    return html
  };

  function buildHTML_edit(data){
    var html = 
      `<a class="m-icon" href="/years/${data.year_id}/months/${data.month_id}">
       <i class="fas fa-cog"></i></a>
       <a class="m-icon" rel="nofollow" data-method="delete" href="/years/${data.year_id}/months/${data.month_id}">
       <i class="fas fa-trash-alt"></i></a>
      `
    return html
  };

  function buildHTML_totalin(data){
    var html = 
      `総収入:${data.total_income}万円`
    return html
  };

  function buildHTML_totalex(data){
    var html = 
      `<ul>
        <li>総支出:${data.total_expense}万円</li>
        <li>月のCF:${data.month_cf}万円</li>
       </ul>
      `
    return html
  };

  function buildHTML_income_table(data){
    var html = 
      `<tr>
        <th class="item">項目</th>
        <th class="cf-text">キャッシュフロー</th>
       </tr>
       ${data.incomes}
      `
    return html
  };

  function buildHTML_expense_table(data){
    var html = 
      `<tr>
        <th class="item">項目</th>
        <th class="cf-text">キャッシュフロー</th>
       </tr>
       ${data.expenses}
      `
    return html
  };

  $('.m-area').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
    }).done(function(data){
      var html_when = buildHTML_when(data);
      var html_edit = buildHTML_edit(data);
      var html_totalin = buildHTML_totalin(data);
      var html_totalex = buildHTML_totalex(data);
      var html_income_table = buildHTML_income_table(data);
      var html_expense_table = buildHTML_expense_table(data);

      $('.when').empty().append(html_when);
      $('.edit__btn').empty().append(html_edit);
      $('#total_income').empty().append(html_totalin);
      $('#total_expense').empty().append(html_totalex);
      $('#income-table').empty().append(html_income_table);
      $('#expense-table').empty().append(html_expense_table);

      console.log(html_edit);
      })
  });
});