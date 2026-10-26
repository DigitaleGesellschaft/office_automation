# [GitHub Actions workflows](https://docs.github.com/de/actions/reference/workflows-and-actions) for office automation

## Newsletter draft

[![newsletter_draft.yml](https://github.com/DigitaleGesellschaft/office_automation/actions/workflows/newsletter_draft.yml/badge.svg)](https://github.com/DigitaleGesellschaft/office_automation/actions/workflows/newsletter_draft.yml)

This workflow runs on the second Wednesday of every month. It composes a draft for the monthly newsletter from *Digitale
Gesellschaft Schweiz* using generative AI and writes the result to a new page in our [Confluence
instance](https://wiki.digitale-gesellschaft.ch/).

The workflow is defined in [`.github/workflows/newsletter_draft.yml`](.github/workflows/newsletter_draft.yml).

- It executes the Bash script [`mise-tasks/newsletter_draft.sh`](mise-tasks/newsletter_draft.sh) via
  `mise run newsletter_draft`. The script executes a [Goose
  recipe](https://goose-docs.ai/docs/guides/recipes/recipe-reference) stored under
  [`.goose/recipes/newsletter_draft.yaml`](.goose/recipes/newsletter_draft.yaml).
- It uses a cron schedule [`0 0 * * 3`](.github/workflows/newsletter_draft.yml#L7) (every Wednesday) and then filters
  for the second Wednesday (days 8-14 of the month).
- It can be manually triggered from GitHub's [**Actions**
  tab](https://github.com/DigitaleGesellschaft/office_automation/actions/workflows/newsletter_draft.yml) (e.g. for
  testing) with the option to provide a custom set of `ARTICLE_LINKS`[^1]. To be able to manually trigger the workflow,
  one's GitHub user must be granted sufficient access rights.

**Remember**: The code relies on the newsletter blog posts being tagged with **`Newsletter`** in Wordpress – this tag is
the only structured data signal available in our RSS feeds that allows to unambiguously identify newsletters within the
whole collection of blog posts. Always make sure the tag is correctly assigned.

[^1]: URLs of the blog articles to be covered by the newsletter, separated by a space character.

### Configuration

Edit the Goose recipe [`.goose/recipes/newsletter_draft.yaml`](.goose/recipes/newsletter_draft.yaml), Goose's memories
in [`.goose/memory/`](.goose/memory) and the environment variables in [`config.env.yaml`](config.env.yaml) to customize
the task execution. Note that the script automatically determines suitable `ARTICLE_LINKS` if none are provided.
