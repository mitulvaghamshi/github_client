## 0.0.1

## Tidy up annoyances
Currently, the code has an annoying aspect. After the authentication flow, when GitHub has authenticated your application, you are left staring at a web browser page. Ideally, you should automatically return to the application. Fixing this requires creating a Flutter plugin for your desktop platform(s).

## Create a Flutter plugin for Windows, macOS and Linux
To have the application automatically bring itself to the front of the stack of application windows after the OAuth flow completes requires some native code. For macOS, the API you need is the NSApplication's activate(ignoringOtherApps:) instance method, for Linux we will use gtk_window_present, and for Windows we resort to Stack Overflow. To be able to call these APIs, you need to create a Flutter plugin.

[Source: Google Codelab.](https://codelabs.developers.google.com/codelabs/flutter-github-client?hl=en#5)
