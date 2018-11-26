Add-Type -AssemblyName System.Windows.Forms

$App = New-Object system.Windows.Forms.Form
$App.ClientSize = '40,65'
$App.text = 'MPos'
$App.FormBorderStyle = 'Fixed3D'
$App.MaximizeBox = $false
$App.MinimizeBox = $false
$App.TopMost = $true
$App.Font = 'Microsoft Sans Serif,10'

$XPos = New-Object system.Windows.Forms.Label
$XPos.location = New-Object System.Drawing.Point(15,10)

$YPos = New-Object system.Windows.Forms.Label
$YPos.location = New-Object System.Drawing.Point(15,40)

function UpdateCoordinates($Label, $Axis)
{
    $Coordinate = [System.Windows.Forms.Cursor]::Position.$Axis
    $Label.text = $Axis + ': ' + $Coordinate
}

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 40
$timer.Add_Tick({UpdateCoordinates $XPos X; UpdateCoordinates $YPos Y})
$timer.Enabled = $True

$App.Controls.AddRange(@($XPos,$YPos))

[void]$App.ShowDialog()