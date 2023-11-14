# SPDX-FileCopyrightText: Copyright (c) 2023 inovex GmbH
# SPDX-License-Identifier: MIT

TARGETS = main-cpp main-rust dis-cpp dis-rust

all: $(TARGETS)

# NOTE: Do not compile with '-O2 (c++)' or '-C opt-level=2' (rust).
# Both compilers aggressively inline the function calls to small functions. You
# won't see the actual function calls anymore.

# Optimization flag to try: -O2
main-cpp: main.cpp
	g++ -std=c++17 -g -frtti $< -o $@

# Optimization flag to try: -C opt-level=2
main-rust: main.rs
	rustc -g $< -o $@

.PHONY:
nm: main-cpp main-rust
	@echo cpp '(unmangled symbols)':
	nm -C main-cpp | grep -i get_double
	@echo
	@echo cpp '(mangled symbols)':
	nm  main-cpp | grep -i get_double
	@echo
	@echo 'rust (unmangled symbols):'
	nm -C main-rust | grep -i get_double
	@echo
	@echo 'rust (mangled symbols):'
	nm main-rust | grep -i get_double


RUST_FUNCS = \
	_ZN4main22get_double_area_static17hc62f75f81ef8d34eE \
	_ZN4main22get_double_area_static17hdd9e8eb38f63af2bE \
	_ZN4main23get_double_area_dynamic17h70b77052bfb5deafE

CPP_FUNCS = \
	_Z22get_double_area_staticI4RectEfRKT_ \
	_Z22get_double_area_staticI6CircleEfRKT_ \
	_Z23get_double_area_dynamicRK5Shape

dis-cpp.all: main-cpp
	objdump -M intel -D -j .text $<; \

dis-cpp: main-cpp
	for fun in $(CPP_FUNCS); do  \
		objdump -M intel --disassemble=$$fun -j .text $<; \
	done > $@

dis-rust: main-rust
	for fun in $(RUST_FUNCS); do  \
		objdump -M intel --disassemble=$$fun -j .text $<; \
	done > $@

.PHONY: format
format:
	clang-format -i main.cpp

.PHONY: clean
clean:
	rm -f $(TARGETS)
