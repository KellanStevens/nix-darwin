[
  {
    key = "shift+cmd+2";
    command = "editor.action.changeAll";
    when = "editorTextFocus && !editorReadonly";
  }
  {
    key = "";
    command = "workbench.action.terminal.openNativeConsole";
    when = "!terminalFocus";
  }
  {
    key = "shift+cmd+down";
    command = "cursorBottomSelect";
    when = "textInputFocus";
  }
]
