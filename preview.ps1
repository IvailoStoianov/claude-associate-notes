$env:Path = [Environment]::GetEnvironmentVariable('Path','User') + ';' + [Environment]::GetEnvironmentVariable('Path','Machine')
Set-Location $PSScriptRoot
npx quartz build --serve -d "C:\Users\istoianov\Desktop\Notes\claude-associate"
