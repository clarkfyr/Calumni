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
//= require turbolinks
//= require semantic-ui
//= require bootstrap/dropdown
//= require bootstrap/alert
//= require bootstrap/modal
//= require_tree .
//= require sync

<
!DOCTYPE html >
  <
  head >
  <
  title > Pusher Test < /title> <
script src = "https://js.pusher.com/4.1/pusher.min.js" > < /script> <
script >

  // Enable pusher logging - don't include this in production
  Pusher.logToConsole = true;

var pusher = new Pusher('e8aa6e941d7a2e0773b2', {
  cluster: 'us2',
  encrypted: true
});

var channel = pusher.subscribe('my-channel');
channel.bind('my-event', function(data) {
  alert(data.message);
}); <
/script> < /
head >