use Mix.Config

config :sample_app, :riak,      Riak#.Mock
config :sample_app, :riak_url,  'riak-proxy.sqor.com'
config :sample_app, :crest_url, 'https://rest.sqor.com'
