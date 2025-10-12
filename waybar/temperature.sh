#!/usr/bin/bash

output=$(sensors coretemp-isa-000 | awk '
/Package id 0: / {printf "%s\n", $4}
/Core [0-9]+: / {printf "%s %s %s\n", $1, $2, $3}
' | sed 's/+//')

pkg=$(echo "$output" | sed -n '1p')
cores=$(echo "$output" | sed -n '2,$p')
cores=$(echo "$cores" | sed -z 's/\n/\r/g')

printf '{"text": "%s", "tooltip": "%s"}\n' "$pkg" "${cores%?}"
