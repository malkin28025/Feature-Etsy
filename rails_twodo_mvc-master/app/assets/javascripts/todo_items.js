$(document).ready(function(){
  //I'd like to have that checkbox for completeness submit the form
  //when it gets checked
  $('ul').on('change', '.toggle', function(){
    $(this).parent('form').submit();
    //I'd also like to change the class="completed" on the li
    $(this).closest('li').toggleClass('completed');
    //the li I want is...the ancestor of the check box that got clicked
  });
  $("#toggle-all").on('change', function(){
    $(this).parent('form').submit();
  })
  // I'd like to have a double-click event for labels
  $('ul').on('dblclick', 'label', function(){
    //I need a class of 'editing' set on the li
    $(this).closest('li').addClass('editing');
  });

  $("#filters a").click(function(){
    $("#filters a").removeClass('selected');
    $(this).addClass('selected');
  })
  $("#all").click(function(){
    $('#todo-list li').show();
  });
  $("#active").click(function(){
    $('#todo-list li').not('.completed').show();
    $('#todo-list li.completed').hide();
  });
  $("#complete").click(function(){
    $('#todo-list li.completed').show();
    $('#todo-list li').not('.completed').hide();
  });
  // check updates of a list element
  // if the name param has a length of 0, destroy the todo item
  // otherwise, submit normally
  $(".edit_todo_item").submit(function(){
    var text_box = $(this).find('input[type="text"]');
    if(text_box.length > 0 && text_box.val().length === 0){
      // submit the form to the destroy method
      // so I need to pretend to have a delete method
      // with the input _method = 'delete'
      $(this).find('input[name="_method"]').val('delete');
      console.log('this has an input with a length of 0');
    }
  });
});