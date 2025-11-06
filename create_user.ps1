Import-Module ActiveDirectory

# === CONFIGURACIÓN ===
$FirstName = Read-Host "Ingrese el nombre"
$LastName  = Read-Host "Ingrese el apellido"
$Username  = Read-Host "Ingrese el nombre de usuario"
$Password  = Read-Host "Ingrese la contraseña" -AsSecureString
$OU        = "OU=Telvgg,DC=ad,DC=telvgg,DC=coop"  
$Group     = "Sistemas"                 

# === CREAR USUARIO ===
New-ADUser `
    -GivenName $FirstName `
    -Surname $LastName `
    -Name "$FirstName $LastName" `
    -SamAccountName $Username `
    -UserPrincipalName "$Username@ad.telvgg.coop" `
    -AccountPassword $Password `
    -Path $OU `
    -Enabled $true `
    -ChangePasswordAtLogon $true

	
Read-Host "Presione Enter para salir..."
Write-Host "Usuario $Username creado exitosamente."