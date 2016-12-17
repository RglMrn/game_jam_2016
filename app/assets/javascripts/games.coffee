# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.onload = () ->
  Crafty.init();
  player = Crafty.e("2D, Canvas, Color, Fourway")
    .attr({x: 100, y: 100, w: 50, h: 50})
    .color("blue")
    .fourway(200);
