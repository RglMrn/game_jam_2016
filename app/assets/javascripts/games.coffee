# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

colorBrown = '#795548'
colorLightBrown = '#A1887F'
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

    Crafty.background(colorLightBrown)

    Crafty.e('Lane, 2D, Canvas, Color, Button')
    .attr({x: firstLaneXCoordinate, y: laneTopMargin, w: laneWidth, h: laneHeight})
    .color(colorBrown)
    .bind('Click', lane1Clicked)

    Crafty.e('Lane, 2D, Canvas, Color')
    .attr({x: secondLaneXCoordinate, y: laneTopMargin, w: laneWidth, h: laneHeight})
    .color(colorBrown)

    Crafty.e('Lane, 2D, Canvas, Color')
    .attr({x: thirdLaneXCoordinate, y: laneTopMargin, w: laneWidth, h: laneHeight})
    .color(colorBrown)
  )

  lane1Clicked = ->
    alert('clicked', MouseEvent)
