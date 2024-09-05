# Study Robot Framework

Sample Project Study for the create some test cases using Robot Framework + JavaScript (Parodify Project) + GitHub Actions 

## Features
* GitHub Actions;
* GitLab (using Dockerfile)
* Dockerfile;
* Mock (Browser Library);

[GitHub Actions - Documentation](https://docs.github.com/en/actions)

## Pre-requirements

It is required to have Node.js and npm installed to run this project.

## Installation

Run `npm install` (or `npm i` for the short version) to install the dev dependencies;

Then Install Robot Framework in the Project Folder;

Install Robot Framework robotframework-browser (rfbrowser init).

## Tests

```
robot -d ./logs player.robot
```

## Robot Framework Reporter Action
[Link](https://github.com/joonvena/robotframework-reporter-action?tab=readme-ov-file#example-usage)

### Example usage
```
   generate_report:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v2
        - name: Download reports
          uses: actions/download-artifact@v1
          with:
            name: reports
        - name: Send report to commit
          uses: joonvena/robotframework-reporter-action@v2.5
          with:
            gh_access_token: ${{ secrets.GITHUB_TOKEN }}
```

## GitHub Actions

* Manual Run WEB Tests <parameter - [TAG]> - Use the [Tags] inside the test file.
* Manual Run WEB Tests <parameter - [BROWSER]> - Use the [BROWSER] NAME option select.
* Run WEB Tests - Automatic execution after each pull request.

## Dockerfile

```
Using Powershell:

docker run --rm -v ${PWD}/tests:/tests -v ${PWD}/resources:/resources -v ${PWD}/results:/results --entrypoint robot lgustavolp/robotframework --outputdir /results /tests/player.robot
```

## Gitlab

* Create a new project (using import project on Gitlab);
* Define a new variable with the GIT_TOKEN created on Github;
* Create new pipeline and run.

## Support this project

If you want to support this project, leave a ⭐.

___

This project was created by [Luiz Gustavo Lucena].
