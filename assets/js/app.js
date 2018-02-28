// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import $ from "jquery";
// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
//
// Based off of Lecture notes on AJAX for the microblog
function update_buttons() {
  $('.add-time-block').each( (_, bb) => {
    let task_id = $(bb).data('task_id');
    let time_start = $(bb).data('time-start');
    if (time_start == "hello") {
      $(bb).text("Start Time");
    }
    else {
      $(bb).text("End Time");
    }
  });
}

function set_button(task_id, value) {
  $('.add-time-block').each( (_, bb) => {
    if (task_id == $(bb).data('task-id')) {
      $(bb).data('time-start', value);
    }
  });
  update_buttons();
}

function start_timer(task_id) {
  let time = new Date();
  set_button(task_id, time);
}

function end_timer(task_id, time) {
    let text = JSON.stringify({
    time_block: {
        end_time: new Date(),
        start_time: time,
        task_id: task_id
      },
  });
  $.ajax(timeblock_path, {
    method: "post",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text,
    success: (resp) => { set_button(task_id, "hello"); },
  });
}

function follow_click(ev) {
  let btn = $(ev.target);
  let start_time = btn.data('time-start');
  let task_id = btn.data('task-id');

  if (start_time != "hello") {
    end_timer(task_id, start_time);
  }
  else {
    start_timer(task_id);
  }
}

function init_follow() {
  if (!$('.add-time-block')) {
    return;
  }

  $(".add-time-block").click(follow_click);

  update_buttons();
}

$(init_follow);
