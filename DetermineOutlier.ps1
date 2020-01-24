param($inputArray, [double]$inputValue, $useOuterFence);
$inputArray = $inputArray | Sort-Object;
$arrayLength = ($array | Measure-Object).Count;

if((([System.Math]::Round(($arrayLength/2)))*2) -eq $arrayLength){
	##If the inputArray object count is even the following code will run
	$m1 = ($arrayLength/2) - 1;
	$m2 = ($arrayLength/2);
	$arrayMedian = ($array[$m1]+$array[$m2])/2;
	
	##Build the first quartile array
	$q1Array = @();
	$i=0;
	while($i -le $m1){
		$q1Array += $array[$i];
		$i++;
	}
	
	##Build the third quartile array
	$q3Array = @();
	while($i -lt $arrayLength){
		$q3Array += $array[$i];
		$i++;
	}
	
	##Q1 Section
	$q1ArrayLength = ($q1Array | Measure-Object).Count;
	if((([System.Math]::Round(($q1ArrayLength/2)))*2) -eq $q1ArrayLength){
		##If the q1Array object count is even the following code will run
		$mQ1 = ($q1ArrayLength/2) - 1;
		$mQ2 = ($q1ArrayLength/2);
		$q1ArrayMedian = ($q1Array[$mQ1]+$q1Array[$mQ2])/2;
	}else{
		##If the q1Array object count is odd the following code will run
		$mQ1 = ($q1ArrayLength/2)-0.5;
		$q1ArrayMedian = $q1Array[$mQ1];
	}
	
	##Q3 Section
	$q3ArrayLength = ($q3Array | Measure-Object).Count;
	if((([System.Math]::Round(($q3ArrayLength/2)))*2) -eq $q3ArrayLength){
		##If the q3Array object count is even the following code will run
		$mQ1 = ($q3ArrayLength/2) - 1;
		$mQ2 = ($q3ArrayLength/2);
		$q3ArrayMedian = ($q3Array[$mQ1]+$q3Array[$mQ2])/2;
	}else{
		##If the q3Array object count is odd the following code will run
		$mQ3 = ($q3ArrayLength/2)-0.5;
		$q3ArrayMedian = $q3Array[$mQ3];
	}
	
}else{
	##If the inputArray object count is odd the following code will run
	$m = ($arrayLength/2)-0.5;
	$arrayMedian = $array[$m];
	
	 $q1Start = ($arrayLength/2)-1.5;
	 $q3Start = ($arrayLength/2)+0.5;
	
	##Build the first quartile array
	$q1Array = @();
	$i=0;
	while($i -le $q1Start){
		$q1Array += $array[$i];
		$i++;
	}
	
	##Build the third quartile array
	$q3Array = @();
	$i = $q3Start;
	while($i -lt $arrayLength){
		$q3Array += $array[$i];
		$i++;
	}
	
	##Q1 Section
	$q1ArrayLength = ($q1Array | Measure-Object).Count;
	if((([System.Math]::Round(($q1ArrayLength/2)))*2) -eq $q1ArrayLength){
		##If the q1Array object count is even the following code will run
		$mQ1 = ($q1ArrayLength/2) - 1;
		$mQ2 = ($q1ArrayLength/2);
		$q1ArrayMedian = ($q1Array[$mQ1]+$q1Array[$mQ2])/2;
	}else{
		##If the q1Array object count is odd the following code will run
		$mQ1 = ($q1ArrayLength/2)-0.5;
		$q1ArrayMedian = $q1Array[$mQ1];
	}
	
	##Q3 Section
	$q3ArrayLength = ($q3Array | Measure-Object).Count;
	if((([System.Math]::Round(($q3ArrayLength/2)))*2) -eq $q3ArrayLength){
		##If the q3Array object count is even the following code will run
		$mQ1 = ($q3ArrayLength/2) - 1;
		$mQ2 = ($q3ArrayLength/2);
		$q3ArrayMedian = ($q3Array[$mQ1]+$q3Array[$mQ2])/2;
	}else{
		##If the q3Array object count is odd the following code will run
		$mQ3 = ($q3ArrayLength/2)-0.5;
		$q3ArrayMedian = $q3Array[$mQ3];
	}
	
}

$interquartile = $q3ArrayMedian - $q1ArrayMedian;

if($useOuterFence -ne $True){
	##Compare inputValue to the inner fence range
	$innerFenceI = $interquartile*1.5;
	$innerFenceStart = $q1ArrayMedian-$innerFenceI;
	$innerFenceEnd = $q3ArrayMedian+$innerFenceI;
	Write-Host "Inner Fence Start: $innerFenceStart";
	Write-Host "Inner Fence End: $innerFenceEnd";
	if($inputValue -ge $innerFenceStart -and $inputValue -le $innerFenceEnd){
		$placement = "$inputValue is inside Inner Fence";
		Write-Output $placement;
	}elseif($inputValue -lt $innerFenceStart -or $inputValue -gt $innerFenceEnd){
		$placement = "$inputValue is outside Inner Fence";
		Write-Output $placement;
	}
}elseif($useOuterFence -eq $True){
	##Compare inputValue to the outer fence range
	$outerFenceI = $interquartile*3;
	$outerFenceStart = $q1ArrayMedian-$outerFenceI;
	$outerFenceEnd = $q3ArrayMedian+$outerFenceI;
	Write-Host "Outer Fence Start: $outerFenceStart";
	Write-Host "Outer Fence End: $outerFenceEnd";
	if($inputValue -ge $outerFenceStart -and $inputValue -le $OuterFenceEnd){
		$placement = "$inputValue is inside Outer Fence";
		Write-Output $placement;
	}elseif($inputValue -lt $OuterFenceStart -or $inputValue -gt $OuterFenceEnd){
		$placement = "$inputValue is outside Outer Fence";
		Write-Output $placement;
	}
}
