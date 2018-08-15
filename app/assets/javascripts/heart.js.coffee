jQuery ->
  class HeartEvent
    findHeartElement: ->
      $('.heart-container').find('.heart')

    setupEventHandler: ->
      @findHeartElement().click ->
        $(this).toggleClass("is-active")

  new HeartEvent().setupEventHandler()

