# CSFML Bindings for Racket

This is a _complete_ FFI wrapper for [CSFML 2.5][csfml]. It also consists of few helper functions - in the same style - to simplify very common FFI code (e.g. event handling).

## Installation

Install with `raco`:

```bash
$ raco pkg install csfml
```

This should install all the CSFML dynamic libraries as well as `libsndfile` to your local Racket installation. On Windows, you'll also need to download and install [OpenAL][openal].


## Quickstart Examples

It's expected that you know [CSFML][csfml] and know the types, functions, etc. But, examples of using it from [Racket][racket] can be found [here][examples].

[csfml]: https://www.sfml-dev.org/
[openal]: https://www.openal.org/
[examples]: https://github.com/massung/racket-csfml/tree/master/examples
