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
  $(".archive-task-list").click(function(e){
    e.preventDefault();
    var id = $(this).parent("li").attr("id");
    archiveTaskList(id, this);
  });

  $(".delete-task-list").click(function(e){
    e.preventDefault;
    var id = $(this).parent("li").attr("id");
    deleteTaskList(id, this);
  });

  $(".delete-task").click(function(e) {
    e.preventDefault();
    var id = $(this).parent("div").attr("id");
    deleteTask(id, this);
  });

  $(".complete-task").click(function(e) {
    e.preventDefault();
    var id = $(this).parent("div").attr("id");
    completeTask(id, this);
  });
});

function completeTask(id, button) {
  $.ajax({
    method: "PUT",
    url: "/complete_task/" + id,
    data: {id: id},
    success: function() {
      alert("Task is Complete");
      updateTask(button);
    },
    error: function() {
             alert("Task could not be completed at this time");
           }
  }); 
};

function updateTask(button) {
  $(button).parents('div').remove()
};

function deleteTask(id, button) {
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
  $(button).parent("div").remove()
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

