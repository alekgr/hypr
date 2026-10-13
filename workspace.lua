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

for id = 11, 14 do
  hl.workspace_rule({
    workspace = tostring(id),
    -- Pulls the workspace layout boundaries into a beautiful 70% viewport card
    gaps_out = { 160, 280, 160, 280 }
  })
end
