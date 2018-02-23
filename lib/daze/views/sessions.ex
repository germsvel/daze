defmodule Daze.Views.Sessions do
  require EEx

  EEx.function_from_file :def,
    :new,
    "lib/daze/templates/sessions/new.html.eex",
    [:assigns]
end
