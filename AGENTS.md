# Git version control

- Always switch to a new branch with a suitable name prefixed with `agent-` before writing to any files in this repository. If switching to the new branch is hindered by uncommitted/pending changes, pause and ask the user whether they want you to commit the pending changes first, or rather prefer to directly let you write to the currently checked out branch instead.

- Every time you change files in a Git-revisioned directory, make one or more commits, each with a clear message. Group changes that logically and functionally belong together together in a single commit, but first and foremost try to build as clean a Git history as possible that is easy to comprehend and offers enough checkpoints, so recent changes are easily reversible.

- Adhere to the Conventional Commits specification when writing commit messages. Plus always add `Assisted-by: Goose:<model-slug>` (replace `<model-slug>` with the actual LLM in use, without the provider/maker prefix, e.g. `Assisted-by: Goose:glm-5.3-flash`) on a separate final line.
