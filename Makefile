image_name = pthomison/cicd-tools
image_tag = latest

build:
	docker build . -t $(image_name):$(image_tag)

shell: build
	docker run -it --rm $(image_name):$(image_tag) /bin/bash

push:
	docker push $(image_name):$(image_tag)