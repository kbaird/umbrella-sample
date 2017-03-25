use Mix.Config

config :sample_app, :riak,      Riak#.Mock
config :sample_app, :riak_url,  'test-riak-proxy.sqor.com'
config :sample_app, :crest_url, 'https://rest-stage.sqor.com'
