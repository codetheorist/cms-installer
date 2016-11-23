#!/usr/bin/env php
<?php
foreach($argv as $arg => $value) {
  echo "{$arg} => {$value}\n";
}
cms_init($argv);
function cms_init($argv) {
  $sep = DIRECTORY_SEPARATOR;
  $found_script = "";
  $cwd = getcwd();
  $home = getenv("HOME");
  $use_dir = "$home{$sep}installer{$sep}use";
  echo $sep . "\n";
  echo $cwd . "\n";
  echo $home . "\n";

  $arguments = $argv;
  array_shift($arguments);

  // We need to do at least a partial parsing of the options,
  // so that we can find --root / -r and so on.
  $VERBOSE=FALSE;
  $DEBUG=FALSE;
  $ROOT=FALSE;
  $COMMAND=FALSE;
  $ALIAS=FALSE;
  $VAR=FALSE;

  foreach ($arguments as $arg) {
    // If a variable to set was indicated on the
    // previous iteration, then set the value of
    // the named variable (e.g. "ROOT") to "$arg".
    if ($VAR) {
      $$VAR = "$arg";
      $VAR = FALSE;
    }
    else {
      switch ($arg) {
        case "-r":
          $VAR = "ROOT";
          break;

        case "-dv":
        case "-vd":
        case "--debug":
        case "-d":
          $DEBUG = TRUE;
          break;

        case "--verbose":
        case "-v":
          $VERBOSE = TRUE;
          break;
      }
      if (!$COMMAND && !$ALIAS && ($arg[0] == '@')) {
        $ALIAS = $arg;
      }
      elseif (!$COMMAND && ($arg[0] != '-')) {
        $COMMAND = $arg;
      }
      if (substr($arg, 0, 7) == "--root=") {
        $ROOT = substr($arg, 7);
      }
    }
  }
  echo $VERBOSE . "\n";
  echo $DEBUG . "\n";
  echo $ROOT . "\n";
  echo $COMMAND . "\n";

}

?>
