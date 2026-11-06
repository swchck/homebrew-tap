# swchck/homebrew-tap

A Homebrew tap for my own tools.

```sh
brew tap swchck/tap
brew install swchck/tap/<name>
```

Formulae here are source-based and ship bottles built by CI, so an install
pulls a prebuilt binary by default and `brew install --build-from-source
swchck/tap/<name>` compiles the same source instead.

## Formulae

| Name | What it is |
|---|---|
| `pkginbox` | Inbox for packages installed by hand, outside the dotfiles manifest |

## Casks

| Name | What it is |
|---|---|
| `pelican-mods` | Stardew Valley mod manager and launcher |
| `svoya-igra` | Quiz game in the Jeopardy format |
| `which-of-us` | Party game about guessing who in the room fits the question |
| `which-of-us-full` | The same game with the voices in the image instead of downloaded |
| `wishlist-editor` | Editor for a wishlist published to GitHub Pages |

None of the applications is signed with an Apple Developer ID, so macOS would
refuse to open them the first time. Each cask clears the quarantine flag after
installing, which takes no password and nothing to confirm. They are all built
by my own release workflows from the sources in these repositories.
