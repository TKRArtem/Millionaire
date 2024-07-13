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
$promPrice = 100
$promEarn = 20
$promNalog = 0

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$result = [System.Windows.Forms.DialogResult]::OK
$listBoxEarn = New-Object System.Windows.Forms.ListBox
$listBoxEarn.Location = New-Object System.Drawing.Point(60,30)
$listBoxEarn.Size = New-Object System.Drawing.Size(30,20)
$listBoxEarn.Height = 40
[void] $listBoxEarn.Items.Add("%")
[void] $listBoxEarn.Items.Add("Set")
$listBoxEarn.SelectedItem = "%"

$textBoxEarn = New-Object System.Windows.Forms.TextBox
$textBoxEarn.Location = New-Object System.Drawing.Point(90,30) 
$textBoxEarn.Size = New-Object System.Drawing.Size(270,20)
$textBoxEarn.Text = 20


$textboxPlayer1 = New-Object System.Windows.Forms.TextBox
$textboxPlayer1.Location = New-Object System.Drawing.Point(110,80) 
$textboxPlayer1.Size = New-Object System.Drawing.Size(300,20)
$textboxPlayer1.Text = 0
              
$textboxPlayer2 = New-Object System.Windows.Forms.TextBox
$textboxPlayer2.Location = New-Object System.Drawing.Point(110,100) 
$textboxPlayer2.Size = New-Object System.Drawing.Size(300,20)
$textboxPlayer2.Text = 0
              
$textboxPlayer3 = New-Object System.Windows.Forms.TextBox
$textboxPlayer3.Location = New-Object System.Drawing.Point(110,120) 
$textboxPlayer3.Size = New-Object System.Drawing.Size(300,20)
$textboxPlayer3.Text = 0
              
$textboxPlayer4 = New-Object System.Windows.Forms.TextBox
$textboxPlayer4.Location = New-Object System.Drawing.Point(110,140) 
$textboxPlayer4.Size = New-Object System.Drawing.Size(300,20)
$textboxPlayer4.Text = 0
              
$textboxPlayer5 = New-Object System.Windows.Forms.TextBox
$textboxPlayer5.Location = New-Object System.Drawing.Point(110,160) 
$textboxPlayer5.Size = New-Object System.Drawing.Size(300,20)
$textboxPlayer5.Text = 0
              
$textboxPlayer6 = New-Object System.Windows.Forms.TextBox
$textboxPlayer6.Location = New-Object System.Drawing.Point(110,180) 
$textboxPlayer6.Size = New-Object System.Drawing.Size(300,20)
$textboxPlayer6.Text = 0

$textboxPr = New-Object System.Windows.Forms.TextBox
$textboxPr.Location = New-Object System.Drawing.Point(60,10) 
$textboxPr.Size = New-Object System.Drawing.Size(300,20)
$textBoxPr.Text = $promPrice

$textboxPNalog = New-Object System.Windows.Forms.TextBox
$textboxPNalog.Location = New-Object System.Drawing.Point(420,10) 
$textboxPNalog.Size = New-Object System.Drawing.Size(300,20)
$textboxPNalog.Text = 10

$textboxFortune = New-Object System.Windows.Forms.TextBox
$textboxFortune.Location = New-Object System.Drawing.Point(110,10) 
$textboxFortune.Size = New-Object System.Drawing.Size(700,20)
$textboxFortune.AutoCompleteMode = [System.Windows.Forms.AutoCompleteMode]::SuggestAppend
$textboxFortune.AutoCompleteSource = [System.Windows.Forms.AutoCompleteSource]::CustomSource
$textboxFortune.AutoCompleteCustomSource.AddRange($Fortunes)

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Millioner - Setup'
$form.Size = New-Object System.Drawing.Size(900,600)
$form.StartPosition = 'CenterScreen'

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Player names'
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


$result = [System.Windows.Forms.DialogResult]::OK
while($result -ne [System.Windows.Forms.DialogResult]::Cancel){
#Counting A
$playerNalogs = @(0, 0, 0, 0, 0, 0)
$playerPlus = @(0, 0, 0, 0, 0, 0)
$playerCenterNalog = @(0, 0, 0, 0, 0, 0)
$a = 0
$b = 1
$c = 2
if((($owners[$a] -eq $owners[$b]) -and ($owners[$a] -eq $owners[$c])) -and ($owners[$a].Length -gt 0)){
    for($i = $a; $i -le $c){
    switch($houses[$i]){
    0{$nalog[$i] = $nalogs_base[$i] * 2
     $arenda[$i] = $arenda_base[$i] * 2}
    1{$nalog[$i] = $nalogs_base[$i] * 3
     $arenda[$i] = $arenda_base[$i] * 3}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 4}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 5}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 6}
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
     $arenda[$i] = $arenda_base[$i] * 3}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 4}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 5}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 6}
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
     $arenda[$i] = $arenda_base[$i] * 3}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 4}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 5}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 6}
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
     $arenda[$i] = $arenda_base[$i] * 3}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 4}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 5}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 6}
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
     $arenda[$i] = $arenda_base[$i] * 3}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 4}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 5}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 6}
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
     $arenda[$i] = $arenda_base[$i] * 3}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 4}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 5}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 6}
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
     $arenda[$i] = $arenda_base[$i] * 3}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 4}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 5}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 6}
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
     $arenda[$i] = $arenda_base[$i] * 3}
    2{$nalog[$i] = $nalogs_base[$i] * 4
     $arenda[$i] = $arenda_base[$i] * 4}
    3{$nalog[$i] = $nalogs_base[$i] * 5
     $arenda[$i] = $arenda_base[$i] * 5}
    4{$nalog[$i] = $nalogs_base[$i] * 6
     $arenda[$i] = $arenda_base[$i] * 6}
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


$form = New-Object System.Windows.Forms.Form
$form.Text = 'Millioner'
$form.Size = New-Object System.Drawing.Size(900,650)
$form.StartPosition = 'CenterScreen'

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10)
$label.Size = New-Object System.Drawing.Size(880,20)
$label.Text = 'Select option'
$form.Controls.Add($label)

$editButton = New-Object System.Windows.Forms.Button
$editButton.Location = New-Object System.Drawing.Point(10,30)
$editButton.Size = New-Object System.Drawing.Size(75,23)
$editButton.Text = 'Edit Street'
$editButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $editButton
$editButton.Add_Click({
    $form.Close()
    $form = New-Object System.Windows.Forms.Form
    $form.Text = 'Millioner - Edit street'
    $form.Size = New-Object System.Drawing.Size(900,650)
    $form.StartPosition = 'CenterScreen'

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,10)
    $label.Size = New-Object System.Drawing.Size(880,20)
    $label.Text = 'Street'
    $form.Controls.Add($label)

    $listBoxStreet = New-Object System.Windows.Forms.ListBox
    $listBoxStreet.Location = New-Object System.Drawing.Point(10,30)
    $listBoxStreet.Size = New-Object System.Drawing.Size(860,20)
    $listBoxStreet.Height = 200
    $listBoxStreet.Enabled = $true
    for($i = 0; $i -le 25){
        $listBoxStreet.Items.Add($names[$i])
        $i++
    }
    $form.Controls.Add($listBoxStreet)

    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Location = New-Object System.Drawing.Point(800,570)
    $okButton.Size = New-Object System.Drawing.Size(75,23)
    $okButton.Text = 'OK'
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.AcceptButton = $okButton
    $form.Controls.Add($okButton)

    $result = $form.ShowDialog()

    $listBoxStreet.Enabled = $false

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,230)
    $label.Size = New-Object System.Drawing.Size(280,20)
    $label.Text = 'Owner'
    $form.Controls.Add($label)

    $listBoxPlayer = New-Object System.Windows.Forms.ListBox
    $listBoxPlayer.Location = New-Object System.Drawing.Point(10,250)
    $listBoxPlayer.Size = New-Object System.Drawing.Size(860,20)
    $listBoxPlayer.Height = 100
    [void] $listBoxPlayer.Items.Add("No owner")
    for($i = 0; $i -lt $playersNum){
        $listBoxPlayer.Items.Add($players[$i])
        $i++
    }
    $listBoxPlayer.SelectedItem = $owners[$listBoxStreet.SelectedIndex]
    $form.Controls.Add($listBoxPlayer)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,350)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Houses'
    $form.Controls.Add($label)

    $listBoxHouse = New-Object System.Windows.Forms.ListBox
    $listBoxHouse.Location = New-Object System.Drawing.Point(60,350)
    $listBoxHouse.Size = New-Object System.Drawing.Size(260,20)
    $listBoxHouse.Height = 80
    [void] $listBoxHouse.Items.Add("Нет построек")
    [void] $listBoxHouse.Items.Add("1 Филиал")
    [void] $listBoxHouse.Items.Add("2 Филиала")
    [void] $listBoxHouse.Items.Add("3 Филиала")
    [void] $listBoxHouse.Items.Add("Предприятие")
    $listBoxHouse.SelectedIndex = $houses[$listBoxStreet.SelectedIndex]
    if($listBoxStreet.SelectedIndex -gt 21){$listBoxHouse.Enabled = $false}
    else{$listBoxHouse.Enabled = $true}
    $form.Controls.Add($listBoxHouse)


    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Location = New-Object System.Drawing.Point(800,570)
    $okButton.Size = New-Object System.Drawing.Size(75,23)
    $okButton.Text = 'OK'
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.AcceptButton = $okButton
    $form.Controls.Add($okButton)

    $form.ShowDialog()

    $owners[$listBoxStreet.SelectedIndex] = $players[$listBoxPlayer.SelectedIndex - 1]
    $listBoxPlayer.SelectedIndex + 1
    $houses[$listBoxStreet.SelectedIndex] = $listBoxHouse.SelectedIndex
})
$form.Controls.Add($editButton)

$editButton = New-Object System.Windows.Forms.Button
$editButton.Location = New-Object System.Drawing.Point(95,30)
$editButton.Size = New-Object System.Drawing.Size(75,23)
$editButton.Text = 'Fortune'
$editButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $editButton
$editButton.Add_Click({
    $form.Close()
    $form = New-Object System.Windows.Forms.Form
    $form.Text = 'Millioner - Fortune'
    $form.Size = New-Object System.Drawing.Size(900,650)
    $form.StartPosition = 'CenterScreen'

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,10)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = 'Select fortune'
    $form.Controls.Add($label)

    

    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Location = New-Object System.Drawing.Point(800,570)
    $okButton.Size = New-Object System.Drawing.Size(75,23)
    $okButton.Text = 'Select'
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.AcceptButton = $okButton
    $form.Controls.Add($okButton)

    $form.Controls.Add($textboxFortune)

    $form.ShowDialog()

    $Fortune = $textBox.Text
})
$form.Controls.Add($editButton)

$editButton = New-Object System.Windows.Forms.Button
$editButton.Location = New-Object System.Drawing.Point(180,30)
$editButton.Size = New-Object System.Drawing.Size(75,23)
$editButton.Text = 'Promotions'
$editButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $editButton
$editButton.Add_Click({
    $form.Close()
    $form2 = New-Object System.Windows.Forms.Form
    $form2.Text = 'Millioner - Promotions'
    $form2.Size = New-Object System.Drawing.Size(900,650)
    $form2.StartPosition = 'CenterScreen'

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,10)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Price'
    $form2.Controls.Add($label)

    $form2.Controls.Add($textboxPr)
    
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(370,10)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Tax'
    $form2.Controls.Add($label)

    $form2.Controls.Add($textBoxPNalog)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,30)
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = 'Earn'

    $form2.Controls.Add($label)

    $form2.Controls.Add($listBoxEarn)

    $form2.Controls.Add($textBoxEarn)
    
    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Location = New-Object System.Drawing.Point(800,570)
    $okButton.Size = New-Object System.Drawing.Size(75,23)
    $okButton.Text = 'OK'
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form2.AcceptButton = $okButton
    $form2.Controls.Add($okButton)
    
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,60)
    $label.Size = New-Object System.Drawing.Size(150,20)
    $label.Text = 'Players Promotions Number'
    $form2.Controls.Add($label)

    

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,80)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[0]
    $form2.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,100)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[1]
    $form2.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,120)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[2]
    $form2.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,140)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[3]
    $form2.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,160)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[4]
    $form2.Controls.Add($label)
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,180)
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $players[5]
    $form2.Controls.Add($label)


    $textBoxPlayer1.Enabled = $true
    $textBoxPlayer2.Enabled = $true
    $textBoxPlayer3.Enabled = $true
    $textBoxPlayer4.Enabled = $true
    $textBoxPlayer5.Enabled = $true
    $textBoxPlayer6.Enabled = $true

    switch($playersNum){
    0{
    $textBoxPlayer1.Enabled = $false
    $textBoxPlayer2.Enabled = $false
    $textBoxPlayer3.Enabled = $false
    $textBoxPlayer4.Enabled = $false
    $textBoxPlayer5.Enabled = $false
    $textBoxPlayer6.Enabled = $false
    }
    1{
    $textBoxPlayer2.Enabled = $false
    $textBoxPlayer3.Enabled = $false
    $textBoxPlayer4.Enabled = $false
    $textBoxPlayer5.Enabled = $false
    $textBoxPlayer6.Enabled = $false
    }
    2{
    $textBoxPlayer3.Enabled = $false
    $textBoxPlayer4.Enabled = $false
    $textBoxPlayer5.Enabled = $false
    $textBoxPlayer6.Enabled = $false
    }
    3{
    $textBoxPlayer4.Enabled = $false
    $textBoxPlayer5.Enabled = $false
    $textBoxPlayer6.Enabled = $false
    }
    4{
    $textBoxPlayer5.Enabled = $false
    $textBoxPlayer6.Enabled = $false
    }
    5{
    $textBoxPlayer6.Enabled = $false
    }
    }

    $form2.Controls.Add($textboxPlayer1)
    $form2.Controls.Add($textboxPlayer2)
    $form2.Controls.Add($textboxPlayer3)
    $form2.Controls.Add($textboxPlayer4)
    $form2.Controls.Add($textboxPlayer5)
    $form2.Controls.Add($textboxPlayer6)

    $result = $form2.ShowDialog()

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
})
$form.Controls.Add($editButton)


#$listBox = New-Object System.Windows.Forms.ListBox
#$listBox.Location = New-Object System.Drawing.Point(10,30)
#$listBox.Size = New-Object System.Drawing.Size(860,20)
#$listBox.Height = 40
#[void] $listBox.Items.Add("Edit street")
#[void] $listBox.Items.Add("Fortune")
#[void] $listBox.Items.Add("Promotions")
#$form.Controls.Add($listBox)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,60)
$label.Size = New-Object System.Drawing.Size(100,20)
$label.Text = 'Street'
$form.Controls.Add($label)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(250,60)
$label.Size = New-Object System.Drawing.Size(100,20)
$label.Text = 'Owner'
$form.Controls.Add($label)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(350,60)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = 'Rent'
$form.Controls.Add($label)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(400,60)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = 'Tax'
$form.Controls.Add($label)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(500,60)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = 'Player'
$form.Controls.Add($label)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(600,60)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = 'Tax'
$form.Controls.Add($label)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(650,60)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = 'Prom.'
$form.Controls.Add($label)

for($i = 0; $i -le 25){
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10, ($i * 20 + 80))
    $label.Size = New-Object System.Drawing.Size(200,20)
    $label.Text = $names[$i]
    $form.Controls.Add($label)
    $i++
}

for($i = 0; $i -le 25){
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(250, ($i * 20 + 80))
    $label.Size = New-Object System.Drawing.Size(100,20)
    $label.Text = $owners[$i]
    $form.Controls.Add($label)
    $i++
}

for($i = 0; $i -le 25){
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(350, ($i * 20 + 80))
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $arenda[$i]
    $form.Controls.Add($label)
    $i++
}

for($i = 0; $i -le 25){
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(400, ($i * 20 + 80))
    $label.Size = New-Object System.Drawing.Size(50,20)
    $label.Text = $nalog[$i]
    $form.Controls.Add($label)
    $i++
}

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(500,80)
$label.Size = New-Object System.Drawing.Size(100,20)
$label.Text = $players[0]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(500,100)
$label.Size = New-Object System.Drawing.Size(100,20)
$label.Text = $players[1]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(500,120)
$label.Size = New-Object System.Drawing.Size(100,20)
$label.Text = $players[2]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(500,140)
$label.Size = New-Object System.Drawing.Size(100,20)
$label.Text = $players[3]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(500,160)
$label.Size = New-Object System.Drawing.Size(100,20)
$label.Text = $players[4]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(500,180)
$label.Size = New-Object System.Drawing.Size(100,20)
$label.Text = $players[5]
$form.Controls.Add($label)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(600,80)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerNalogs[0]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(600,100)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerNalogs[1]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(600,120)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerNalogs[2]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(600,140)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerNalogs[3]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(600,160)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerNalogs[4]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(600,180)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerNalogs[5]
$form.Controls.Add($label)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(650,80)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerPlus[0]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(650,100)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerPlus[1]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(650,120)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerPlus[2]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(650,140)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerPlus[3]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(650,160)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerPlus[4]
$form.Controls.Add($label)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(650,180)
$label.Size = New-Object System.Drawing.Size(50,20)
$label.Text = $playerPlus[5]
$form.Controls.Add($label)

$result = $form.ShowDialog()

}