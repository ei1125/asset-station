$(function(){
  let forms = $(".lay-line2")
  function tabSwitch2() {
    $(".active").removeClass("active");
    $(this).find(".lay-submit2").addClass("active");
  }
  forms.click(tabSwitch2);
});