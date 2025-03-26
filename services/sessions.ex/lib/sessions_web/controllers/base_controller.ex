defmodule SessionsWeb.BaseController do
  use SessionsWeb, :controller

  def health(conn, _) do
    json(conn, %{
      success: true
    })
  end
end
