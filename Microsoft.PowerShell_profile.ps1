
function prompt {
    $path = (Get-Location).Path
    $user = $env:USERNAME
    $comp = $env:COMPUTERNAME
    # $venv = if ($env:VIRTUAL_ENV) { "($(Split-Path $env:VIRTUAL_ENV -Leaf)) " } else { "" }

    # Write-Host "$venv$user@$comp " -ForegroundColor Cyan -NoNewline
    Write-Host "$user@$comp " -ForegroundColor Cyan -NoNewline
    Write-Host "$path" -ForegroundColor Yellow
    return "> "
}

Remove-Item Alias:nv -Force
Set-Alias nv nvim

function tree {
    $ignoreFile = ".gitignore"
    $argsList = @()

    if (Test-Path $ignoreFile) {
        $patterns = Get-Content $ignoreFile | Where-Object { $_ -and $_ -notmatch '^#' }
        if ($patterns) {
            $argsList += "-I"
            $argsList += ($patterns -join "|")
        }
    }

    & 'C:/Program Files (x86)/GnuWin32/bin/tree.exe' -L 3 @argsList @args
}
