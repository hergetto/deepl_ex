import Config

# Use mock adapter for all clients
config :tesla, adapter: Tesla.Mock

config :deepl_ex, api_key: "api_key_for_test"
