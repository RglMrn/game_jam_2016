# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.onload = () ->
  Crafty.init()
  Crafty.enterScene("game_start")

Crafty.defineScene("game_start", () ->
  Crafty.background("#000")

  Crafty.e("2D, DOM, Text")
    .attr({ w: 100, h: 20, x: 150, y: 120 })
    .text("Loading")
    .css({ "text-align": "center"})
    .textColor("#FFFFFF")

  player = Crafty.e("2D, Canvas, Color, Fourway")
  .attr({x: 100, y: 100, w: 50, h: 50})
  .color("blue")
  .fourway(200)
)


