$(document).ready(function() {
  var elementExists = document.getElementById("table_search");
    if(elementExists){
      $('#table_search').DataTable();
      $('#table_search_filter').css("margin-bottom","10px")
      $('#table_search_previous').css("margin-bottom","10px")
    }
} )
