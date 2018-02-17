defmodule Hcloud.Client do
  def get(path) do
    conf = []
    ctype = 'application/json'
    body = ""
    request(conf, :get, url("https://api.hetzner.cloud/v1/", path), [], ctype, body)
  end

  def post(path) do
    body = ""
    post(path, body)
  end

  def post(path, body) do
    conf = []
    ctype = 'application/json'
    request(conf, :post, url("https://api.hetzner.cloud/v1/", path), [], ctype, body)
  end

  def delete(path) do
    body = ""
    delete(path, body)
  end

  def delete(path, body) do
    conf = []
    ctype = 'application/json'
    request(conf, :delete, url("https://api.hetzner.cloud/v1/", path), [], ctype, body)
  end

  def put(path, body) do
    conf = []
    ctype = 'application/json'
    request(conf, :put, url("https://api.hetzner.cloud/v1/", path), [], ctype, body)
  end

  def auth_headers() do
    {'Authorization', 'Bearer #{String.to_charlist(Application.get_env(:hcloud, :hcloud_api))}'}
  end

  def url(domain, path) do
    Path.join([domain, path])
  end

  def request(conf, method, url, headers, ctype, body) do
    url = String.to_charlist(url)
    opts = conf[:httpc_otps] || []

    case method do
      :get ->
        headers = headers ++ [auth_headers()]
        :httpc.request(:get, {url, headers}, opts, body_format: :binary)

      _httpvs ->
        headers = headers ++ [auth_headers()]
        :httpc.request(method, {url, headers, ctype, Poison.decode!(body)}, opts, body_format: :binary)
    end
    |> normalise_response
  end

  defp normalise_response(response) do
    case response do
      {:ok, {{_httpvs, 200, _status_phrase}, _headers, body}} ->
        {:ok, Poison.decode!(body)}

      {:ok, {{_httpvs, 201, _status_phrase}, _headers, body}} ->
        {:ok, Poison.decode!(body)}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
