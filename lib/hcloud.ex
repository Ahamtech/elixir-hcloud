defmodule Hcloud do
  def servers() do
    Hcloud.Client.get("servers")
  end

  def floating_ips() do
    Hcloud.Client.get("floating_ips")
  end

  def ssh_keys() do
    Hcloud.Client.get("ssh_keys")
  end

  def ssh_keys_id(id) do
    Hcloud.Client.get("ssh_keys/#{id}")
  end

  def ssh_keys_id_create(data) do
    Hcloud.Client.post("ssh_keys", data)
  end

  def ssh_keys_id_udpate(data) do
    Hcloud.Client.put("ssh_keys", data)
  end

  def ssh_keys_id_delete(id) do
    Hcloud.Client.delete("ssh_keys/#{id}")
  end

  def server_types() do
    Hcloud.Client.get("server_types")
  end

  def server_types(id) do
    Hcloud.Client.get("server_types/#{id}")
  end

  def locations() do
    Hcloud.Client.get("locations")
  end

  def locations(id) do
    Hcloud.Client.get("locations/#{id}")
  end

  def datacenters() do
    Hcloud.Client.get("datacenters")
  end

  def datacenters(id) do
    Hcloud.Client.get("datacenters/#{id}")
  end

  def images() do
    Hcloud.Client.get("images")
  end

  def images(id) do
    Hcloud.Client.get("images/#{id}")
  end

  def images_udpate(id, data) do
    Hcloud.Client.put("images/#{id}", data)
  end

  def images_delete(id) do
    Hcloud.Client.delete("images/#{id}")
  end

  def isos() do
    Hcloud.Client.get("isos")
  end

  def isos(id) do
    Hcloud.Client.get("isos/#{id}")
  end

  def pricing() do
    Hcloud.Client.get("pricing")
  end
end
