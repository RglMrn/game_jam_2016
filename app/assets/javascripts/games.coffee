# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

colorBrown = '#795548'
colorLightBlue = '#3498db'

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
    laneLeftMargin = 5
    laneTopMargin = 5
    laneWidth = crStage.width() / 3 - 10
    laneHeight = crStage.height() - 10
    firstLaneXCoordinate = laneLeftMargin
    secondLaneXCoordinate = laneLeftMargin + (crStage.width() * .33)
    thirdLaneXCoordinate = laneLeftMargin + (crStage.width() * .66)

    Crafty.background(colorLightBlue)

    Crafty.e('Lane, 2D, Canvas, Color')
      .attr({x: firstLaneXCoordinate, y: laneTopMargin, w: laneWidth, h: 200})
      .color(colorBrown);

    Crafty.e('Lane, 2D, Canvas, Color')
    .attr({x: secondLaneXCoordinate, y: laneTopMargin, w: laneWidth, h: 200})
    .color(colorBrown);

    Crafty.e('Lane, 2D, Canvas, Color')
    .attr({x: thirdLaneXCoordinate, y: laneTopMargin, w: laneWidth, h: 200})
    .color(colorBrown);

    player = Crafty.e("2D, Canvas, Color, Fourway")
      .attr({x: 100, y: 100, w: 50, h: 50})
      .color("blue")
      .fourway(200)
  )

