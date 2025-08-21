.PHONY: setup test

test:
	@echo "Running tests..."
	@for test in tests/test-*.rkt; do \
		echo "Running $$test..."; \
		racket "$$test"; \
	done
