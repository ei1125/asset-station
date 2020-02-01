$(function() {

  $(".popup_help").mouseover(function() {
    // 「?」にマウスが重なった場合の処理です。

    // ヘルプウィンドウのトップマージンを定義します。
    // 0だと「?」と上端が揃います。
    var marginTop = 0;

    // ヘルプウィンドウのレフトマージンを定義します。
    // 0だと「?」と左端が揃います。
    var marginLeft = 20;

    // ヘルプウィンドウ表示させる際のスピードを定義します。
    var speed = 300;

    // ヘルプウィンドウのオブジェクトを取得します。
    var popupObj = $(".popup_help_window");

    if (!popupObj.length) {
      // ウィンドウがなければ作成します。
      popupObj = $("<p/>").addClass("popup_help_window").appendTo($("body"));
    }

    // ウィンドウにメッセージを設定します。
    popupObj.text($(this).attr("data-message"));

    // ウィンドウのオフセットを計算します。
    var offsetTop = $(this).offset().top + marginTop;
    var offsetLeft = $(this).offset().left + marginLeft;

    // ウィンドウの位置を整え、表示します。
    popupObj.css({
      "top": offsetTop,
      "left": offsetLeft
    }).show(speed);

  }).mouseout(function() {
    // 「?」からマウスが離れた場合、テキストを空にしてウィンドウを隠します。
    $(".popup_help_window").text("").hide("fast");
  });

})