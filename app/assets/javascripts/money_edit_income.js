$(function(){
  let forms = $(".lay-line")
  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).find(".lay-submit").addClass("active");
  }
  forms.click(tabSwitch);
});