-- Loop through workspaces 1 through 10
hl.workspace_rule({
  workspace = "1",
  monitor = "HDMI-A-2",
  default = true,
  persistent = true,
})

for i = 2, 10 do
  hl.workspace_rule({
    workspace = tostring(i),
    monitor = "HDMI-A-2",
    persistent = false,
  })
end
