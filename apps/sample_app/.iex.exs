true = is_pid(:global.whereis_name(FanOutFeedBuilder))
name = {:global, FanOutFeedBuilder}
:ok  = GenServer.call(name, :heartbeat)

#post = %{id: "e0e8b82e-ba44-4434-b262-2732794a464e", author: "261142"}
#GenServer.cast(name, {:inject, post})
