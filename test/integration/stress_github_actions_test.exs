# SPDX-License-Identifier: Apache-2.0

defmodule ChromicPDF.StressGithubActionsTest do
  use ExUnit.Case, async: false
  import ChromicPDF.TestAPI

  setup do
    %{supervisor: start_supervised!({DynamicSupervisor, strategy: :one_for_one})}
  end

  test "stress github actions until it explodes", %{supervisor: supervisor} do
    for i <- 1..10 do
      IO.inspect(i, label: "iteration")
      {:ok, pid} = DynamicSupervisor.start_child(supervisor, ChromicPDF)
      {:ok, _} = ChromicPDF.print_to_pdf({:html, test_html()})
      DynamicSupervisor.terminate_child(supervisor, pid)
    end
  end
end
