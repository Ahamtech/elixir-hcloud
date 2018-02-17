defmodule Hcloud.SSH do
    @enforce_keys [:name, :primary_key]
    defstruct [:name, :primary_key]
end
