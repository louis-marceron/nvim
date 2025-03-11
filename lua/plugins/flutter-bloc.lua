return {
  'wa11breaker/flutter-bloc.nvim',
  dependencies = {
    'nvimtools/none-ls.nvim', -- Required for code actions
  },
  opts = {
    bloc_type = 'freezed', -- Choose from: 'default', 'equatable', 'freezed'
    use_sealed_classes = false,
    enable_code_actions = true,
  },
}
