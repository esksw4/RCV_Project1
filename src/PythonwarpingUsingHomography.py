from PIL import Image as Img
from pylab import ginput, plot
import homography
import numpy as ny
import scipy
import matplotlib.pyplot as pplot

faceImg = ny.asarray(Img.open('IMG_0519.png').convert('L'))
billImg = ny.asarray(Img.open('billboard.png').convert('L'))

pplot.figure(1)
pplot.imshow(faceImg)
facePts = ny.asarray(pplot.ginput(4)).T

pplot.figure(2)
pplot.imshow(billImg)
billPts = ny.asarray(pplot.ginput(4)).T

pplot.show();

H = homography.H_from_from_point(facePts,billPts)
print('Homography Matrix')
print(H)

