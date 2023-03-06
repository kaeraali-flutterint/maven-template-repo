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

This repository uses Java 11 and Maven 3.8.6. You can override this by updating the configuration in:

* pom.xml
* .github/workflows/maven.yaml (in multiple places)
* .sdkmanrc
* Dockerfile

## Importing packages

To use the packages built and published by this repository, you will need a GitHub Personal Access Token (classic) and to configure your `~/.m2/settings.xml` file

1. Generate a classic token [here](https://github.com/settings/tokens), ensuring you add `read:packages`
2. Edit your `~/.m2/settings.xml` file, replacing `GITHUB_USERNAME` and `PERSONAL_TOKEN`:

```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd">

  <activeProfiles>
    <activeProfile>github</activeProfile>
  </activeProfiles>

  <profiles>
    <profile>
      <id>github</id>
      <repositories>
        <repository>
          <id>central</id>
          <url>https://repo1.maven.org/maven2</url>
        </repository>
        <repository>
          <id>github</id>
          <url>https://maven.pkg.github.com/alicekaerast/maven-template-repo</url>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
    </profile>
  </profiles>

  <servers>
    <server>
      <id>github</id>
      <username>GITHUB_USERNAME</username>
      <password>PERSONAL_TOKEN</password>
    </server>
  </servers>
</settings>
```

You can now use this package in your own `pom.xml`:

```xml
<project>
    ...
    <dependencies>
        <dependency>
            <groupId>org.example</groupId>
            <artifactId>maven-template-repo</artifactId>
            <version>1.0.2</version>
        </dependency>
    </dependencies>
</project>
```