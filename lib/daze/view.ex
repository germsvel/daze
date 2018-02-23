defmodule Daze.View do
  defmacro __using__(_) do
    quote do
      import Daze.View
    end
  end

  @template_path "lib/daze/templates"

  defmacro deftemplate(template_name, function_name) do
    template_path = "#{@template_path}/#{template_name}"

    quote do
      require EEx
      EEx.function_from_file(:def, unquote(function_name), unquote(template_path), [:assigns])
    end
  end
end
