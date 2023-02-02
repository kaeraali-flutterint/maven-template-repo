# Maven Template Repo

A GitHub template repository for using GitHub Actions and GitHub packages

## Usage

You will need to set your package name and repository configuration in `pom.xml` before you can use this

Version numbers will be bumped on every merge to the main branch. By default, this will increment the snapshot number, but you can also add `#major`, `#minor`, or `#patch` to a commit message if you are changing something more substantial

This repository uses Java 11. You can override this by updating the configuration in:

* pom.xml
* .github/workflows/maven.yaml (in multiple places)
* .sdkmanrc
