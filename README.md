Portable Windows DLL stub generator. Currently supports Windows
and Linux.

Inspired by
https://www.codeproject.com/Articles/16541/Create-your-Proxy-DLLs-automatically
(mainly the jump table method).

# Installing (Linux)
```bash
git clone https://github.com/Francesco149/stubgen.git
cd stubgen
./build.sh

# I personally prefer to symlink it or have a local bin folder in
# my home directory, but this is the easiest way
sudo cp stubgen /usr/bin
```

# Installing (Windows)
I'm gonna assume you already have visual studio installed, but if
you don't you will need at least the compiler so install Visual C++
Build Tools 2015 or any other version:
http://landinghub.visualstudio.com/visual-cpp-build-tools

Install git bash and

```batch
git clone https://github.com/Francesco149/stubgen.git
```

Open a visual studio command prompt and

```batch
cd C:\path\to\stubgen
build.bat
```

Now you can copy stubgen.exe to anywhere your system can find it,
such as ```C:\Windows\System32``` or ```SysWOW64``` or simply add
stubgen's path to your PATH by running the following in an
administrator command prompt:

```batch
setx PATH "%PATH%;C:\path\to\stubgen" /M
```

# Usage
Generating a stub:

```bash
mkdir mystub
cd mystub
stubgen /path/to/original.dll
```
You can now edit ```dllmain.c``` and ```trampolines.asm``` to hook
functions as you please.

Here is a full example of a project generated with stubgen that
hook a couple OpenGL functions:
https://github.com/Francesco149/stubgen/tree/master/example

To hook a function, remove it from trampolines.asm and define it
with the same name (if you change the name you will have to update
exports.def) and and its proper signature in dllmain.c.

You can call the original functions by getting their pointers from
```hdll``` or more simply, casting the relevant pointer from the
```original_funcs``` array to the correct signature.

You can also have stubgen use inline asm to have all the code in
```dllmain.c```. While this makes editing easier, this only works
for 32-bit DLLs (because msvc doesn't have x64 inline asm) and
therefore isn't recommended. Pass the flag ```i``` to enable this.

Once you're done, you can compile from a visual studio prompt
by running ```build.bat``` or ```build.bat 64``` for 64-bit,
just make sure the target architecture of the visual studio prompt
is the desired one.

# Why make it portable when it's a Windows-specific tool?
I run linux as my daily driver and I occasionally need to develop
hacks or mods for windows stuff. Since I have a working VS2010
install running under wine, I can compile and work with windows
code entirely from linux.

I didn't like running other stub generators (which are windows
only) under wine, so I decided to make my own. This was quickly
put together in a day or so, code quality might not be the best.

# License
This code is public domain and comes with no warranty.
You are free to do whatever you want with it. You can
contact me at lolisamurai@tfwno.gf but don't expect any
support.

I hope you will find the code useful or at least
interesting to read. Have fun!
