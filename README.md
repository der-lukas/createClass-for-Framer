# createClass for Framer

Create classes based on imported layers. This version includes descendants while preserving their family structure.
Furthermore, all Sketch text-layers are converted to Framer textLayers.

For documentation on the textLayer-module, check out this repo: https://github.com/awt2542/textLayer-for-Framer

#### Setup

This version depends on this textLayer-module (https://github.com/awt2542/textLayer-for-Framer), so you need to download it and put it in your projects "modules"-folder as well as this module. 

#### Usage
```coffeescript
{createClass} = require 'createClassModule'
sketch = Framer.Importer.load("imported/list-class@2x")


Row = createClass(sketch.row)

for i in [0..10]
    item = new Row {y: 200*i}
    item.avatar.borderRadius = "50%"
    item.avatar.image = "http://fillmurray.com/100/100"
```

To delete the layer after storing it as a class, pass the *true* argument.

````coffeescript
Row = createClass(sketch.row, true)
````
