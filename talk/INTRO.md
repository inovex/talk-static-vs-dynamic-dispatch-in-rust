# Intro - Static vs dynamic dispatch in rust

Dynamic dispatch:

> In computer science, dynamic dispatch is the process of selecting which
> implementation of a polymorphic operation (method or function) to call at run
> time. It is commonly employed in, and considered a prime characteristic of,
> object-oriented programming (OOP) languages and systems.[1]
>
> https://en.wikipedia.org/wiki/Dynamic_dispatch

Static dispatch:

> In computing, static dispatch is a form of polymorphism fully resolved during
> compile time. It is a form of method dispatch, which describes how a language
> or environment will select which implementation of a method or function to
> use.[1]
>
> https://en.wikipedia.org/wiki/Static_dispatch


Key point: Two implementation variants of polymorphism!










# Languages that have dynamic and static dispatch?

Both: rust, C++

Only dynamic dispatch: Java, kotlin, python, perl, go, ...

Quiz question for later:

> Does C has dynamic and/or static dispatch.

























# General Notes:

Compiler versions

    $ rustc --version
    rustc 1.73.0 (cc66ad468 2023-10-03)

    $ gcc --version
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0

Compiled without optimizations:

Otherwise the compilers aggressively inlines the small functions and the
assemble become hard to read.
