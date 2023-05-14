# Powershell Scripts

## write-verbose and write-information doesn't output anything

why:

- Both Write-Verbose and Write-Information are silent by default, as is Write-Debug.
- Starting in Windows PowerShell 5.0, Write-Host is a wrapper for Write-Information

so use:
`write-host` instead of `write-information`

and add:

````powershell
 [cmdletbinding()]
 Param()
````

to make `write-verbose` working

- source: https://stackoverflow.com/questions/64436812/write-information-does-not-appear-to-work-in-powershell-foreach-object-parallell
- Links
    - https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-verbose?view=powershell-7.3
    - https://devblogs.microsoft.com/scripting/use-powershell-to-write-verbose-output/

### Links

- https://www.msxfaq.de/code/powershell/writehostdebugging.htm

## Links

- https://www.msxfaq.de/code/powershell/index.htm
