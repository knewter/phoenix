defmodule Phoenix.Config.App do
  defmacro __using__(_) do
    quote do
      @before_compile unquote(__MODULE__)
      use ExConf.Config, env_var: "MIX_ENV"
    end
  end

  defmacro __before_compile__(_env) do
    quote do

      config :router, port: 4000,
                      ssl: true,
                      # Full error reports are disabled
                      consider_all_requests_local: false

      config :plugs, code_reload: false,
                     serve_static_assets: true

      config :logger, level: :error
    end
  end
end
