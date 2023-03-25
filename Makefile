build:
	vsce package

publish:
	vsce publish minor

all: push build publish

push:
	git add .
	git commit -m "update"
	git push origin master

push!:
	git push origin master --force