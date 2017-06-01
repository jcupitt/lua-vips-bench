#!/usr/bin/luajit 

local vips = require("vips")

image = vips.Image.new_from_file(arg[1], {access = "sequential"})

image = image:crop(100, 100, image:width() - 200, image:height() - 200)

image = image:resize(0.9, {kernel = "lanczos2"})

image = 2 * image - image:gaussblur(1)

image:write_to_file(arg[2]);

