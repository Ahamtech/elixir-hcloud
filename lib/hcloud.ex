defmodule Hcloud do
  def servers(), do: Hcloud.Client.get("servers")

  #Floating IPs
  def floating_ips(), do: Hcloud.Client.get("floating_ips")
  def floating_ips(id), do: Hcloud.Client.get("floating_ips/" <> id)
  @doc """
  Creates a new Floating IP assigned to a server. If you want to create a Floating IP that is not bound to a server, you need to provide the home_location key instead of server. This can be either the ID or the name of the location this IP shall be created in. Note that a Floating IP can be assigned to a server in any location later on. For optimal routing it is advised to use the Floating IP in the same Location it was created in.

  ## Request
  The type argument is required while home_location and server are mutually exclusive.

  You need to pass the  map as 
    %{
      type: type, 
      home_location: home_location,
      server: server
      description: description
     }


  """
  def create_floating_ip( %{type: _ } = data), do: Hcloud.Client.get("floating_ips")
  def update_floating_ip_description(id, description \\ nil) do
    Client.put("floating_ips/" <> id, description)
  end
  def delete_floating_ip(id), do: Hcloud.Client.delete("floating_ips/" <> id)


  #ssh-keys
  def ssh_keys(), do: Hcloud.Client.get("ssh_keys")

  def ssh_key(id), do: Hcloud.Client.get("ssh_keys/#{id}")

  def create_ssh_key(name, primary_key) do
    Hcloud.Client.post("ssh_keys", %{name: name, primary_key: primary_key})
  end

  def update_ssh_key(id, new_name) do
    Hcloud.Client.put("ssh_keys/#{id}", %{name: new_name})
  end

  def delete_ssh_key(id), do: Hcloud.Client.delete("ssh_keys/#{id}")

  #server types
  def server_types(), do: Hcloud.Client.get("server_types")

  def server_types(id), do: Hcloud.Client.get("server_types/#{id}")

  #locations
  def locations(), do: Hcloud.Client.get("locations")

  def locations(id), do: Hcloud.Client.get("locations/#{id}")

  #datacenters
  def data_centers(), do: Hcloud.Client.get("datacenters")

  def data_centers(id), do: Hcloud.Client.get("datacenters/#{id}")

  #images
  def images(), do: Hcloud.Client.get("images")

  def images(id), do: Hcloud.Client.get("images/#{id}")

  def udpate_image(id, description, type) do
    Hcloud.Client.put("images/#{id}", %{description: description, type: type })
  end

  def delete_image(id), do: Hcloud.Client.delete("images/#{id}")

  def isos(), do: Hcloud.Client.get("isos")

  def isos(id), do: Hcloud.Client.get("isos/#{id}")

  def pricing(), do: Hcloud.Client.get("pricing")
end
