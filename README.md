# SampleApp.Umbrella

Demonstrates how to combine a thin web wrapper with a GenServer-based backend

## How to Use

It knows how to do simple 1-arity math operations `square` and `negate`.

These are just placeholders for whatever your real app's responsibilities will be.

`mix phx.server`

then

* `curl 'http://localhost:4000/square/4'` => `16`
* `curl 'http://localhost:4000/negate/3'` => `-3`

etc.

## How to Steal

`copy_and_rename.sh Foo foo` will convert `SampleApp` -> `Foo` and `sample_app` -> `foo`

The resulting directory has no `.git/` directory, but can be initialized as desired.
