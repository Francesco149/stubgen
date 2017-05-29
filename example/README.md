A minimal example on how you can hook functions with a proxy DLL.

Also explains stubgen's file/code structure.

# Usage
Open a 32-bit Visual Studio Command Prompt and:

```
cd C:\path\to\example
build.bat
test
```

The text overlay should appear.

Now remove or rename opengl32.dll then run test again, the text
overlay will be gone, as it's not being hooked anymore.

To build for 64-bit, just open a 64-bit command prompt instead and:

```
cd C:\path\to\example
build.bat 64
test
```

Note that normally, stubgen will generate code that loads a renamed
version of the original dll from the current directory.

This example loads the system dll from System32/SysWOW64 instead
because it makes sense in this case.

The renaming method is more useful if you want to replace a dll
bundled with a program/game.

