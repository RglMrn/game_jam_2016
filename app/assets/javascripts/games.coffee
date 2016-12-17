# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

colorBrown = '#795548'
colorLightBrown = '#A1887F'
colorLightBlue = '#3498db'
colorGray = '#95a5a6'
colorRed = '#c0392b'
colorWhite = '#FFFFFF'
colorBlack = '#000000'

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

    Crafty.background(colorLightBrown)

    leftMargin = 5

    Crafty.e('Lane')
    .setX(leftMargin)
    .setOrder(1)

    Crafty.e('Lane')
    .setX(leftMargin + (crStage.width() * .33))
    .setOrder(2)

    Crafty.e('Lane')
    .setX(leftMargin + (crStage.width() * .66))
    .setOrder(3)

    Crafty.e('2D, DOM, Color, Button')
    .attr({x: 10, y: 10, w: 50, h: 50})
    .color(colorLightBlue)
    .bind('Click', (MouseEvent) ->
      startAllVehicles()
    )
  )

startAllVehicles = ->
  Crafty('Vehicle').trigger('StartRunning')

Crafty.c('Lane', {
  init: ->
    this.addComponent("2D, Canvas, Color, Button")
    this.y = 5
    this.x = 5
    this.w = crStage.width() / 3 - 10
    this.h = crStage.height() - 10
    this.color(colorBrown)

  events: {
    'Click': (MouseEvent) ->
      if !this.has('VehicleAdded')
        vehicleType = switch
          when this.order == 1 then 'Uber'
          when this.order == 2 then 'Metrobus'
          when this.order == 3 then 'DiabloRojo'
        Crafty.e('Vehicle')
        .setType(vehicleType)
        .place( this.x + (this.w / 2), this.h + this.y, true)
        this.addComponent('VehicleAdded');
        Crafty.log('Vehicle added in lane ' + this.order)
  }

  remove: ->
    Crafty.log('Lane was removed')

  setX: (x) ->
    this.x = x
    return this

  setOrder: (order) ->
    this.order = order
    return this
})

Crafty.c('Vehicle', {
  init: ->
    this.addComponent("2D, Canvas, Color")
    this.color(colorBrown)
    this.speedIncrement = 50
    this.speedCap = 500

  events: {
    'StartRunning': ->
      this.bind('EnterFrame', (eventData) ->
        if this.y < Crafty('Lane').get(1).h / 2
          this.destroy()
        else
          this.y -= this.speedIncrement * (eventData.dt / 1000);
          if this.speedIncrement < this.speedCap
            this.speedIncrement += this.speedIncrement
      )
  }

  remove: ->
    Crafty.log('Vehicle was removed')

  place: (x, y, subtractVehicleHeight) ->
    this.x = x - (this.w / 2)
    this.y = y
    if subtractVehicleHeight
      this.y -= this.h
    return this

  setType: (vehicleType) ->
    switch vehicleType
      when 'Uber' then this.setUberAttributes()
      when 'Metrobus' then this.setMetrobusAttributes()
      when 'DiabloRojo' then this.setDiabloRojoAttributes()
    return this

  setUberAttributes: ->
    this.color(colorBlack)
    this.w = 30
    this.h = 50

  setMetrobusAttributes: ->
    this.color(colorGray)
    this.w = 35
    this.h = 65

  setDiabloRojoAttributes: ->
    this.color(colorRed)
    this.w = 35
    this.h = 60
})