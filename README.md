# swchck/homebrew-tap

A Homebrew tap for my own tools.

```sh
brew tap swchck/tap
brew install swchck/tap/<name>
```

Formulae here are source-based and ship bottles built by CI, so an install
pulls a prebuilt binary by default and `brew install --build-from-source
swchck/tap/<name>` compiles the same source instead.

| Formula | What it is |
|---|---|
| `pkginbox` | Inbox for packages installed by hand, outside the dotfiles manifest |
