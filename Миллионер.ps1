$nalogs_base = @(3, 3, 3, 5, 5, 8, 8, 8, 12, 12, 12, 15, 15, 15, 20, 20, 20, 25, 25, 25, 30, 30)
$nalog = @(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
$arenda_base = @(3, 5, 6, 8, 10, 14, 18, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 46, 50, 54, 60)
$arenda = @(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
$houses = @(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
$names = @("Кинотеатр", "Казино", "Ночной клуб", "Шоколадная фабрика", "Пивоваренный завод", "Интернет-провайдер", "Пейджинговая компания", "Оператор сотовой связи", "Обувная фабрика", "Мебельное производство", "Швейное объединение", "Издательский дом", "Радиостанция", "Телевизионная компания", "Железнодорожное предприятие", "Морское пароходство", "Авиокомпания", "Автомобильный завод", "Судостроительный завод", "Металлургический комбинат", "Угольный синдикат", "Нефтяной холдинг", "Машина", "Самолёт", "Яхта", "Поезд")
$owners = @("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
$players = @("", "", "", "", "", "")
$playersNum = 0
$Fortune = 0
$Fortunes = @(
"Всем первым участкам устанавливается аренда - 3 фанта",
"Все участки отрасли `"Добывающая промышленность`" облагаются налогом - 20 фантов",
"Всем третьим участкам устанавливается аренда - 10 фантов",
"Всем третьим участкам устанавливается аренда - 20 фантов",
"Все третьи участки освобождаются от налога",
"Все участки отрасли `"Тяжёлая промышленность`" облагаются налогом - 50 фантов",
"Всем участкам отрасли `"Тяжёлая промышленность`" устанавливается аренда - 10 фантов",
"Всем участка отрасли `"Пищевая промышленность`" устанавливатся аренда - 50 фантов",
"Все вторые участки освобождаются от налога",
"Все участки отрасли `"Средства массовой информации`" освобождаются от налога",
"Всем участкам центральной отрасли устанавливается аренда - 0 фантов",
"Всем участкам отрасли `"Средства массовой информации`" устанавливается аренда - 0 фантов",
"Все участки отрасли `"Связь и коммуникации`" освобождаются от налога",
"Всем третьим участкам устанавливается аренда - 0 фантов",
"Все участки центральной отрасли облагаются двойным налогом",
"Всем вторым участкам устанавливается аренда - 20 фантов",
"Всем участкам отрасли `"Средства массовой информации`" устанавливается аренда - 100 фантов",
"Все участки отрасли `"Пищевая промышленность`" освобождаются от налога",
"Все участки отрасли `"Добывающая промышленность`" облагаются двойным налогом",
"Все участки отрасли `"Лёгкая промышленность`" освобождаются от налога",
"Все участки Транспортной отрасли освобождаются от налога",
"Все третьи участки облагаются двойным налогом")
$playerNalogs = @(0, 0, 0, 0, 0, 0)
$playerPlus = @(0, 0, 0, 0, 0, 0)
$playerCenter = @(0, 0, 0, 0, 0, 0)
$playerCenterNalog = @(0, 0, 0, 0, 0, 0)
$playerProms = @(0, 0, 0, 0, 0, 0)
$zalog = @(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
$promPrice = 100
$promEarn = 20
$promNalog = 0

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Запуск Миллионера'
$form.Size = New-Object System.Drawing.Size(900,600)
$form.StartPosition = 'CenterScreen'

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Имена игроков'
$form.Controls.Add($label)

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(800,520)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'Start'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Location = New-Object System.Drawing.Point(10,40)
$textBox1.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox1)

$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Location = New-Object System.Drawing.Point(10,70)
$textBox2.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox2)

$textBox3 = New-Object System.Windows.Forms.TextBox
$textBox3.Location = New-Object System.Drawing.Point(10,100)
$textBox3.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox3)

$textBox4 = New-Object System.Windows.Forms.TextBox
$textBox4.Location = New-Object System.Drawing.Point(10,130)
$textBox4.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox4)

$textBox5 = New-Object System.Windows.Forms.TextBox
$textBox5.Location = New-Object System.Drawing.Point(10,160)
$textBox5.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox5)

$textBox6 = New-Object System.Windows.Forms.TextBox
$textBox6.Location = New-Object System.Drawing.Point(10,190)
$textBox6.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox6)

$result = $form.ShowDialog()

if($textBox1.Text -ne "")
{$playersNum++
$players[0] = $textBox1.Text}
if($textBox2.Text -ne "")
{$playersNum++
$players[1] = $textBox2.Text}
if($textBox3.Text -ne "")
{$playersNum++
$players[2] = $textBox3.Text}
if($textBox4.Text -ne "")
{$playersNum++
$players[3] = $textBox4.Text}
if($textBox5.Text -ne "")
{$playersNum++
$players[4] = $textBox5.Text}
if($textBox6.Text -ne "")
{$playersNum++
$players[5] = $textBox6.Text}

$tabMain = New-Object System.Windows.Forms.TabPage
$tabMain.Text = "Главная"

function Repaint {
if($Visual.Checked -eq $true){
    [System.Windows.Forms.Application]::EnableVisualStyles()
}
    if ($listBoxPlayer.SelectedIndex -eq 0){
    $owners[$listBoxStreet.SelectedIndex] = ""
    } else {
    $owners[$listBoxStreet.SelectedIndex] = $players[$listBoxPlayer.SelectedIndex - 1]}
    if($listBoxStreet.SelectedIndex -le 21){
        $houses[$listBoxStreet.SelectedIndex] = $listBoxHouse.SelectedIndex
    }

    $Fortune = $textboxFortune.Text

    $promPrice = [int] $textboxPr.Text
    if($listBoxEarn.SelectedItem -eq "%"){
    $promEarn = [int32] $promPrice * $textBoxEarn.Text * 0.01}
    if($listBoxEarn.SelectedItem -eq "Set"){
    $promEarn = $textBoxEarn.Text}
    $playerProms[0] = $textboxPlayer1.Text
    $playerProms[1] = $textboxPlayer2.Text
    $playerProms[2] = $textboxPlayer3.Text
    $playerProms[3] = $textboxPlayer4.Text
    $playerProms[4] = $textboxPlayer5.Text
    $playerProms[5] = $textboxPlayer6.Text
    $promNalog = [int] $textboxPNalog.Text

$tabMain.Controls.Clear()
$playerNalogs = @(0, 0, 0, 0, 0, 0)
$playerPlus = @(0, 0, 0, 0, 0, 0)
$playerCenterNalog = @(0, 0, 0, 0, 0, 0)


#Counting A
$a = 0
$b = 1
$c = 2
if((($owners[$a] -eq $owners[$b]) -and ($owners[$a] -eq $owners[$c])) -and ($owners[$a].Length -gt 0)){
    for($i = $a; $i -le $c){
    switch($houses[$i]){
    0{$nalog[$i] = $nalogs_base[$i] * 2
     $arenda[$i] = $arenda_base[$i] * 2}
    1{$nalog[$i] = $nalogs_base[$i] * 3
     $arenda[$i] = $arenda_base[$i] * 4}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 6}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 8}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 10}
    }
    $i++
    }
    
} else {
    $nalog[$a] = $nalogs_base[$a]
    $nalog[$b] = $nalogs_base[$b]
    $nalog[$c] = $nalogs_base[$c]
    $arenda[$a] = $arenda_base[$a]
    $arenda[$b] = $arenda_base[$b]
    $arenda[$c] = $arenda_base[$c]
}

#Counting B
$a = 3
$b = 4
if(($owners[$a] -eq $owners[$b]) -and ($owners[$a].Length -gt 0)){
    for($i = $a; $i -le $b){
    switch($houses[$i]){
    0{$nalog[$i] = $nalogs_base[$i] * 2
     $arenda[$i] = $arenda_base[$i] * 2}
    1{$nalog[$i] = $nalogs_base[$i] * 3
     $arenda[$i] = $arenda_base[$i] * 4}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 6}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 8}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 10}
    }
    $i++
    }
    
} else {
    $nalog[$a] = $nalogs_base[$a]
    $nalog[$b] = $nalogs_base[$b]
    $arenda[$a] = $arenda_base[$a]
    $arenda[$b] = $arenda_base[$b]
}

#Counting C
$a = 5
$b = 6
$c = 7
if((($owners[$a] -eq $owners[$b]) -and ($owners[$a] -eq $owners[$c])) -and ($owners[$a].Length -gt 0)){
    for($i = $a; $i -le $c){
    switch($houses[$i]){
    0{$nalog[$i] = $nalogs_base[$i] * 2
     $arenda[$i] = $arenda_base[$i] * 2}
    1{$nalog[$i] = $nalogs_base[$i] * 3
     $arenda[$i] = $arenda_base[$i] * 4}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 6}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 8}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 10}
    }
    $i++
    }
    
} else {
    $nalog[$a] = $nalogs_base[$a]
    $nalog[$b] = $nalogs_base[$b]
    $nalog[$c] = $nalogs_base[$c]
    $arenda[$a] = $arenda_base[$a]
    $arenda[$b] = $arenda_base[$b]
    $arenda[$c] = $arenda_base[$c]
}

#Counting D
$a = 8
$b = 9
$c = 10
if((($owners[$a] -eq $owners[$b]) -and ($owners[$a] -eq $owners[$c])) -and ($owners[$a].Length -gt 0)){
    for($i = $a; $i -le $c){
    switch($houses[$i]){
    0{$nalog[$i] = $nalogs_base[$i] * 2
     $arenda[$i] = $arenda_base[$i] * 2}
    1{$nalog[$i] = $nalogs_base[$i] * 3
     $arenda[$i] = $arenda_base[$i] * 4}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 6}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 8}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 10}
    }
    $i++
    }
    
} else {
    $nalog[$a] = $nalogs_base[$a]
    $nalog[$b] = $nalogs_base[$b]
    $nalog[$c] = $nalogs_base[$c]
    $arenda[$a] = $arenda_base[$a]
    $arenda[$b] = $arenda_base[$b]
    $arenda[$c] = $arenda_base[$c]
}

#Counting E
$a = 11
$b = 12
$c = 13
if((($owners[$a] -eq $owners[$b]) -and ($owners[$a] -eq $owners[$c])) -and ($owners[$a].Length -gt 0)){
    for($i = $a; $i -le $c){
    switch($houses[$i]){
    0{$nalog[$i] = $nalogs_base[$i] * 2
     $arenda[$i] = $arenda_base[$i] * 2}
    1{$nalog[$i] = $nalogs_base[$i] * 3
     $arenda[$i] = $arenda_base[$i] * 4}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 6}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 8}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 10}
    }
    $i++
    }
    
} else {
    $nalog[$a] = $nalogs_base[$a]
    $nalog[$b] = $nalogs_base[$b]
    $nalog[$c] = $nalogs_base[$c]
    $arenda[$a] = $arenda_base[$a]
    $arenda[$b] = $arenda_base[$b]
    $arenda[$c] = $arenda_base[$c]
}

#Counting F
$a = 14
$b = 15
$c = 16
if((($owners[$a] -eq $owners[$b]) -and ($owners[$a] -eq $owners[$c])) -and ($owners[$a].Length -gt 0)){
    for($i = $a; $i -le $c){
    switch($houses[$i]){
    0{$nalog[$i] = $nalogs_base[$i] * 2
     $arenda[$i] = $arenda_base[$i] * 2}
    1{$nalog[$i] = $nalogs_base[$i] * 3
     $arenda[$i] = $arenda_base[$i] * 4}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 6}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 8}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 10}
    }
    $i++
    }
    
} else {
    $nalog[$a] = $nalogs_base[$a]
    $nalog[$b] = $nalogs_base[$b]
    $nalog[$c] = $nalogs_base[$c]
    $arenda[$a] = $arenda_base[$a]
    $arenda[$b] = $arenda_base[$b]
    $arenda[$c] = $arenda_base[$c]
}

#Counting G
$a = 17
$b = 18
$c = 19
if((($owners[$a] -eq $owners[$b]) -and ($owners[$a] -eq $owners[$c])) -and ($owners[$a].Length -gt 0)){
    for($i = $a; $i -le $c){
    switch($houses[$i]){
    0{$nalog[$i] = $nalogs_base[$i] * 2
     $arenda[$i] = $arenda_base[$i] * 2}
    1{$nalog[$i] = $nalogs_base[$i] * 3
     $arenda[$i] = $arenda_base[$i] * 4}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 6}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 8}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 10}
    }
    $i++
    }
    
} else {
    $nalog[$a] = $nalogs_base[$a]
    $nalog[$b] = $nalogs_base[$b]
    $nalog[$c] = $nalogs_base[$c]
    $arenda[$a] = $arenda_base[$a]
    $arenda[$b] = $arenda_base[$b]
    $arenda[$c] = $arenda_base[$c]
}

#Counting H
$a = 20
$b = 21
if(($owners[$a] -eq $owners[$b]) -and ($owners[$a].Length -gt 0)){
    for($i = $a; $i -le $b){
    switch($houses[$i]){
    0{$nalog[$i] = $nalogs_base[$i] * 2
     $arenda[$i] = $arenda_base[$i] * 2}
    1{$nalog[$i] = $nalogs_base[$i] * 3
     $arenda[$i] = $arenda_base[$i] * 4}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 6}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 8}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 10}
    }
    $i++
    }
    
} else {
    $nalog[$a] = $nalogs_base[$a]
    $nalog[$b] = $nalogs_base[$b]
    $arenda[$a] = $arenda_base[$a]
    $arenda[$b] = $arenda_base[$b]
}

#Counting Central
$playerCenter = @(0, 0, 0, 0, 0, 0)
$arenda[22] = 0
$arenda[23] = 0
$arenda[24] = 0
$arenda[25] = 0
for($i = 0; $i -lt 6){
    $strNum = 0
    for($j = 22; $j -le 25){
        if(($owners[$j] -eq $players[$i]) -and ($owners[$j].Length -gt 0)){$strNum++}
        $j++
    }
    for($j = 22; $j -le 25){
        if(($owners[$j] -eq $players[$i]) -and ($owners[$j].Length -gt 0)){
        switch($strNum){
            1{$arenda[$j] = 30
              $nalog[$j] = 10
              $playerCenter[$i] = 30
              $playerCenterNalog[$i] = 10}
            2{$arenda[$j] = 100
              $nalog[$j] = 40
              $playerCenter[$i] = 100
              $playerCenterNalog[$i] = 40}
            3{$arenda[$j] = 200
              $nalog[$j] = 80
              $playerCenter[$i] = 200
              $playerCenterNalog[$i] = 80}
            4{$arenda[$j] = 500
              $nalog[$j] = 100
              $playerCenter[$i] = 500
              $playerCenterNalog[$i] = 100}
        }
        }
        $j++
    }
    $i++
}

#Counting Fortune
switch($textboxFortune.Text){
"Всем первым участкам устанавливается аренда - 3 фанта"{
    $arenda[0] = 3
    $arenda[3] = 3
    $arenda[5] = 3
    $arenda[8] = 3
    $arenda[11] = 3
    $arenda[14] = 3
    $arenda[17] = 3
    $arenda[20] = 3
}
"Все участки отрасли `"Добывающая промышленность`" облагаются налогом - 20 фантов"{
    $nalog[20] = 20
    $nalog[21] = 20
}
"Всем третьим участкам устанавливается аренда - 10 фантов"{
    $arenda[2] = 10
    $arenda[7] = 10
    $arenda[10] = 10
    $arenda[13] = 10
    $arenda[16] = 10
    $arenda[19] = 10
}
"Всем третьим участкам устанавливается аренда - 20 фантов"{
    $arenda[2] = 20
    $arenda[7] = 20
    $arenda[10] = 20
    $arenda[13] = 20
    $arenda[16] = 20
    $arenda[19] = 20
}
"Все третьи участки освобождаются от налога"{
    $nalog[2] = 0
    $nalog[7] = 0
    $nalog[10] = 0
    $nalog[13] = 0
    $nalog[16] = 0
    $nalog[19] = 0
}
"Все участки отрасли `"Тяжёлая промышленность`" облагаются налогом - 50 фантов" {
    $nalog[17] = 50
    $nalog[18] = 50
    $nalog[19] = 50
}
"Всем участкам отрасли `"Тяжёлая промышленность`" устанавливается аренда - 10 фантов"{
    $arenda[17] = 10
    $arenda[18] = 10
    $arenda[19] = 10
}
"Всем участка отрасли `"Пищевая промышленность`" устанавливатся аренда - 50 фантов"{
    $arenda[3] = 50
    $arenda[4] = 50
}
"Все вторые участки освобождаются от налога"{
    $nalog[1] = 0
    $nalog[4] = 0
    $nalog[6] = 0
    $nalog[9] = 0
    $nalog[12] = 0
    $nalog[15] = 0
    $nalog[18] = 0
    $nalog[21] = 0
}
"Все участки отрасли `"Средства массовой информации`" освобождаются от налога"{
    $nalog[11] = 0
    $nalog[12] = 0
    $nalog[13] = 0
}
"Всем участкам центральной отрасли устанавливается аренда - 0 фантов"{
    $arenda[22] = 0
    $arenda[23] = 0
    $arenda[24] = 0
    $arenda[25] = 0
    $playerCenter = @(0, 0, 0, 0, 0, 0)
}
"Всем участкам отрасли `"Средства массовой информации`" устанавливается аренда - 0 фантов"{
    $arenda[11] = 0
    $arenda[12] = 0
    $arenda[13] = 0
}
"Все участки отрасли `"Связь и коммуникации`" освобождаются от налога"{
    $nalog[5] = 0
    $nalog[6] = 0
    $nalog[7] = 0
}
"Всем третьим участкам устанавливается аренда - 0 фантов"{
    $arenda[2] = 0
    $arenda[7] = 0
    $arenda[10] = 0
    $arenda[13] = 0
    $arenda[16] = 0
    $arenda[19] = 0
}
"Все участки центральной отрасли облагаются двойным налогом"{
    $nalog[22] *= 2
    $nalog[23] *= 2
    $nalog[24] *= 2
    $nalog[25] *= 2
    $playerCenterNalog[0] *= 2
    $playerCenterNalog[1] *= 2
    $playerCenterNalog[2] *= 2
    $playerCenterNalog[3] *= 2
    $playerCenterNalog[4] *= 2
    $playerCenterNalog[5] *= 2
}
"Всем вторым участкам устанавливается аренда - 20 фантов"{
	$arenda[1] = 20
    $arenda[4] = 20
    $arenda[6] = 20
    $arenda[9] = 20
    $arenda[12] = 20
    $arenda[15] = 20
    $arenda[18] = 20
    $arenda[21] = 20
}
"Всем участкам отрасли `"Средства массовой информации`" устанавливается аренда - 100 фантов"{
    $arenda[11] = 100
    $arenda[12] = 100
    $arenda[13] = 100
}
"Все участки отрасли `"Пищевая промышленность`" освобождаются от налога"{
    $nalog[3] = 0
    $nalog[4] = 0
}
"Все участки отрасли `"Добывающая промышленность`" облагаются двойным налогом"{
    $nalog[20] *= 2
    $nalog[21] *= 2
}
"Все участки отрасли `"Лёгкая промышленность`" освобождаются от налога"{
    $nalog[8] = 0
    $nalog[9] = 0
    $nalog[10] = 0
}
"Все участки Транспортной отрасли освобождаются от налога"{
    $nalog[14] = 0
    $nalog[15] = 0
    $nalog[16] = 0
}
"Все третьи участки облагаются двойным налогом"{
    $nalog[2] *= 2
    $nalog[7] *= 2
    $nalog[10] *= 2
    $nalog[13] *= 2
    $nalog[16] *= 2
    $nalog[19] *= 2
}
}

for($i = 0; $i -le 25){
    if($owners[$i].Length -lt 1){
    $nalog[$i] = $null
    $arenda[$i] = $null}
    $i++
}

#Counting zalog
for($i = 0; $i -lt 26; $i++){
    if($zalog[$i] -eq 1){
        $arenda[$i] = 0
        $nalog[$i] = 0}
}

#Counting player total
for($i = 0; $i -le 5){
for($j = 0; $j -le 21){
    if($owners[$j] -eq $players[$i]){
        $playerNalogs[$i] += $nalog[$j]
    }
$j++
}
$i++
}
$playerNalogs[0] += $playerCenterNalog[0]
$playerNalogs[1] += $playerCenterNalog[1]
$playerNalogs[2] += $playerCenterNalog[2]
$playerNalogs[3] += $playerCenterNalog[3]
$playerNalogs[4] += $playerCenterNalog[4]
$playerNalogs[5] += $playerCenterNalog[5]
$playerNalogs[0] += [int] $playerProms[0] * $promNalog
$playerNalogs[1] += [int] $playerProms[1] * $promNalog
$playerNalogs[2] += [int] $playerProms[2] * $promNalog
$playerNalogs[3] += [int] $playerProms[3] * $promNalog
$playerNalogs[4] += [int] $playerProms[4] * $promNalog
$playerNalogs[5] += [int] $playerProms[5] * $promNalog
$playerPlus[0] = [int] $playerProms[0] * [int] $promEarn
$playerPlus[1] = [int] $playerProms[1] * [int] $promEarn
$playerPlus[2] = [int] $playerProms[2] * [int] $promEarn
$playerPlus[3] = [int] $playerProms[3] * [int] $promEarn
$playerPlus[4] = [int] $playerProms[0] * [int] $promEarn
$playerPlus[5] = [int] $playerProms[5] * [int] $promEarn
if($playersNum -lt 1){
$playerNalogs[0] = $null
$playerPlus[0] = $null}
if($playersNum -lt 2){
$playerNalogs[1] = $null
$playerPlus[1] = $null}
if($playersNum -lt 3){
$playerNalogs[2] = $null
$playerPlus[2] = $null}
if($playersNum -lt 4){
$playerNalogs[3] = $null
$playerPlus[3] = $null}
if($playersNum -lt 5){
$playerNalogs[4] = $null
$playerPlus[4] = $null}
if($playersNum -lt 6){
$playerNalogs[5] = $null
$playerPlus[5] = $null}



    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,10)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = 'Улица'
    $tabMain.Controls.Add($label)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(250,10)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = 'Владелец'
    $tabMain.Controls.Add($label)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(350,10)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Аренда'
    $tabMain.Controls.Add($label)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(400,10)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Налог'
    $tabMain.Controls.Add($label)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(500,10)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Игрок'
    $tabMain.Controls.Add($label)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(600,10)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Налог'
    $tabMain.Controls.Add($label)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(650,10)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Акции'
    $tabMain.Controls.Add($label)

    for($i = 0; $i -le 25){
        $label = New-Object System.Windows.Forms.Label
        $label.Location = New-Object System.Drawing.Point(10, ($i * 20 + 40))
        $label.Size = New-Object System.Drawing.Size(200,20)
        $label.Text = $names[$i]
        if ($zalog[$i] -eq 1) {$label.Enabled = $false}
        $tabMain.Controls.Add($label)
        $i++
    }

    for($i = 0; $i -le 25){
        $label = New-Object System.Windows.Forms.Label
        $label.Location = New-Object System.Drawing.Point(250, ($i * 20 + 40))
        $label.Size = New-Object System.Drawing.Size(100,20)
        $label.Text = $owners[$i]
        if ($zalog[$i] -eq 1) {$label.Enabled = $false}
        $tabMain.Controls.Add($label)
        $i++
    }

    for($i = 0; $i -le 25){
        $label = New-Object System.Windows.Forms.Label
        $label.Location = New-Object System.Drawing.Point(350, ($i * 20 + 40))
        $label.Size = New-Object System.Drawing.Size(50,20)
        $label.Text = $arenda[$i]
        $label.Enabled = $true
        if ($zalog[$i] -eq 1) {$label.Enabled = $false}
        $tabMain.Controls.Add($label)
        $i++
    }

    for($i = 0; $i -le 25){
        $label = New-Object System.Windows.Forms.Label
        $label.Location = New-Object System.Drawing.Point(400, ($i * 20 + 40))
        $label.Size = New-Object System.Drawing.Size(50,20)
        $label.Text = $nalog[$i]
        if ($zalog[$i] -eq 1) {$label.Enabled = $false}
        $tabMain.Controls.Add($label)
        $i++
    }

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(500,40)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[0]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(500,60)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[1]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(500,80)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[2]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(500,100)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[3]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(500,120)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[4]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(500,140)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[5]
    $tabMain.Controls.Add($label)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(600,40)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerNalogs[0]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(600,60)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerNalogs[1]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(600,80)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerNalogs[2]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(600,100)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerNalogs[3]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(600,120)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerNalogs[4]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(600,140)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerNalogs[5]
    $tabMain.Controls.Add($label)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(650,40)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerPlus[0]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(650,60)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerPlus[1]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(650,80)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerPlus[2]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(650,100)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerPlus[3]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(650,120)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerPlus[4]
    $tabMain.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(650,140)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $playerPlus[5]
    $tabMain.Controls.Add($label)
    Write-Output Repainted
}
Repaint
$result = [System.Windows.Forms.DialogResult]::OK
while($result -ne [System.Windows.Forms.DialogResult]::Cancel){

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Миллионер'
$form.Size = New-Object System.Drawing.Size(935, 690)
$form.MinimumSize = New-Object System.Drawing.Size(935, 690)
$form.StartPosition = 'CenterScreen'

$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Location = New-Object System.Drawing.Point(10, 10)
$tabControl.Size = New-Object System.Drawing.Size(900, 630)

$tabStreet = New-Object System.Windows.Forms.TabPage
$tabStreet.Text = "Редактировать улицу"
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,10)
    $label.Size = New-Object System.Drawing.Size(880,20)
    $label.Text = 'Улица'
    $tabStreet.Controls.Add($label)

    $listBoxStreet = New-Object System.Windows.Forms.ListBox
    $listBoxStreet.Location = New-Object System.Drawing.Point(10,30)
    $listBoxStreet.Size = New-Object System.Drawing.Size(860,20)
    $listBoxStreet.Height = 345
    $listBoxStreet.Enabled = $true
    for($i = 0; $i -le 25){
        $listBoxStreet.Items.Add($names[$i])
        $i++
    }
    $listBoxStreet.Add_SelectedIndexChanged({
        $listBoxHouse.SelectedIndex = $houses[$listBoxStreet.SelectedIndex]
        if($owners[$listBoxStreet.SelectedIndex] -eq ""){
            $listBoxPlayer.SelectedIndex = 0
        } else {
        $listBoxPlayer.SelectedItem = $owners[$listBoxStreet.SelectedIndex]}
        if($listBoxStreet.SelectedIndex -gt 21){
            $listBoxHouse.Enabled = $false
            $listBoxHouse.SelectedItem = "Нет построек"}
        else{$listBoxHouse.Enabled = $true}
        if ($zalog[$listBoxStreet.SelectedIndex] -eq 0){
        $ZZalog.Checked = $false} else {$ZZalog.Checked = $true}
    })
    $tabStreet.Controls.Add($listBoxStreet)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,375)
    $label.Size = New-Object System.Drawing.Size(280,15)
    $label.Text = 'Владелец'
    $tabStreet.Controls.Add($label)

    $listBoxPlayer = New-Object System.Windows.Forms.ListBox
    $listBoxPlayer.Location = New-Object System.Drawing.Point(10,390)
    $listBoxPlayer.Size = New-Object System.Drawing.Size(860,20)
    $listBoxPlayer.Height = 100
    $listBoxPlayer.Add_SelectedIndexChanged({
        Repaint
    })
    [void] $listBoxPlayer.Items.Add("Нет владельца")
    for($i = 0; $i -lt $playersNum){
        $listBoxPlayer.Items.Add($players[$i])
        $i++
    }
    $tabStreet.Controls.Add($listBoxPlayer)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,490)
    $label.Size = New-Object System.Drawing.Size(60,15)
    $label.Text = 'Постройки'
    $tabStreet.Controls.Add($label)

    $listBoxHouse = New-Object System.Windows.Forms.ListBox
    $listBoxHouse.Location = New-Object System.Drawing.Point(10,505)
    $listBoxHouse.Size = New-Object System.Drawing.Size(260,20)
    $listBoxHouse.Height = 80
    [void] $listBoxHouse.Items.Add("Нет построек")
    [void] $listBoxHouse.Items.Add("1 Филиал")
    [void] $listBoxHouse.Items.Add("2 Филиала")
    [void] $listBoxHouse.Items.Add("3 Филиала")
    [void] $listBoxHouse.Items.Add("Предприятие")
    $listBoxHouse.Add_SelectedIndexChanged({
        Repaint
    })
    $tabStreet.Controls.Add($listBoxHouse)

    $ZZalog = New-Object System.Windows.Forms.CheckBox
    $ZZalog.Location = New-Object System.Drawing.Point(300,500)
    $ZZalog.Size = New-Object System.Drawing.Size(200,20)
    $ZZalog.Text = 'Заложена'
    $ZZalog.Add_CheckedChanged({
        if ($ZZalog.Checked) {
            $zalog[$listBoxStreet.SelectedIndex] = 1
        } else {
            $zalog[$listBoxStreet.SelectedIndex] = 0}
        Repaint})
    $tabStreet.Controls.Add($ZZalog)

$tabFortune = New-Object System.Windows.Forms.TabPage
$tabFortune.Text = "Фортуна"
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,12.5)
    $label.Size = New-Object System.Drawing.Size(120,20)
    $label.Text = 'Выберите Фортуну'
    $tabFortune.Controls.Add($label)

    $textboxFortune = New-Object System.Windows.Forms.TextBox
    $textboxFortune.Location = New-Object System.Drawing.Point(130,10) 
    $textboxFortune.Size = New-Object System.Drawing.Size(700,20)
    $textboxFortune.AutoCompleteMode = [System.Windows.Forms.AutoCompleteMode]::SuggestAppend
    $textboxFortune.AutoCompleteSource = [System.Windows.Forms.AutoCompleteSource]::CustomSource
    $textboxFortune.AutoCompleteCustomSource.AddRange($Fortunes)
    $textboxFortune.Add_TextChanged({
        Repaint
    })
    $tabFortune.Controls.Add($textboxFortune)
    
$tabProm = New-Object System.Windows.Forms.TabPage
$tabProm.Text = "Акции"
    if($Visual.Checked -eq $true){
        [System.Windows.Forms.Application]::EnableVisualStyles()
    }
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,10)
    $label.Size = New-Object System.Drawing.Size(70,20)
    $label.Text = 'Стоимость'
    $tabProm.Controls.Add($label)

    $textboxPr = New-Object System.Windows.Forms.TextBox
    $textboxPr.Location = New-Object System.Drawing.Point(80,10) 
    $textboxPr.Size = New-Object System.Drawing.Size(300,20)
    $textBoxPr.Text = $promPrice
    $textBoxPr.Add_TextChanged({
        Repaint
    })
    $tabProm.Controls.Add($textboxPr)
    
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(390,10)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Налог'
    $tabProm.Controls.Add($label)

    $textboxPNalog = New-Object System.Windows.Forms.TextBox
    $textboxPNalog.Location = New-Object System.Drawing.Point(440,10) 
    $textboxPNalog.Size = New-Object System.Drawing.Size(300,20)
    $textboxPNalog.Text = 10
    $textboxPNalog.Add_TextChanged({
        Repaint
    })
    $tabProm.Controls.Add($textBoxPNalog)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,30)
    $label.Size = New-Object System.Drawing.Size(60,20)
    $label.Text = 'Доход'
    $tabProm.Controls.Add($label)

    $listBoxEarn = New-Object System.Windows.Forms.ListBox
    $listBoxEarn.Location = New-Object System.Drawing.Point(80,30)
    $listBoxEarn.Size = New-Object System.Drawing.Size(30,20)
    $listBoxEarn.Height = 40
    [void] $listBoxEarn.Items.Add("%")
    [void] $listBoxEarn.Items.Add("=")
    $listBoxEarn.SelectedItem = "%"
    $listBoxEarn.Add_SelectedIndexChanged({
        Repaint
    })
    $tabProm.Controls.Add($listBoxEarn)

    $textBoxEarn = New-Object System.Windows.Forms.TextBox
    $textBoxEarn.Location = New-Object System.Drawing.Point(110,30) 
    $textBoxEarn.Size = New-Object System.Drawing.Size(270,20)
    $textBoxEarn.Text = 20
    $textBoxEarn.Add_TextChanged({
        Repaint
    })
    $tabProm.Controls.Add($textBoxEarn)
    
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,60)
    $label.Size = New-Object System.Drawing.Size(150,20)
    $label.Text = 'Количество акций игроков'
    $tabProm.Controls.Add($label)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,80)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[0]
    $tabProm.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,100)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[1]
    $tabProm.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,120)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[2]
    $tabProm.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,140)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[3]
    $tabProm.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,160)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[4]
    $tabProm.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,180)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[5]
    $tabProm.Controls.Add($label)
    
    $textboxPlayer1 = New-Object System.Windows.Forms.TextBox
    $textboxPlayer1.Location = New-Object System.Drawing.Point(110,80) 
    $textboxPlayer1.Size = New-Object System.Drawing.Size(300,20)
    $textboxPlayer1.Text = 0
    $textboxPlayer1.Add_TextChanged({
        Repaint
    })
    
    $textboxPlayer2 = New-Object System.Windows.Forms.TextBox
    $textboxPlayer2.Location = New-Object System.Drawing.Point(110,100) 
    $textboxPlayer2.Size = New-Object System.Drawing.Size(300,20)
    $textboxPlayer2.Text = 0
    $textboxPlayer2.Add_TextChanged({
        Repaint
    })

    $textboxPlayer3 = New-Object System.Windows.Forms.TextBox
    $textboxPlayer3.Location = New-Object System.Drawing.Point(110,120) 
    $textboxPlayer3.Size = New-Object System.Drawing.Size(300,20)
    $textboxPlayer3.Text = 0
    $textboxPlayer3.Add_TextChanged({
        Repaint
    })

    $textboxPlayer4 = New-Object System.Windows.Forms.TextBox
    $textboxPlayer4.Location = New-Object System.Drawing.Point(110,140) 
    $textboxPlayer4.Size = New-Object System.Drawing.Size(300,20)
    $textboxPlayer4.Text = 0
    $textboxPlayer4.Add_TextChanged({
        Repaint
    })

    $textboxPlayer5 = New-Object System.Windows.Forms.TextBox
    $textboxPlayer5.Location = New-Object System.Drawing.Point(110,160) 
    $textboxPlayer5.Size = New-Object System.Drawing.Size(300,20)
    $textboxPlayer5.Text = 0
    $textboxPlayer5.Add_TextChanged({
        Repaint
    })

    $textboxPlayer6 = New-Object System.Windows.Forms.TextBox
    $textboxPlayer6.Location = New-Object System.Drawing.Point(110,180) 
    $textboxPlayer6.Size = New-Object System.Drawing.Size(300,20)
    $textboxPlayer6.Text = 0
    $textboxPlayer6.Add_TextChanged({
        Repaint
    })

    $textBoxPlayer1.Visible = $true
    $textBoxPlayer2.Visible = $true
    $textBoxPlayer3.Visible = $true
    $textBoxPlayer4.Visible = $true
    $textBoxPlayer5.Visible = $true
    $textBoxPlayer6.Visible = $true

    switch($playersNum){
    0{
    $textBoxPlayer1.Visible = $false
    $textBoxPlayer2.Visible = $false
    $textBoxPlayer3.Visible = $false
    $textBoxPlayer4.Visible = $false
    $textBoxPlayer5.Visible = $false
    $textBoxPlayer6.Visible = $false
    }
    1{
    $textBoxPlayer2.Visible = $false
    $textBoxPlayer3.Visible = $false
    $textBoxPlayer4.Visible = $false
    $textBoxPlayer5.Visible = $false
    $textBoxPlayer6.Visible = $false
    }
    2{
    $textBoxPlayer3.Visible = $false
    $textBoxPlayer4.Visible = $false
    $textBoxPlayer5.Visible = $false
    $textBoxPlayer6.Visible = $false
    }
    3{
    $textBoxPlayer4.Visible = $false
    $textBoxPlayer5.Visible = $false
    $textBoxPlayer6.Visible = $false
    }
    4{
    $textBoxPlayer5.Visible = $false
    $textBoxPlayer6.Visible = $false
    }
    5{
    $textBoxPlayer6.Visible = $false
    }
    }

    $tabProm.Controls.Add($textboxPlayer1)
    $tabProm.Controls.Add($textboxPlayer2)
    $tabProm.Controls.Add($textboxPlayer3)
    $tabProm.Controls.Add($textboxPlayer4)
    $tabProm.Controls.Add($textboxPlayer5)
    $tabProm.Controls.Add($textboxPlayer6)

$tabExp = New-Object System.Windows.Forms.TabPage
$tabExp.Text = "Экспорт"
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,10)
    $label.Size = New-Object System.Drawing.Size(150,20)
    $label.Text = "Введите баланс игроков:"
    $tabExp.Controls.Add($label)

    $Player1 = New-Object System.Windows.Forms.TextBox
    $Player1.Location = New-Object System.Drawing.Point(10,30)
    $Player1.Size = New-Object System.Drawing.Size(150,20)
    $Player1.Text = 0
    $tabExp.Controls.Add($Player1)

    $Player2 = New-Object System.Windows.Forms.TextBox
    $Player2.Location = New-Object System.Drawing.Point(10,50)
    $Player2.Size = New-Object System.Drawing.Size(150,20)
    $Player2.Text = 0
    $tabExp.Controls.Add($Player2)

    $Player3 = New-Object System.Windows.Forms.TextBox
    $Player3.Location = New-Object System.Drawing.Point(10,70)
    $Player3.Size = New-Object System.Drawing.Size(150,20)
    $Player3.Text = 0
    $tabExp.Controls.Add($Player3)

    $Player4 = New-Object System.Windows.Forms.TextBox
    $Player4.Location = New-Object System.Drawing.Point(10,90)
    $Player4.Size = New-Object System.Drawing.Size(150,20)
    $Player4.Text = 0
    $tabExp.Controls.Add($Player4)

    $Player5 = New-Object System.Windows.Forms.TextBox
    $Player5.Location = New-Object System.Drawing.Point(10,110)
    $Player5.Size = New-Object System.Drawing.Size(150,20)
    $Player5.Text = 0
    $tabExp.Controls.Add($Player5)

    $Player6 = New-Object System.Windows.Forms.TextBox
    $Player6.Location = New-Object System.Drawing.Point(10,130)
    $Player6.Size = New-Object System.Drawing.Size(150,20)
    $Player6.Text = 0
    $tabExp.Controls.Add($Player6)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(200,10)
    $label.Size = New-Object System.Drawing.Size(250,20)
    $label.Text = "Введите количество страховок: З    С    О    К"
    $tabExp.Controls.Add($label)


    $Player11 = New-Object System.Windows.Forms.TextBox
    $Player11.Location = New-Object System.Drawing.Point(365,30)
    $Player11.Size = New-Object System.Drawing.Size(20,20)
    $Player11.Text = 0
    $tabExp.Controls.Add($Player11)

    $Player12 = New-Object System.Windows.Forms.TextBox
    $Player12.Location = New-Object System.Drawing.Point(385,30)
    $Player12.Size = New-Object System.Drawing.Size(20,20)
    $Player12.Text = 0
    $tabExp.Controls.Add($Player12)

    $Player13 = New-Object System.Windows.Forms.TextBox
    $Player13.Location = New-Object System.Drawing.Point(405,30)
    $Player13.Size = New-Object System.Drawing.Size(20,20)
    $Player13.Text = 0
    $tabExp.Controls.Add($Player13)

    $Player14 = New-Object System.Windows.Forms.TextBox
    $Player14.Location = New-Object System.Drawing.Point(425,30)
    $Player14.Size = New-Object System.Drawing.Size(20,20)
    $Player14.Text = 0
    $tabExp.Controls.Add($Player14)


    $Player21 = New-Object System.Windows.Forms.TextBox
    $Player21.Location = New-Object System.Drawing.Point(365,50)
    $Player21.Size = New-Object System.Drawing.Size(20,20)
    $Player21.Text = 0
    $tabExp.Controls.Add($Player21)

    $Player22 = New-Object System.Windows.Forms.TextBox
    $Player22.Location = New-Object System.Drawing.Point(385,50)
    $Player22.Size = New-Object System.Drawing.Size(20,20)
    $Player22.Text = 0
    $tabExp.Controls.Add($Player22)

    $Player23 = New-Object System.Windows.Forms.TextBox
    $Player23.Location = New-Object System.Drawing.Point(405,50)
    $Player23.Size = New-Object System.Drawing.Size(20,20)
    $Player23.Text = 0
    $tabExp.Controls.Add($Player23)

    $Player24 = New-Object System.Windows.Forms.TextBox
    $Player24.Location = New-Object System.Drawing.Point(425,50)
    $Player24.Size = New-Object System.Drawing.Size(20,20)
    $Player24.Text = 0
    $tabExp.Controls.Add($Player24)


    $Player31 = New-Object System.Windows.Forms.TextBox
    $Player31.Location = New-Object System.Drawing.Point(365,70)
    $Player31.Size = New-Object System.Drawing.Size(20,20)
    $Player31.Text = 0
    $tabExp.Controls.Add($Player31)

    $Player32 = New-Object System.Windows.Forms.TextBox
    $Player32.Location = New-Object System.Drawing.Point(385,70)
    $Player32.Size = New-Object System.Drawing.Size(20,20)
    $Player32.Text = 0
    $tabExp.Controls.Add($Player32)

    $Player33 = New-Object System.Windows.Forms.TextBox
    $Player33.Location = New-Object System.Drawing.Point(405,70)
    $Player33.Size = New-Object System.Drawing.Size(20,20)
    $Player33.Text = 0
    $tabExp.Controls.Add($Player33)

    $Player34 = New-Object System.Windows.Forms.TextBox
    $Player34.Location = New-Object System.Drawing.Point(425,70)
    $Player34.Size = New-Object System.Drawing.Size(20,20)
    $Player34.Text = 0
    $tabExp.Controls.Add($Player34)


    $Player41 = New-Object System.Windows.Forms.TextBox
    $Player41.Location = New-Object System.Drawing.Point(365,90)
    $Player41.Size = New-Object System.Drawing.Size(20,20)
    $Player41.Text = 0
    $tabExp.Controls.Add($Player41)

    $Player42 = New-Object System.Windows.Forms.TextBox
    $Player42.Location = New-Object System.Drawing.Point(385,90)
    $Player42.Size = New-Object System.Drawing.Size(20,20)
    $Player42.Text = 0
    $tabExp.Controls.Add($Player42)

    $Player43 = New-Object System.Windows.Forms.TextBox
    $Player43.Location = New-Object System.Drawing.Point(405,90)
    $Player43.Size = New-Object System.Drawing.Size(20,20)
    $Player43.Text = 0
    $tabExp.Controls.Add($Player43)

    $Player44 = New-Object System.Windows.Forms.TextBox
    $Player44.Location = New-Object System.Drawing.Point(425,90)
    $Player44.Size = New-Object System.Drawing.Size(20,20)
    $Player44.Text = 0
    $tabExp.Controls.Add($Player44)


    $Player51 = New-Object System.Windows.Forms.TextBox
    $Player51.Location = New-Object System.Drawing.Point(365,110)
    $Player51.Size = New-Object System.Drawing.Size(20,20)
    $Player51.Text = 0
    $tabExp.Controls.Add($Player51)

    $Player52 = New-Object System.Windows.Forms.TextBox
    $Player52.Location = New-Object System.Drawing.Point(385,110)
    $Player52.Size = New-Object System.Drawing.Size(20,20)
    $Player52.Text = 0
    $tabExp.Controls.Add($Player52)

    $Player53 = New-Object System.Windows.Forms.TextBox
    $Player53.Location = New-Object System.Drawing.Point(405,110)
    $Player53.Size = New-Object System.Drawing.Size(20,20)
    $Player53.Text = 0
    $tabExp.Controls.Add($Player53)

    $Player54 = New-Object System.Windows.Forms.TextBox
    $Player54.Location = New-Object System.Drawing.Point(425,110)
    $Player54.Size = New-Object System.Drawing.Size(20,20)
    $Player54.Text = 0
    $tabExp.Controls.Add($Player54)


    $Player61 = New-Object System.Windows.Forms.TextBox
    $Player61.Location = New-Object System.Drawing.Point(365,130)
    $Player61.Size = New-Object System.Drawing.Size(20,20)
    $Player61.Text = 0
    $tabExp.Controls.Add($Player61)

    $Player62 = New-Object System.Windows.Forms.TextBox
    $Player62.Location = New-Object System.Drawing.Point(385,130)
    $Player62.Size = New-Object System.Drawing.Size(20,20)
    $Player62.Text = 0
    $tabExp.Controls.Add($Player62)

    $Player63 = New-Object System.Windows.Forms.TextBox
    $Player63.Location = New-Object System.Drawing.Point(405,130)
    $Player63.Size = New-Object System.Drawing.Size(20,20)
    $Player63.Text = 0
    $tabExp.Controls.Add($Player63)

    $Player64 = New-Object System.Windows.Forms.TextBox
    $Player64.Location = New-Object System.Drawing.Point(425,130)
    $Player64.Size = New-Object System.Drawing.Size(20,20)
    $Player64.Text = 0
    $tabExp.Controls.Add($Player64)


    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,170)
    $label.Size = New-Object System.Drawing.Size(300,20)
    $label.Text = "Введите номер поля игроков (Старт - 0):"
    $tabExp.Controls.Add($label)

    
    $PlacePlayer1 = New-Object System.Windows.Forms.TextBox
    $PlacePlayer1.Location = New-Object System.Drawing.Point(10,190)
    $PlacePlayer1.Size = New-Object System.Drawing.Size(150,20)
    $PlacePlayer1.Text = 0
    $tabExp.Controls.Add($PlacePlayer1)

    $PlacePlayer2 = New-Object System.Windows.Forms.TextBox
    $PlacePlayer2.Location = New-Object System.Drawing.Point(10,210)
    $PlacePlayer2.Size = New-Object System.Drawing.Size(150,20)
    $PlacePlayer2.Text = 0
    $tabExp.Controls.Add($PlacePlayer2)

    $PlacePlayer3 = New-Object System.Windows.Forms.TextBox
    $PlacePlayer3.Location = New-Object System.Drawing.Point(10,230)
    $PlacePlayer3.Size = New-Object System.Drawing.Size(150,20)
    $PlacePlayer3.Text = 0
    $tabExp.Controls.Add($PlacePlayer3)

    $PlacePlayer4 = New-Object System.Windows.Forms.TextBox
    $PlacePlayer4.Location = New-Object System.Drawing.Point(10,250)
    $PlacePlayer4.Size = New-Object System.Drawing.Size(150,20)
    $PlacePlayer4.Text = 0
    $tabExp.Controls.Add($PlacePlayer4)

    $PlacePlayer5 = New-Object System.Windows.Forms.TextBox
    $PlacePlayer5.Location = New-Object System.Drawing.Point(10,270)
    $PlacePlayer5.Size = New-Object System.Drawing.Size(150,20)
    $PlacePlayer5.Text = 0
    $tabExp.Controls.Add($PlacePlayer5)

    $PlacePlayer6 = New-Object System.Windows.Forms.TextBox
    $PlacePlayer6.Location = New-Object System.Drawing.Point(10,290)
    $PlacePlayer6.Size = New-Object System.Drawing.Size(150,20)
    $PlacePlayer6.Text = 0
    $tabExp.Controls.Add($PlacePlayer6)


    $Export = New-Object System.Windows.Forms.Button
    $Export.Location = New-Object System.Drawing.Point(805,570)
    $Export.Size = New-Object System.Drawing.Size(75,23)
    $Export.Text = 'Экспорт'
    $Export.Add_Click({
        Repaint
        $jsonExport = @{
            players = $players
            playersNum = $playersNum

            playerBalance = @($Player1.Text, $Player2.Text, $Player3.Text, $Player4.Text, $Player5.Text, $Player6.Text)
            playerStrah = @($Player11.Text, $Player12.Text, $Player13.Text, $Player14.Text, $Player21.Text, $Player22.Text, $Player23.Text, $Player24.Text, $Player31.Text, $Player32.Text, $Player33.Text, $Player34.Text, $Player41.Text, $Player42.Text, $Player43.Text, $Player44.Text, $Player51.Text, $Player52.Text, $Player53.Text, $Player54.Text, $Player61.Text, $Player62.Text, $Player63.Text, $Player64.Text)
            playerPos = @($PlacePlayer1.Text, $PlacePlayer2.Text, $PlacePlayer3.Text, $PlacePlayer4.Text, $PlacePlayer5.Text, $PlacePlayer6.Text)

            owners = $owners
            zalog = $zalog
            
            fortune = $textboxFortune.Text
            
            playersProms = $playerProms
            promPrice = $textboxPr.Text
            promEarn =  $textBoxEarn.Text
            promNalog = $textboxPNalog.Text
            promEarnType = $listBoxEarn.SelectedItem
        }

        $saveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
        $saveFileDialog.Filter = 'JSON Files (*.json)|*.json'
        $saveFileDialog.InitialDirectory = [Environment]::GetFolderPath('Desktop')

        if ($saveFileDialog.ShowDialog() -eq 'OK') {
            $content = $jsonExport | ConvertTo-Json
            Set-Content -Path $saveFileDialog.FileName -Value $content
        }
    })
    $tabExp.Controls.Add($Export)

    $Import = New-Object System.Windows.Forms.Button
    $Import.Location = New-Object System.Drawing.Point(730,570)
    $Import.Size = New-Object System.Drawing.Size(75,23)
    $Import.Text = 'Импорт'
    $Import.Add_Click({
        $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
        $openFileDialog.Filter = 'JSON Files (*.json)|*.json'
        $openFileDialog.InitialDirectory = [Environment]::GetFolderPath('Desktop')

        if ($openFileDialog.ShowDialog() -eq 'OK') {
            $jsonContent = Get-Content -Path $openFileDialog.FileName -Raw
            $jsonObject = $jsonContent | ConvertFrom-Json
            
            $script:players = $jsonObject.players
            $script:playersNum = $jsonObject.playersNum

            $Player1.Text = $jsonObject.playerBalance[0]
            $Player2.Text = $jsonObject.playerBalance[1]
            $Player3.Text = $jsonObject.playerBalance[2]
            $Player4.Text = $jsonObject.playerBalance[3]
            $Player5.Text = $jsonObject.playerBalance[4]
            $Player6.Text = $jsonObject.playerBalance[5]

            $Player11.Text = $jsonObject.playerStrah[0]
            $Player12.Text = $jsonObject.playerStrah[1]
            $Player13.Text = $jsonObject.playerStrah[2]
            $Player14.Text = $jsonObject.playerStrah[3]
            $Player21.Text = $jsonObject.playerStrah[4]
            $Player22.Text = $jsonObject.playerStrah[5]
            $Player23.Text = $jsonObject.playerStrah[6]
            $Player24.Text = $jsonObject.playerStrah[7]
            $Player31.Text = $jsonObject.playerStrah[8]
            $Player32.Text = $jsonObject.playerStrah[9]
            $Player33.Text = $jsonObject.playerStrah[10]
            $Player34.Text = $jsonObject.playerStrah[11]
            $Player41.Text = $jsonObject.playerStrah[12]
            $Player42.Text = $jsonObject.playerStrah[13]
            $Player43.Text = $jsonObject.playerStrah[14]
            $Player44.Text = $jsonObject.playerStrah[15]
            $Player51.Text = $jsonObject.playerStrah[16]
            $Player52.Text = $jsonObject.playerStrah[17]
            $Player53.Text = $jsonObject.playerStrah[18]
            $Player54.Text = $jsonObject.playerStrah[19]
            $Player61.Text = $jsonObject.playerStrah[20]
            $Player62.Text = $jsonObject.playerStrah[21]
            $Player63.Text = $jsonObject.playerStrah[22]
            $Player64.Text = $jsonObject.playerStrah[23]

            $PlacePlayer1.Text = $jsonObject.playerPos[0]
            $PlacePlayer2.Text = $jsonObject.playerPos[1]
            $PlacePlayer3.Text = $jsonObject.playerPos[2]
            $PlacePlayer4.Text = $jsonObject.playerPos[3]
            $PlacePlayer5.Text = $jsonObject.playerPos[4]
            $PlacePlayer6.Text = $jsonObject.playerPos[5]

            $script:owners = $jsonObject.owners
            $script:zalog = $jsonObject.zalog

            $textboxFortune.Text = $jsonObject.fortune

            $textboxPlayer1.Text = $jsonObject.playersProms[0]
            $textboxPlayer2.Text = $jsonObject.playersProms[1]
            $textboxPlayer3.Text = $jsonObject.playersProms[2]
            $textboxPlayer4.Text = $jsonObject.playersProms[3]
            $textboxPlayer5.Text = $jsonObject.playersProms[4]
            $textboxPlayer6.Text = $jsonObject.playersProms[5]

            $textboxPr.Text = $jsonObject.promPrice
            $textBoxEarn.Text = $jsonObject.promEarn
            $textboxPNalog.Text = $jsonObject.promNalog
            $listBoxEarn.SelectedItem = $jsonObject.promEarnType

            $listBoxPlayer.Items.Clear()
            $listBoxPlayer.Items.Add("Нет владельца")
            for ($i = 0; $i -lt $playersNum; $i++)
            {$listBoxPlayer.Items.Add($jsonObject.players[$i])}
            
            
            $textBoxPlayer1.Visible = $true
            $textBoxPlayer2.Visible = $true
            $textBoxPlayer3.Visible = $true
            $textBoxPlayer4.Visible = $true
            $textBoxPlayer5.Visible = $true
            $textBoxPlayer6.Visible = $true

            switch($playersNum){
            0{
            $textBoxPlayer1.Visible = $false
            $textBoxPlayer2.Visible = $false
            $textBoxPlayer3.Visible = $false
            $textBoxPlayer4.Visible = $false
            $textBoxPlayer5.Visible = $false
            $textBoxPlayer6.Visible = $false
            }
            1{
            $textBoxPlayer2.Visible = $false
            $textBoxPlayer3.Visible = $false
            $textBoxPlayer4.Visible = $false
            $textBoxPlayer5.Visible = $false
            $textBoxPlayer6.Visible = $false
            }
            2{
            $textBoxPlayer3.Visible = $false
            $textBoxPlayer4.Visible = $false
            $textBoxPlayer5.Visible = $false
            $textBoxPlayer6.Visible = $false
            }
            3{
            $textBoxPlayer4.Visible = $false
            $textBoxPlayer5.Visible = $false
            $textBoxPlayer6.Visible = $false
            }
            4{
            $textBoxPlayer5.Visible = $false
            $textBoxPlayer6.Visible = $false
            }
            5{
            $textBoxPlayer6.Visible = $false
            }
            }

            $labelsToRemove = $tabProm.Controls | Where-Object { $_ -is [System.Windows.Forms.Label] }
            foreach ($label in $labelsToRemove) {
                $tabProm.Controls.Remove($label)
            }

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,10)
            $label.Size = New-Object System.Drawing.Size(70,20)
            $label.Text = 'Стоимость'
            $tabProm.Controls.Add($label)
            
            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(390,10)
            $label.Size = New-Object System.Drawing.Size(50,20)
            $label.Text = 'Налог'
            $tabProm.Controls.Add($label)

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,30)
            $label.Size = New-Object System.Drawing.Size(60,20)
            $label.Text = 'Доход'
            $tabProm.Controls.Add($label)
            
            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,60)
            $label.Size = New-Object System.Drawing.Size(150,20)
            $label.Text = 'Количество акций игроков'
            $tabProm.Controls.Add($label)


            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,80)
            $label.Size = New-Object System.Drawing.Size(100,20)
            $label.Text = $players[0]
            $tabProm.Controls.Add($label)
            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,100)
            $label.Size = New-Object System.Drawing.Size(100,20)
            $label.Text = $players[1]
            $tabProm.Controls.Add($label)
            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,120)
            $label.Size = New-Object System.Drawing.Size(100,20)
            $label.Text = $players[2]
            $tabProm.Controls.Add($label)
            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,140)
            $label.Size = New-Object System.Drawing.Size(100,20)
            $label.Text = $players[3]
            $tabProm.Controls.Add($label)
            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,160)
            $label.Size = New-Object System.Drawing.Size(100,20)
            $label.Text = $players[4]
            $tabProm.Controls.Add($label)
            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,180)
            $label.Size = New-Object System.Drawing.Size(100,20)
            $label.Text = $players[5]
            $tabProm.Controls.Add($label)

            Repaint
            }})
    $tabExp.Controls.Add($Import)


$tabControl.Controls.Add($tabMain)
$tabControl.Controls.Add($tabStreet)
$tabControl.Controls.Add($tabFortune)
$tabControl.Controls.Add($tabProm)
$tabControl.Controls.Add($tabExp)

$form.Controls.Add($tabControl)

$result = $form.ShowDialog()
}