updateos:
	sudo apt update -y && sudo apt upgrade -y

install:
	# install html linter 
	sudo apt install tidy -y 

	# install Dockerfile linter
	wget -O hadolint https://github.com/hadolint/hadolint/releases/download/v1.18.0/hadolint-Linux-x86_64
	chmod +x ./hadolint
	sudo mv ./hadolint /usr/local/bin/hadolint
	
	# installing docker 
	curl https://get.docker.com/ | sh
	
	# installing kubectl 
	curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl
	kubectl version --client

lint:
	# linter for html files
	tidy -q -e ./project-src/blue/html/*.html
	tidy -q -e ./project-src/green/html/*.html
	
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint ./project-src/blue/Dockerfile
	hadolint ./project-src/green/Dockerfile

all: install lint 