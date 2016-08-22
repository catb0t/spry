import spryvm

import os

# Spry IO module
proc addIO*(spry: Interpreter) =
  # IO
  nimPrim("echo", false):
    result = spry.nilVal
    echo(print(evalArg(spry)))
  nimPrim("probe", false):
    result = evalArg(spry)
    echo($result)
  nimPrim("existsFile", false):
    let fn = StringVal(evalArg(spry)).value
    newValue(existsFile(fn))
  nimPrim("readFile", false):
    let fn = StringVal(evalArg(spry)).value
    let contents = readFile(fn).string
    newValue(contents)
  nimPrim("writeFile", false):
    let fn = StringVal(evalArg(spry)).value
    result = evalArg(spry)
    writeFile(fn, StringVal(result).value)

