#!/usr/bin/env bash
# Lint and security-audit all GitHub Actions workflows and the Dependabot
# config. Mirrors the `jactionlint` and `zizmor` CI jobs in
# .github/workflows/lint.yml.
set -euo pipefail

jactionlint
zizmor --min-severity low .