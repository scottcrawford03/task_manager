// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $('.title-sort').hide();
  $('.description-sort').hide();
  $('.date-sort').hide();

  $("#text_box").keyup(function() {
    $('.task').hide().filter(function() {
      var itemText = $(this).text().toLowerCase();
      var searchText = $("#text_box").val().toLowerCase();
      var filterMatch = itemText.indexOf(searchText) != -1;
      return filterMatch;
    }).show();
  });

  $(".archive-task-list").click(function(e){
    e.preventDefault();
    var id = $(this).parents("li").attr("id");
    archiveTaskList(id, this);
  });

  $(".delete-task-list").click(function(e){
    e.preventDefault;
    var id = $(this).parents("li").attr("id");
    deleteTaskList(id, this);
  });

  $(".delete-task").click(function(e) {
    e.preventDefault();
    deleteTask(this);
  });

  $(".complete-task").click(function(e) {
    e.preventDefault();
    var id = $(this).parents("div").attr("id");
    completeTask(id, this);
  });

  $(".incomplete-task").click(function(e) {
    e.preventDefault();
    var id = $(this).parents("div").attr("id");
    completeTask(id, this);
  });

  $('.all-tasks-button').click(function(e){
    e.preventDefault();
    $('.all-tasks').show();
    $('.title-sort').hide();
    $('.description-sort').hide();
    $('.date-sort').hide();
  });

  $('.title-sort-button').click(function(e){
    e.preventDefault();
    $('.all-tasks').hide();
    $('.title-sort').show();
    $('.description-sort').hide();
    $('.date-sort').hide();
  });

  $('.description-sort-button').click(function(e){
    e.preventDefault();
    $('.all-tasks').hide();
    $('.title-sort').hide();
    $('.description-sort').show();
    $('.date-sort').hide();
  });

  $('.date-sort-button').click(function(e){
    e.preventDefault();
    $('.all-tasks').hide();
    $('.title-sort').hide();
    $('.description-sort').hide();
    $('.date-sort').show();
  });
});

function completeTask(id, button) {
  $.ajax({
    method: "PUT",
    url: "/complete_task/" + id,
    data: {id: id},
    success: function() {
      updateTask(button);
    },
    error: function() {
             alert("Task could not be completed at this time");
           }
  });
};

function updateTask(button) {
  $(button).closest('div').remove()
};

function deleteTask(button) {
  var id = $(button).parents('div').attr('id');
  $.ajax({
    method: "DELETE",
    url: "/delete_task/" + id,
    data: {id: id},
    success: function() {
      deletedTask(button);
    },
    error: function() {
             alert("Task could not be deleted at this time");
           }
  });
}

function deletedTask(button) {
  $(button).closest("div").remove()
};

function deleteTaskList(id, button) {
  $.ajax({
    method: "DELETE",
    url: "/archive_task_list/" + id,
    data: {id: id},
    success: function() {
      deletedFromTaskList(button);
    },
    error: function() {
             alert("TaskList could not be deleted at this time");
           }
  });
}

function deletedFromTaskList(button){
  $(button).parent("li").remove()
}

function archiveTaskList(id, button) {
  $.ajax({
    method: "PUT",
  url: "/archive_task_list/" + id,
  data: {id: id},
  success: function() {
    removedFromTaskList(button);
  },
  error: function() {
           alert("TaskList could not be archived at this time");
         }
  });
}

function removedFromTaskList(button) {
  $(button).parent("li").remove()
};
