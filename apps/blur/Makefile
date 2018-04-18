include ../support/Makefile.inc

all: $(BIN)/test

$(BIN)/halide_blur.generator: halide_blur_generator.cpp $(GENERATOR_DEPS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -fno-rtti $(filter-out %.h,$^) -o $@ $(LDFLAGS) $(HALIDE_SYSTEM_LDFLAGS)

$(BIN)/%/halide_blur.a: $(BIN)/halide_blur.generator
	@mkdir -p $(@D)
	$^ -g halide_blur -o $(BIN)/$* target=$(HL_TARGET)

$(BIN)/%/halide_blur_viz.a: $(BIN)/halide_blur.generator
	@mkdir -p $(@D)
	$^ -g halide_blur -o $(BIN)/$* target=$(HL_TARGET)-trace_loads-trace_stores-trace_realizations

# g++ on OS X might actually be system clang without openmp
CXX_VERSION=$(shell $(CXX) --version)
ifeq (,$(findstring clang,$(CXX_VERSION)))
OPENMP_FLAGS=-fopenmp
else
OPENMP_FLAGS=
endif

# -O2 is faster than -O3 for this app (O3 unrolls too much)
$(BIN)/%/test: $(BIN)/%/halide_blur.a test.cpp
	@mkdir -p $(@D)
	$(CXX-$*) $(CXXFLAGS-$*) $(OPENMP_FLAGS) -Wall -O2 -I$(BIN)/$* test.cpp $(BIN)/$*/halide_blur.a -o $@ $(LDFLAGS-$*)

# -O2 is faster than -O3 for this app (O3 unrolls too much)
$(BIN)/%/test_viz: $(BIN)/%/halide_blur_viz.a test.cpp
	@mkdir -p $(@D)
	$(CXX-$*) $(CXXFLAGS-$*) $(OPENMP_FLAGS) -Wall -O2 -I$(BIN)/$* test.cpp $(BIN)/$*/halide_blur.a -o $@ $(LDFLAGS-$*)

clean:
	rm -rf $(BIN)

test: $(BIN)/host/test
	$(BIN)/host/test

../../bin/HalideTraceViz: ../../util/HalideTraceViz.cpp
	$(MAKE) -C ../../ bin/HalideTraceViz

$(BIN)/viz_auto.mp4: $(BIN)/host/test ../support/viz_auto.sh ../../bin/HalideTraceViz
	@mkdir -p $(@D)
	bash ../support/viz_auto.sh "$(BIN)/host/test --small" ../../bin/HalideTraceViz $@

viz_auto: $(BIN)/viz_auto.mp4
	mplayer $^
