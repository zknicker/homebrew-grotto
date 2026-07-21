# Grotto Homebrew Tap

Homebrew distribution for Grotto Runtime.

## Install

```bash
brew install zknicker/grotto/grotto-runtime
brew services start grotto-runtime
```

## Update

```bash
brew update
brew upgrade grotto-runtime
grotto restart
```

## Service

```bash
brew services info grotto-runtime
brew services restart grotto-runtime
brew services stop grotto-runtime
```

Runtime logs are written to `$(brew --prefix)/var/log/grotto/runtime.log`.

The service listens on `127.0.0.1:18790` by default. Override Runtime settings
with `TAVERN_RUNTIME_HOST`, `TAVERN_RUNTIME_PORT`, or `TAVERN_RUNTIME_ROOT` in
the service environment.
