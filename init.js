atom.commands.add('atom-text-editor', 'cool:close-panes', () => {
  const panes = atom.workspace.getPanes()
  const activePane = atom.workspace.getActivePane()
  for (let pane of panes)
    pane !== activePane && pane.destroy()
})
