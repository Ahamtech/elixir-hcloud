defmodule Hcloud do

  alias Hcloud.Client

  #Actions
  def get_actions() do
    Client.get("actions")
  end

  def get_action(id), do: Client.get("actions/" <> id)

  #Servers
  def get_servers, do: Client.get("servers")
  def get_server(id), do: Client.get("servers/" <> id)
  def create_server(data), do: Client.post("servers", data)
  def update_server_name(id, name \\ nil), do: Client.put("servers/" <> id, %{name: name})
  def delte_server(id), do: Client.delete("servers/" <> id )
  def server_metrics(id) do
    Client.get("servers/" <> id)
  end

  # Server Actions


  def server_actions(id) do
    Client.get("servers/" <> id <> "/actions")
  end

  def server_action(server_id, action_id) do
    Client.get("servers/" <> server_id <> "/actions/" <> action_id)
  end

  @doc """
  Here action is the any atom in the following atom
  """

  def server_do_action(id, action) do
    Client.post("servers/" <> id <> "/actions/" <> to_string(action))
  end

  #Floating IPs
  def floating_ips(), do: Client.get("floating_ips")
  def floating_ip(id), do: Client.get("floating_ips/" <> id)
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
  def create_floating_ip( %{type: _ } = data), do: Client.post("floating_ips", data)
  def update_floating_ip_description(id, description \\ nil) do
    Client.put("floating_ips/" <> id, description)
  end
  def delete_floating_ip(id), do: Client.delete("floating_ips/" <> id)

  #FLoating IP Actions

  def floating_ip_actions(id, data \\ nil), do: Client.get("floating_ips/" <> id <> "/actions" <> data)
  def floating_ip_action(floating_ip_id, action_id), do: Client.get("floating_ips/" <> floating_ip_id <> "/actions" <> action_id)
  def floating_ip_do_action(id,action), do: Client.post("floating_ips/" <> id <> "/actions/" <> to_string(action))





  #ssh-keys
  def ssh_keys(), do: Client.get("ssh_keys")

  def ssh_key(id), do: Client.get("ssh_keys/#{id}")

  def create_ssh_key(name, primary_key) do
    Client.post("ssh_keys", %{name: name, primary_key: primary_key})
  end

  def update_ssh_key(id, new_name) do
    Client.put("ssh_keys/#{id}", %{name: new_name})
  end

  def delete_ssh_key(id), do: Client.delete("ssh_keys/#{id}")

  #server types
  def server_types(), do: Client.get("server_types")

  def server_types(id), do: Client.get("server_types/#{id}")

  #locations
  def locations(), do: Client.get("locations")

  def locations(id), do: Client.get("locations/#{id}")

  #datacenters
  def data_centers(), do: Client.get("datacenters")

  def data_centers(id), do: Client.get("datacenters/#{id}")

  #images
  def images(), do: Client.get("images")

  def images(id), do: Client.get("images/#{id}")

  def udpate_image(id, description, type) do
    Client.put("images/#{id}", %{description: description, type: type })
  end

  def delete_image(id), do: Client.delete("images/#{id}")

  def isos(), do: Client.get("isos")

  def isos(id), do: Client.get("isos/#{id}")

  def pricing(), do: Client.get("pricing")
end
