return {
  cmd = { "jetls", "serve" },
  -- keep treesitter as the fold provider so the custom docstring fold query
  -- (after/queries/julia/folds.scm) applies; origami switches to LSP folds
  -- on attach whenever a client advertises foldingRange
  on_init = function(client)
    client.server_capabilities.foldingRangeProvider = nil
  end,
}
