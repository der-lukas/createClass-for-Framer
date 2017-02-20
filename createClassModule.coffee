# Require TextLayer-Module (https://github.com/awt2542/textLayer-for-Framer)
{TextLayer} = require 'TextLayer'

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
            if child._info.kind == "text"
              @[child.name] = child.convertToTextLayer()
              @[child.name].name = child.name
              @[child.name].superLayer = @parentItem
            else
              @[child.name] = new Layer
                name: child.name
                image: child.image
                backgroundColor: child.backgroundColor
                frame: child.frame
                superLayer: @parentItem
        else if subLayer.parent is layer
          if subLayer._info.kind == "text"
            @[subLayer.name] = subLayer.convertToTextLayer()
            @[subLayer.name].name = subLayer.name
            @[subLayer.name].superLayer = @
          else
            @[subLayer.name] = new Layer
              name: subLayer.name
              image: subLayer.image
              frame: subLayer.frame
              backgroundColor: subLayer.backgroundColor
              superLayer: @
    if destroy is true
      layer.destroy()
