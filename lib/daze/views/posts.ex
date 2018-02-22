defmodule Daze.Views.Posts do
  require EEx

  EEx.function_from_file(:def, :index, "lib/daze/templates/posts/index.html.eex", [:assigns])
end
