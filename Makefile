build:
	vsce package

publish:
	vsce publish minor

all: build publish push

push:
	git add .
	git commit -m "update"
	git push