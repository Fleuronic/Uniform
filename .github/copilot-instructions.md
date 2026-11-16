# Uniform

## Stray build artifacts
- `*.d`, `*.dia`, `*.swiftdeps` and `*.swiftmodule` files appearing in the repo root and `Submodules/UniformService` come from SourceKit-LSP background indexing (`swift.sourcekit-lsp.backgroundIndexing: "on"`): rebuilding the swift-memberwise-init-macro SwiftSyntax plugin makes swift-driver write supplementary outputs into the package roots instead of `.build/`.
- They are gitignored in all four modules and hidden by `files.exclude`/`search.exclude` in `.vscode/settings.json`. Turning background indexing off stops them but loses cross-file indexing; don't change it without asking.
- Cleanup: delete only the top-level matches in the repo root and `Submodules/UniformService`. Never recurse into `.build/`.
