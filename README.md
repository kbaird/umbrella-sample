# SampleApp.Umbrella

Demonstrates how to combine a thin web wrapper with a GenServer-based backend

## How to Use

It knows how to do simple 1-arity math operations `square` and `negate`.

`mix phx.server`

then

* `curl 'http://localhost:4000/square/4'` => `16`
* `curl 'http://localhost:4000/negate/3'` => `-3`

etc.

## How to Steal

`rename Foo foo` will convert `SampleApp` -> `Foo` and `sample_app` -> `foo`

probably a good move after that is

1. `rm -rf .git`
1. Various mods to get away from my contrived math examples
1. `git init`

etc.
