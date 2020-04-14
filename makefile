.DEFAULT_GOAL := help
PROJECTNAME=$(shell basename "$(PWD)")
SOURCES=$(sort $(wildcard ./src/*.rs ./src/**/*.rs))

SHELL := /bin/bash

# ##############################################################################
# # GENERAL
# ##############################################################################

.PHONY: help
help: makefile
	@echo
	@echo " Available actions in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## init: Install missing dependencies.
.PHONY: init
init:
	rustup target add wasm32-unknown-unknown
	curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

## :

# ##############################################################################
# # RECIPES
# ##############################################################################

## all: Compile all targets
all: wasm-node wasm-web

## wasm-node: Compile the wasm module for NodeJS
wasm-node: pkg-node/dvote_wasm_bg.wasm

## wasm-web: Compile the wasm module for web browsers
wasm-web: pkg-web/dvote_wasm_bg.wasm

pkg-node/dvote_wasm_bg.wasm: $(SOURCES) Cargo.toml
	wasm-pack build --target nodejs --out-dir pkg-node

pkg-web/dvote_wasm_bg.wasm: $(SOURCES) Cargo.toml
	wasm-pack build --out-dir pkg-web

## :

# ##############################################################################
# # OTHER
# ##############################################################################

## clean:
.PHONY: clean
clean:
	cargo clean
	rm -R pkg-node pkg-web

## test:
.PHONY: test
test:
	cargo test
