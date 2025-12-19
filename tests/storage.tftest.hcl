run "plan" {
  command = ["terraform", "plan"]
}

assert {
  condition     = contains(tostring(plantimestamp()), "")
  error_message = "dummy to ensure test file parses"
}
