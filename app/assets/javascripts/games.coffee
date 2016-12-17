# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

crStage = ''

window.onload = () ->
  initGameVariables()
  Crafty.init(crStage.width())
  defineCraftyScenes()
  Crafty.enterScene("game_start")

initGameVariables = ->
  crStage = $('#cr-stage')

defineCraftyScenes = ->
  Crafty.defineScene("game_start", () ->
    laneLeftMargin = 50
    firstLaneXCoordinate = laneLeftMargin
    secondLaneXCoordinate = laneLeftMargin + (crStage.width() * .33)
    thirdLaneXCoordinate = laneLeftMargin + (crStage.width() * .66)

    Crafty.background("#000")

    Crafty.e('Lane, 2D, Canvas, Color')
      .attr({x: firstLaneXCoordinate, y: 100, w: 30, h: 200})
      .color('green');

    Crafty.e('Lane, 2D, Canvas, Color')
    .attr({x: secondLaneXCoordinate, y: 100, w: 30, h: 200})
    .color('green');

    Crafty.e('Lane, 2D, Canvas, Color')
    .attr({x: thirdLaneXCoordinate, y: 100, w: 30, h: 200})
    .color('green');

    player = Crafty.e("2D, Canvas, Color, Fourway")
      .attr({x: 100, y: 100, w: 50, h: 50})
      .color("blue")
      .fourway(200)
  )

