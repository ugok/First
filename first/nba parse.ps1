$path = "25 Jack.html"
$final = @("")* 25
$source = @("")* 25

$f = select-string -path $path -pattern "<p>" 



for ($i = 1; $i -lt 26; $i++){
$f = select-string -path $path -pattern ("<p>" + $i + "\. ")
$temp = ([string]$i + "\. ")
$temp = $f -split ($temp)
$temp = $temp[1].replace("&#8217;","'")
$temp = $temp.replace("&#8220;",'"')
$temp = $temp.replace("&#8221;",'"')
$temp = $temp.replace("&#8243;",'"')
if ((($i % 5) -eq 0) -or ($i -eq 29)){
$temp = $temp -split ' – <a href="'
$temp = $temp -split "&#8211;"
$sourceTemp = $temp[1] -split '">Source'
}else{
$temp = $temp -split "&#8211;"
$sourceTemp = $temp[1] -split '">Source'
}

$final[$i - 1] = $temp[0]

$source[$i - 1] = $sourceTemp[0] -split '<a href="' 
}
