# GutHub App

Flutter desktop app that accesses GitHub APIs to retrieve your repositories, assigned issues, and pull requests. In accomplishing this task, you'll create and use plugins to interact with native APIs and desktop applications, and use code generation to build type safe client libraries for GitHub's APIs. ([Source](https://codelabs.developers.google.com/codelabs/flutter-github-client#0:~:text=Flutter%20desktop%20app,for%20GitHub%27s%20APIs.))

- Retrieve, your github repositories to flutter app.
- Checkout google codelab [Write a Flutter desktop application](https://codelabs.developers.google.com/codelabs/flutter-github-client) written by brettmorgan.

## How to run the app

- To run the app (local environment), you need a OAuth2 app registered with GitHub.
- This app requires `repo` and `read:org` scopes enabled on your OAuth2 app.
- Dont forget to copy your client secret, as it only visible once at the time of app creation.
- Once setup complete, create a `config.json` file on the project root:
```
github_app/config.json
```
- Obtain your Client ID and Client Secret from above registered app, and add it to the `config.json` file as:
```json
{
    "id": "<your-client-id>",
    "sec": "<your-client-secret>"
}
```
- **Important Note:** Do not commit `config.json` to your version control system (e.g. GitHub).
- Finally run the app as:
```
flutter run --dart-define-from-file=<path-to-config-file>
```
- Example:
```
flutter run --dart-define-from-file=config.json
```
