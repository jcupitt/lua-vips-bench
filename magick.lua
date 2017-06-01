#!/usr/bin/luajit 

local magick = require("magick")

image = magick.load_image(arg[1])

image:crop(image:get_width() - 200, image:get_height() - 200, 100, 100)

-- this will use lanczos2
image:resize(image:get_width() * 0.9, image:get_height() * 0.9)

-- gaussblur with radius 1
image:sharpen(1, 0)

image:write(arg[2]);

image:destroy()

