import cv2
from matplotlib import pyplot as plt

# imread the images and turn them to gray
img_path1 = 'img3.jpg'
img_path2 = 'img5.jpg'
i1 = cv2.imread(img_path1)
i2 = cv2.imread(img_path2)
img1 = cv2.cvtColor(i1, cv2.COLOR_BGR2GRAY)
img2 = cv2.cvtColor(i2, cv2.COLOR_BGR2GRAY)

# create the sift class
sift = cv2.xfeatures2d.SIFT_create()

kp = sift.detect(img1,None)

img1 = cv2.drawKeypoints(img1,kp,img1)
cv2.imshow('img', img1)
cv2.waitKey(0)
