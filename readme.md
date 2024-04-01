# Compiling directly ILASM Code POC
POC to create binaries direcly using [Intermediate Language (IL) or Common Intermediate Language (CIL) or Microsoft Intermediate Language (MSIL)](https://ecma-international.org/publications-and-standards/standards/ecma-335/)
to run on the [Common Language Runtime (CLR)](https://learn.microsoft.com/en-us/dotnet/standard/clr).  

# Requirements

## Instal Dotnet SDK
https://dotnet.microsoft.com/en-us/download

## Getting ilasm and ildasm tools
Replace `<arch>` with `linux-x64`, `osx-x64` or `win-x64` as you need.

```bash
wget https://globalcdn.nuget.org/packages/runtime.<arch>.microsoft.netcore.ildasm.8.0.0.nupkg
wget https://globalcdn.nuget.org/packages/runtime.<arch>.microsoft.netcore.ilasm.8.0.0.nupkg
```

Unzip the files
```bash
unzip runtime.<arch>.microsoft.netcore.ilasm.8.0.0.nupkg -d iltools/
unzip runtime.<arch>.microsoft.netcore.ildasm.8.0.0.nupkg -d iltools/
```

Navigate into and give execution permissions
```bash
cd `iltools/runtimes/<arch>/native/`
chmod +x ilasm ildasm
```

You can also make alias in your bashrc file to make easier to call those tools
```bash
alias ilasm="/path-to/iltools/runtimes/<arch>/native/ilasm"
alias ildasm="/path-to/iltools/runtimes/<arch>/native/ildasm"
```

ILTools (ilasm and ildasm) are ready to use.

# Compiling
```bash
ilasm -dll MathLib.il -output=target/MathLib.dll
ilasm -exe TestMath.il -output=target/TestMath.exe
```

# Running
Make sure the file `target/TestMath.runtimeconfig.json` exists and run
```bash
dotnet target/TestMath.exe
```

You should get the following output
```bash
Square (With default Constructor) : 225
Propert Value Set to : 25
Square (After Setting property) : 625
Programme is finished...
```

# References
https://apisuckage.wordpress.com/2010/01/04/learning-il-hello-world-in-cil/
https://community.ibm.com/community/user/powerdeveloper/blogs/vikas-gupta/2023/02/22/debugging-with-ilasm-and-ildasm
https://www.codeproject.com/Articles/3778/Introduction-to-IL-Assembly-Language
https://natemcmaster.com/blog/2017/12/21/netcore-primitives/
https://ecma-international.org/wp-content/uploads/ECMA-335_6th_edition_june_2012.pdf
