defmodule Hcloud.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hcloud,
      version: "0.1.1",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Hcloud",
      source_url: "https://gitlab.com/ahamtech/elixir/hcloud"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [ ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description() do
    "hcloud: A Elixir library for the Hetzner Cloud API"
  end

  defp package() do
    [
      name: "hcloud",
      files: ["lib", "mix.exs", "README*","LICENSE*"],
      maintainers: ["Anwesh Reddy","Mahesh Reddy"],
      licenses: ["GNU Lesser General Public License v3.0"],
      links: %{"GitHub" => "https://gitlab.com/ahamtech/elixir/hcloud"}
    ]
  end
end
