package main

import "core:os"
import "core:fmt"
import dotenv ".."

main :: proc() {
    dotenv.load(".env")

    // Prints S3CR37V4LU3
    fmt.println("Value of SECRET_VAR is:", os.get_env("SECRET_VAR"))

    // Prints 4N07H3R-S3CR37
    fmt.println("Value of ANOTHER_VAR is:", os.get_env("ANOTHER_VAR"))

    // Prints false
    _, found := os.lookup_env("COMMENTED_VAR");
    fmt.println("COMMENTED_VAR found:", found)
}