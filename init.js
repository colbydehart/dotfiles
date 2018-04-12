exec = require('child_process').exec;

atom.commands.add('atom-text-editor', 'cool:close-panes', () => {
  const panes = atom.workspace.getPanes();
  const activePane = atom.workspace.getActivePane();
  for (let pane of panes) {
    pane !== activePane && pane.destroy();
  }
});

atom.commands.add('atom-text-editor', 'cool:print-grammar', () => {
  const gram = atom.workspace.getActiveTextEditor().getGrammar().scopeName;
  atom.notifications.addInfo(gram);
});

atom.commands.add('atom-text-editor', 'cool:scratch', () => {
  atom.workspace.open('/Users/colbydehart/.scratch');
});

atom.commands.add('atom-text-editor', 'cool:org', () => {
  atom.workspace.open('/Users/colbydehart/org/gtd.org');
});
