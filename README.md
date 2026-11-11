# Odin dotenv

An Odin library that loads environment variables from a file.

# Installation

Add the project as a submodule in the external folder:
```bash
git submodule add https://github.com/fatshark-kra/odin-dotenv external/odin-dotenv
```

Import the package:
```odin
import dotenv "external/odin-dotenv"
```

# Usage

Call `dotenv.load(".env")` as early as possible. You can pass any relative path to the procedure.

Then you can use environment variable functions in the `os` package.

## Precedence

The library doesn't override variables set outside of the process. For example, assuming `DEPLOY_ENV=test` in an `.env` file:
* `odin run .`:
  ```odin
  // Prints test
  fmt.println(os.get_env("DEPLOY_ENV", context.temp_allocator))
  ```
* `DEPLOY_ENV=prod odin run .`
  ```odin
  // Prints prod
  fmt.println(os.get_env("DEPLOY_ENV", context.temp_allocator))
  ```

# Compatibility

This library was built with a recent (late June 2025) `master` version of Odin, on a Linux system. It is beta software that is confirmed to work on my system. Your mileage may vary and you will likely run into edge cases.