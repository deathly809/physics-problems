
Function New-Latex {
    [cmdletbinding()]
    param(

        [Parameter(Mandatory=$true)]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$Chapter,
        
        [Parameter(Mandatory=$true)]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$Entries,

        [ValidateSet('Discussions','Exercises')]
        [System.String]$Type
    )
    [System.String]$result = ""
    $mapping = @{
        Discussions = '\discussion';
        Exercises = '\exercise';
    }
    for($i = 1; $i -le $Entries; $i++) {
        $result += "% $Chapter.$i`n$($mapping[$Type]){`n`n}`n`n"
    }
    
    Write-Output -InputObject $result.Substring(0,$result.Length-2)
}