package dotenv

import "core:os"
import "core:strings"
import "core:fmt"

load :: proc(filename: string) {
    data, err := os.read_entire_file_from_path(filename, context.allocator)
    if err != nil {
        fmt.eprintln("Failed to load the env file:", err)
    }
    defer delete(data)

    iter := string(data)
    for line in strings.split_lines_iterator(&iter) {
        kv := strings.split(line, "=")

        // Ignore everything that doesn't have exactly 2 values after splitting by =
        // This should root out all invalid lines
        if len(kv) != 2 {
            continue
        }

        key := strings.trim_space(kv[0])
        value := strings.trim_space(strings.split(kv[1], "#")[0]) // kv[1] is everything after the = sign; We split it further by # to get rid of in-line comments
        if _, found := os.lookup_env_alloc(key, context.allocator); !found {
            os.set_env(key, value)
        }
    }
}