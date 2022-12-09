# SPDX-License-Identifier: Apache-2.0

defmodule ChromicPDF.WarumupTest do
  use ExUnit.Case, async: false

  test "ChromicPDF.warmup/0 fires a one-off chrome task to warmup Chrome's caches" do
    assert ChromicPDF.warmup([]) == :ok
  end
end
