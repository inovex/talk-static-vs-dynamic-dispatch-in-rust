# Static vs dynamic dispatch

The same from the functional perspective, but different implementations:

    runtime vs binary size trade off


# Rust vs C++

dynamic dispatch (`dyn` and virtual functions)

* rust allows multiple traits with the '+' operator
* in C++ you can only a single interface/abstract class as a function parameter
   * If you want more, you first have to create an auxiliary class

static dispatch (`impl` and template functions)

* rust has a very regular syntax
* rust and C++ supports multiple traits/"interfaces", but
* rust is explicit about traits, C++ does ducktyping


# Quiz question

What about the C programming language:

* Does C have static dispatch?
* Does C have dynamic dispatch?























# Thanks!

Time for questions!


# Code of this talk

The source code is available in the git repo:

    https://github.com/inovex/talk-static-vs-dynamic-dispatch-in-rust
