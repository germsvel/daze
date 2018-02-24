defmodule Daze.View do
  defmacro __using__(_) do
    quote do
      require EEx

      Daze.View.module_to_string(__MODULE__)
      |> Daze.View.templates_to_compile()
      |> Enum.map(&Daze.View.template_and_function_name/1)
      |> Enum.each(fn {template, function_name} ->
        EEx.function_from_file :def, function_name, template, [:assigns]
      end)
    end
  end

  @templates_path "lib/daze/templates"

  def module_to_string(module_name) do
    module_name
    |> to_string()
    |> Module.split()
    |> List.last()
    |> Macro.underscore()
  end

  def template_and_function_name(template) do
    function_name =
      template
      |> Path.basename()
      |> Path.rootname(".html.eex")
      |> String.to_atom()

    {template, function_name}
  end

  def templates_to_compile(name, extension \\ "html.eex") do
    name
    |> template_path()
    |> Path.join("**.#{extension}")
    |> Path.wildcard()
  end

  def template_path(name) do
    Path.join(@templates_path, name)
  end
end
