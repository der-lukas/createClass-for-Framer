exports.createClass = (layer, destroy) ->
  class Temp extends Layer
    constructor: (options={}) ->
      options.size ?= layer.size
      options.image ?= layer.image
      super options
      for subLayer in layer.descendants
        if subLayer.children.length > 0
          @parentItem = new Layer
            name: subLayer.name
            image: subLayer.image
            backgroundColor: subLayer.backgroundColor
            frame: subLayer.frame
            superLayer: @
          for child in subLayer.children
            @[child.name] = new Layer
              name: child.name
              image: child.image
              backgroundColor: child.backgroundColor
              frame: child.frame
              superLayer: @parentItem
        else if subLayer.parent is layer
          @[subLayer.name] = new Layer
            name: subLayer.name
            image: subLayer.image
            frame: subLayer.frame
            backgroundColor: subLayer.backgroundColor
            superLayer: @
    if destroy is true
      layer.destroy()