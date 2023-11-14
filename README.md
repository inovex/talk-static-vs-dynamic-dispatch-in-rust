# Talk - Static vs dynamic dispatch in rust

This repo contains the contents of my talk about static and dynamic dispatch in
rust. These are two different implementation of
[polymorphism](https://en.wikipedia.org/wiki/Polymorphism_(computer_science)
in programming language.


## Contents of the talk

The talk is done without slides, just with a terminal.  It walks trough the
following files and commands:

* [INTRO.md](talk/INTRO.md)
* [main.rs](main.rs)
* `./main-rust`
* [main.cpp](main.cpp)
* `./main-cpp`
* `make nm`
* [dis-cpp](dis-cpp)
* [dis-rust](dis-rust)
* [OUTRO.md](talk/OUTRO.md)


## Further reading

Some general notes:

* [SO: How do you declare an interface in Rust?](https://stackoverflow.com/questions/45633269/how-do-you-declare-an-interface-in-rust)
* [Medium: dyn , impl and Trait Objects — Rust](https://cotigao.medium.com/dyn-impl-and-trait-objects-rust-fd7280521bea)
* [users.rust-lang:Difference between returning dyn Box<Trait> and impl Trait](https://users.rust-lang.org/t/difference-between-returning-dyn-box-trait-and-impl-trait/57640)

More about trait objects:

* [SO: What makes something a "trait object"?](https://stackoverflow.com/questions/27567849/what-makes-something-a-trait-object)

## License

The code is licensed under the [MIT License](./LICENSE).
