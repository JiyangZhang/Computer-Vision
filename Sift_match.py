import cv2
import numpy as np
from matplotlib import pyplot as plt

# imread the images and turn them to gray
img_path1 = '51.jpg'
img_path2 = '52.jpg'
i1 = cv2.imread(img_path1)
i2 = cv2.imread(img_path2)
img1 = cv2.cvtColor(i1, cv2.COLOR_BGR2GRAY)
img2 = cv2.cvtColor(i2, cv2.COLOR_BGR2GRAY)

# create the sift class
sift = cv2.xfeatures2d.SIFT_create()

# detect the descriptors
kp1, des1 = sift.detectAndCompute(img1, None)
kp2, des2 = sift.detectAndCompute(img2, None)

bf = cv2.BFMatcher()
matches = bf.knnMatch(des1,des2, k=2)


# Apply ratio test
good = []
for m,n in matches:
    if m.distance < 0.75*n.distance:
        good.append([m])

l = []
for i in good:
    l.append(i[0])

#good6 = sorted(l, key = lambda x:x.distance)
'''
mm = []
for i in good6[:10]:
    mm.append([i])
'''
# cv2.drawMatchesKnn expects list of lists as matches.
img2 = cv2.drawMatchesKnn(img1,kp1,img2,kp2,good,img2,flags=2)

plt.imshow(img2),plt.show()

