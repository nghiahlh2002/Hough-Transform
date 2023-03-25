# import numpy as np
# import cv2
# import matplotlib.pyplot as plt

# # Load the image
# img = cv2.imread('image.jpg')

# # Convert the image to grayscale
# gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# # Apply a Gaussian blur
# blur = cv2.GaussianBlur(gray, (5, 5), 0)

# # Apply Canny edge detection
# edges = cv2.Canny(blur, 100, 200)

# # Display the edge representation matrix
# plt.imshow(edges, cmap='gray')
# plt.show()
import cv2
import numpy as np

# Load the image
img = cv2.imread('image1.jpg', cv2.IMREAD_GRAYSCALE)

# Apply Gaussian blur to the image
img_blur = cv2.GaussianBlur(img, (5, 5), 0)

# Apply Canny edge detection to the blurred image
edges = cv2.Canny(img_blur, 100, 200)

# Invert the colors of the edge representation matrix
edges = cv2.bitwise_not(edges)

# Normalize the values of the edge representation matrix to 0 and 1
edges = edges / 255

# Save the edge representation matrix as a .txt file
np.savetxt('edges.txt', edges, fmt='%d')

# Display the edge representation matrix
cv2.imshow('Edges', edges)
cv2.waitKey(0)
cv2.destroyAllWindows()
