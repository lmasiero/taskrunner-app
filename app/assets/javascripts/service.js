
$(document).ready(function() {
     $("#new_service").on("ajax:success", function (e, data, status, xhr){
      var div1 = $("<div>").addClass("item")
      var div2 = $("<div>").addClass("right floated content")
      var div3 = $("<div>").addClass("ui button delete_service")
      var button = $(div3).append('<a rel="nofollow" data-method="delete" href="/professionals/'+data.pro_id+'/services/'+data.ser_id+'">Remove</a>')
      var right = $(div2).append(button)
      var icon = $("<i>").addClass("pin icon")
      var div4 = $("<div>").addClass("content")
      var left = $(div4).append(e.target[1].value)
      var inner = $(left).append(right)
      var inner2 = $(inner).append(icon)
      var item = $(div1).append(inner2)
      $(item).appendTo("#add_service")

      $(".delete_service").on('click', function(){
        $(this).parent().parent().remove()
      })
    })

    $(".delete_service").on('click', function(){
      $(this).parent().parent().remove()
    })
  })


  // <div class="item">
  //   <div class="right floated content">
  //     <div class="ui button delete_service"><%= link_to "Remove", professional_service_path(@professional,service), method: :delete %></div>
  //   </div>
  //   <i class="pin icon"></i>
  //   <div class="content">
  //     <%= service.name %>
  //   </div>
  // </div>
