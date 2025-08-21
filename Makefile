.PHONY: setup test

test:
	@echo "Running tests..."
	@racket test-compiler.rkt
	@racket test-string-utils.rkt
