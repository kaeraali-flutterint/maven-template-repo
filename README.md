# Maven Template Repo

A GitHub template repository for using GitHub Actions and GitHub packages

## Usage

You will need to set your package name and repository in `pom.xml` before you can use this

This repository uses Java 11. You can override this by updating the configuration in:

* pom.xml
* .github/workflows/maven.yaml (in multiple places)
* .sdkmanrc

## Known Issues

Deploys will fail if the version number isn't bumped. We still need to figure out how to handle versioning