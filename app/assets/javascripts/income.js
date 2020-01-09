$(function(){
  
  function buildHTML_i(income){
    var html = 
      `<li>
        ${income.item}
        <a class="i-icon" rel="nofollow" data-method="delete" href="/years/${income.year_id}/months/${income.month_id}/incomes/${income.id}">
        <i class="fas fa-ban"></i>
        </a>
       </li>`
    return html
  };

  function buildHTML_e(income){
    var html = 
      `<li>
        ${income.item}
        <a class="i-icon" rel="nofollow" data-method="delete" href="/years/${income.year_id}/months/${income.month_id}/expenses/${income.id}">
        <i class="fas fa-ban"></i>
        </a>
       </li>`
    return html
  };

  function buildHTML_a(income){
    var html = 
      `<li>
        ${income.item}
        <a class="i-icon" rel="nofollow" data-method="delete" href="/years/${income.year_id}/months/${income.month_id}/assets/${income.id}">
        <i class="fas fa-ban"></i>
        </a>
       </li>`
    return html
  };

  function buildHTML_d(income){
    var html = 
      `<li>
        ${income.item}
        <a class="i-icon" rel="nofollow" data-method="delete" href="/years/${income.year_id}/months/${income.month_id}/debts/${income.id}">
        <i class="fas fa-ban"></i>
        </a>
       </li>`
    return html
  };

  $('#new_income').on('submit', function(e){  //項目の追加
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,  //同期通信でいう『パス』
      type: 'POST',  //同期通信でいう『HTTPメソッド』
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    }).done(function(data){
      var html = buildHTML_i(data);
      $('.lay_income').append(html);      
      $('#new_income')[0].reset();
      $('.plus').prop('disabled', false);
      })
  });

  $('#new_expense').on('submit', function(e){  //項目の追加
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,  //同期通信でいう『パス』
      type: 'POST',  //同期通信でいう『HTTPメソッド』
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    }).done(function(data){
      var html = buildHTML_e(data);
      $('.lay_expense').append(html);      
      $('#new_expense')[0].reset();
      $('.plus').prop('disabled', false);
      })
  });

  $('#new_asset').on('submit', function(e){  //項目の追加
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,  //同期通信でいう『パス』
      type: 'POST',  //同期通信でいう『HTTPメソッド』
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    }).done(function(data){
      var html = buildHTML_a(data);
      $('.lay_asset').append(html);      
      $('#new_asset')[0].reset();
      $('.plus').prop('disabled', false);
      })
  });

  $('#new_debt').on('submit', function(e){  //項目の追加
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,  //同期通信でいう『パス』
      type: 'POST',  //同期通信でいう『HTTPメソッド』
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    }).done(function(data){
      var html = buildHTML_d(data);
      $('.lay_debt').append(html);      
      $('#new_debt')[0].reset();
      $('.plus').prop('disabled', false);
      })
  });

  $(document).on("click", ".i-icon", function(){
    $(this).parent().remove();
  });
  
});