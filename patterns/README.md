# Patterns, cores, and attachments
A Raven "pattern" represents an installation suited for a rough use-case.
A pattern has a core and attachments.

- The core represents uncompromising details about the pattern's intended use.
- Attachments are less opininated, but may still be specific to a pattern.
- Cores are anatomically identical to attachments; they're just up one level.
- Each core and attachment may have system and home-manager components.

For example, the [core from raven-core](./raven-core/core/README.md) adds the
software necessary to interface with the raven repository and meaningfully use
a Raven system. It also contains documentation on how to create and add new
attachments.

Here is an overview of the patterns provided by default.

- loader: Contains a configuration for building an ISO.
- raven-core: Base operator pattern. Full terminal with home-manager touches.
- raven-desktop: Graphical desktop and applications.
