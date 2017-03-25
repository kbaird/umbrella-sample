# SampleApp.Umbrella

Demonstrates how to combine a thin web wrapper with a GenServer-based backend

## How to Use

It knows how to do simple 1-arity math operations `square` and `negate`.

`mix phx.server`

then

* `curl 'http://localhost:4000/square/4'`
* `curl 'http://localhost:4000/negate/3'`

etc.
