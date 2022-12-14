// import gleam/io

// pub fn main() {
//   io.println("Hello from app_gleam!")
// }

import gleam/erlang/process
import gleam/http/cowboy
import gleam/http/response.{Response}
import gleam/http/request.{Request}
import gleam/bit_builder.{BitBuilder}

// Define a HTTP service
//
pub fn my_service(_request: Request(t)) -> Response(BitBuilder) {
  let body = bit_builder.from_string("Hello, world!")

  response.new(200)
  |> response.prepend_header("made-with", "Gleam")
  |> response.set_body(body)
}

// Start it on port 3000!
//
pub fn main() {
  let _r = cowboy.start(my_service, on_port: 3000)
  process.sleep_forever()
}
