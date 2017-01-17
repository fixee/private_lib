include make.vars

SUBDIRS=src

all:
	for dir in $(SUBDIRS); do \
		echo "make in $$dir"; \
		make -C $$dir;  \
	done
	@mkdir -p deps/private/lib
	@mkdir -p deps/private/include
	@cp src/libprivate.a deps/private/lib
	@cp -r include deps/private/

clean:
	for dir in $(SUBDIRS); do \
		echo "make clean in $$dir"; \
		make -C $$dir clean;  \
	done
	@echo "rm -rf deps/private"
	@rm -rf deps/private
