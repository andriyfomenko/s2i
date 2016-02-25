
IMAGE_NAME = nodehapi

build:
	s2i build https://github.com/andriyfomenko/s2i-nodehapi.git node:argon $(IMAGE_NAME) 
