# Maven Template Repo

> A modern (2023) GitHub template repository for use with Apache Maven

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/alicekaerast/maven-template-repo/maven.yaml) ![GitHub last commit](https://img.shields.io/github/last-commit/alicekaerast/maven-template-repo)

This repository is configured to:

* receive PRs for updates to GitHub actions on Fridays (`.github/dependabot.yml`)
* receive PRs for maven dependency updates on Fridays (`.github/dependabot.yml`)
* automatically merge PRs from dependabot if tests pass (`.mergify.yml` - requires repo to be public and the [Mergify app](https://mergify.com/) installed)
* automatically merge PRs if approved by an owner and tests pass (`.mergify.yml` - requires repo to be public and the Mergify app installed)
* run a maven build on every PR (`.github/workflows/maven.yml` - may require a local copy of the actions in more restricted organisations)
* automatically bump version numbers on merge to the main branch (`.github/workflows/maven.yml` - may require a local copy of the actions in more restricted organisations)
* perform a maven deploy to the repository's packages on successful merge to the main branch (`.github/workflows/maven.yml` and `pom.xml` - may require a local copy of the actions in more restricted organisations)
* define a version of Java to use with [SDKMan](https://sdkman.io/) (run `sdk env` when you cd into the directory)
* provide a dockerfile for building and running the application in docker. This isn't part of the CI/CD process because it's only useful to us as a developer tool, future work may see a docker image published to GitHub Packages

For more locked-down repositories/organisations you may need to do some tweaking to remove Mergify and copy the GitHub Actions being used over to either this repository or another repository within your organisation. We'd appreciate feedback on your experiences with this either as an issue or a PR to this README.

## Usage

You will need to set your package name and repository configuration in `pom.xml` before you can use this

Version numbers will be bumped on every merge to the main branch. By default, this will increment the snapshot number, but you can also add `#major`, `#minor`, or `#patch` to a commit message if you are changing something more substantial

This repository uses Java 11. You can override this by updating the configuration in:

* pom.xml
* .github/workflows/maven.yaml (in multiple places)
* .sdkmanrc
* Dockerfile
