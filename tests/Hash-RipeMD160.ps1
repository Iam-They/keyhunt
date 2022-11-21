
$Source = Get-Content './tests/RIPEMD160.cs'
Add-Type -TypeDefinition $Source -Language CSharp

Function Hash-RipeMD160 {
[cmdletbinding()]
Param(
    [Parameter(Mandatory = $True)]
    [ValidateScript({Test-Path $_ })]
    $file
    )
Process {
    $reader = [System.IO.File]::OpenText($file)
    $RIPEMD160 = [RIPEMD160]::Create()
    $encoding = [system.Text.Encoding]::UTF8
    
    try {
        for(;;) {
            $line = $reader.ReadLine()
            if ($line -eq $null) { 
                break 
                }
            $temp = $RIPEMD160.ComputeHash($encoding.GetBytes($line))
            [System.Convert]::ToBase64String($temp)
            }
    }
    finally {
        $reader.Close()
    }
    } #End of Process Block
}
