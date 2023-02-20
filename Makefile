image_name = pthomison/cicd-tools
image_tag = latest

build:
	docker build . -t $(image_name):$(image_tag) --no-cache

build-w-cache:
	docker build . -t $(image_name):$(image_tag)

shell: 
	docker run -it --rm $(image_name):$(image_tag) /bin/bash

push:
	docker push $(image_name):$(image_tag)