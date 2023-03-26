BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

build:
	vsce package

publish:
	vsce publish minor

all: push build cleanup publish

cleanup:
	rm ./build/*.vsix
	mv *.vsix ./build/ || true

push:
	git add .
	git commit -m "update"
	git push origin $(BRANCH)

push!:
	git push origin $(BRANCH) --force

open:
	open https://marketplace.visualstudio.com/manage/publishers/nemytchenko/extensions/modernmaketheme/hub?_a=acquisition
	open https://marketplace.visualstudio.com/items?itemName=nemytchenko.modernmaketheme

publisher:
	open https://dev.azure.com/nemytchenko/

howto:
	open https://code.visualstudio.com/api/working-with-extensions/publishing-extension

generate:
	open https://coder-coder.com/vs-code-theme-color-generator/

.PHONY: build