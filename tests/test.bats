#!/usr/bin/env bats

@test '-v should output version' {
  run cmdcli -v
  [ "$status" -eq 0 ]
  [ $(expr "${output}" : "0.*") -ne 0 ]
}

@test '--version should output version' {
  run cmdcli --version
  [ "$status" -eq 0 ]
}

@test 'should split by comma delimited' {
  export CMD_CLI_TOKEN="testing"
  run cmdcli list "list,of,entries"

  # Output contains 3 entries
  [ "$status" -eq 0 ]
  [[ "$output" == *"PREFIX_list_SUFFIX"* ]]
  [[ "$output" == *"PREFIX_of_SUFFIX"* ]]
  [[ "$output" == *"PREFIX_entries_SUFFIX"* ]]
}