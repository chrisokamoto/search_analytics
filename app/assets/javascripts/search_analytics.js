var delayTimer;
function save_search(text) {
  clearTimeout(delayTimer);
  $(".loading").show();
  delayTimer = setTimeout(function() {
    $.ajax({
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      url: '/save_search',
      type: "POST",
      dataType: 'json',
      data: {
        article_title: $("#search_analytic_article_title").val()
      },
      success: function(data) {
        $(".loading").hide();
        $("#results").html(data);
      },
      error: function(xhr, status) {
        console.log(status);
      }
    });
  }, 2000);
}
