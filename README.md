# Homebrew AIMeter Tap

This is the official Homebrew Tap for [AIMeter](https://github.com/smriti-memcore/aimeter), a real-time, pay-as-you-go AI API usage and cost monitor for macOS.

## Installation

To add this tap and install AIMeter, run:

```bash
brew tap smriti-memcore/aimeter
brew install aimeter
```

## Running the Service

AIMeter runs as a background service that automatically launches on system login:

```bash
# Start the background service
brew services start aimeter

# Configure your AI tools (IDE, shell, etc.)
aimeter setup
```

The web control center dashboard will be available at:
👉 **[http://127.0.0.1:5333/](http://127.0.0.1:5333/)**

## Updating

To update AIMeter to the latest version:

```bash
brew update
brew upgrade aimeter
```

## Uninstalling

To cleanly uninstall the service and revert any auto-setup configurations:

```bash
# Revert shell and IDE setup integrations
aimeter setup --undo

# Stop and uninstall the homebrew formula
brew services stop aimeter
brew uninstall aimeter
```
