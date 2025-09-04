/*
 * This is for Effect/Custom Operations on RealWorld Cursor Editor
 */

var img = Document.RasterImage;
var w = img.sizeX
var h = img.sizeY;

for (var y = 0; y < h; y++) {
  for (var x = 0; x < w; x++) {
    var argb = img.GetPixel(x, y, 0, 0);

    var a = (argb >>> 24) & 0xFF;
    if (a === 0) continue;

    var r = (argb >>> 16) & 0xFF;
    var g = (argb >>>  8) & 0xFF;
    var b =  argb         & 0xFF;

    r = 255 - r;
    g = 255 - g;
    b = 255 - b;

    var newARGB = (a << 24) | (r << 16) | (g << 8) | b;
    img.SetPixel(x, y, 0, 0, newARGB);
  }
}
