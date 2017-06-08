# lua-vips-bench

This benchmarks the [`lua-vips`](https://github.com/jcupitt/lua-vips)
image processing module against
[`magick`](http://luarocks.org/modules/leafo/magick).

The test is a very simple one: 

* Load a 5,000 x 5,000 pixel JPEG image.
* Crop 100 pixels from every edge.
* Shrink by 10% using lanczos2 interpolator.
* Sharpen with sigma 1
* Save back as a new JPEG image. 

This is not a complex test, but it is easy to implement and does exercise image
load, save, resample and filter.

### Results

Run on 1/6/17 with libvips 8.5 and imagemagick 6.9.7-4, and magick-1.3.0-1 and
lua-vips 0.1-1 on a two core (four thread) laptop.

```
$ ./runner 
building test image ...
tile=10
test image is 5000 by 5000 pixels
make jpeg derivatives ...
timing ./magick.lua ... done
timing ./vips.lua ... done
measuring memuse for ./magick.lua ... done
measuring memuse for ./vips.lua ... done

real time in seconds, fastest of three runs
benchmark	jpeg
vips.lua	0.69	
magick.lua	5.20	

peak memory use in KB
benchmark	peak RSS
vips.lua	49816
magick.lua	496908
```

So on this test and on this laptop, lua-vips is 7.5x faster and needs 10x less
memory. 

### Preparation

For `lua-vips` it's:

	sudo apt-get install libvips42
	luarocks install lua-vips

For `magick`, you need: 

	sudo apt-get install libmagickwand-dev
	luarocks install magick 

