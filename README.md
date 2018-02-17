# Hcloud - A Elixir library for the Hetzner Cloud API

![hcloud](https://sos-ch-dk-2.exo.io/aham-web/elixir/hcloud.jpg)

## Installation

```elixir
def deps do
  [
    {:hcloud, "~> 0.1.0"}
  ]
end
```

## Configuration

```elixir
  use Mix.Config
    config :hcloud, hcloud_api: "12123131"

```

## Usage

```elixir
Hcloud.servers()
```

## API

https://docs.hetzner.cloud/

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and docs can be found at [https://hexdocs.pm/hcloud](https://hexdocs.pm/hcloud).

## License
Hcloud is Copyright © Ahamtech. It is free software, and may be redistributed under the terms specified in the LICENSE file.

## About Ahamtech

![img](https://sos-ch-dk-2.exo.io/aham-web/company/ahamtech.png)

> Hcloud is maintained by Ahamtech. 

We love open source software, Erlang, Elixir, and Phoenix. See our other opensource projects, or hire our Elixir Phoenix development team to design, develop, and grow your product.