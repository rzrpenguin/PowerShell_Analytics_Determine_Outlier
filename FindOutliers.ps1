$array = 10,23,21,13,16,72,25,10,23,21,13,16,85,73,19,109;
$array = $array | Sort-Object;
$arrayLength = ($array | Measure-Object).Count;
if((([System.Math]::Round(($arrayLength/2)))*2) -eq $arrayLength){
	##Even
	$m1 = ($arrayLength/2) - 1;
	$m2 = ($arrayLength/2);
	$arrayMedian = ($array[$m1]+$array[$m2])/2;
	
	$q1Array = @();
	$i=0;
	while($i -le $m1){
		$q1Array += $array[$i];
		$i++;
	}
	$q3Array = @();
	while($i -lt $arrayLength){
		$q3Array += $array[$i];
		$i++;
	}
	
	#Q1
	$q1ArrayLength = ($q1Array | Measure-Object).Count;
	if((([System.Math]::Round(($q1ArrayLength/2)))*2) -eq $q1ArrayLength){
		##Even
		$mQ1 = ($q1ArrayLength/2) - 1;
		$mQ2 = ($q1ArrayLength/2);
		$q1ArrayMedian = ($q1Array[$mQ1]+$q1Array[$mQ2])/2;
	}else{
		##Odd
		$mQ1 = ($q1ArrayLength/2)-0.5;
		$q1ArrayMedian = $q1Array[$mQ1];
	}
	
	#Q3
	$q3ArrayLength = ($q3Array | Measure-Object).Count;
	if((([System.Math]::Round(($q3ArrayLength/2)))*2) -eq $q3ArrayLength){
		##Even
		$mQ1 = ($q3ArrayLength/2) - 1;
		$mQ2 = ($q3ArrayLength/2);
		$q3ArrayMedian = ($q3Array[$mQ1]+$q3Array[$mQ2])/2;
	}else{
		##Odd
		$mQ3 = ($q3ArrayLength/2)-0.5;
		$q3ArrayMedian = $q3Array[$mQ3];
	}
	
}else{
	##Odd
	$m = ($arrayLength/2)-0.5;
	$arrayMedian = $array[$m];
	
	 $q1Start = ($arrayLength/2)-1.5;
	 $q3Start = ($arrayLength/2)+0.5;
	
	$q1Array = @();
	$i=0;
	while($i -le $q1Start){
		$q1Array += $array[$i];
		$i++;
	}
	$q3Array = @();
	$i = $q3Start;
	while($i -lt $arrayLength){
		$q3Array += $array[$i];
		$i++;
	}
	
	#Q1
	$q1ArrayLength = ($q1Array | Measure-Object).Count;
	if((([System.Math]::Round(($q1ArrayLength/2)))*2) -eq $q1ArrayLength){
		##Even
		$mQ1 = ($q1ArrayLength/2) - 1;
		$mQ2 = ($q1ArrayLength/2);
		$q1ArrayMedian = ($q1Array[$mQ1]+$q1Array[$mQ2])/2;
	}else{
		##Odd
		$mQ1 = ($q1ArrayLength/2)-0.5;
		$q1ArrayMedian = $q1Array[$mQ1];
	}
	
	#Q3
	$q3ArrayLength = ($q3Array | Measure-Object).Count;
	if((([System.Math]::Round(($q3ArrayLength/2)))*2) -eq $q3ArrayLength){
		##Even
		$mQ1 = ($q3ArrayLength/2) - 1;
		$mQ2 = ($q3ArrayLength/2);
		$q3ArrayMedian = ($q3Array[$mQ1]+$q3Array[$mQ2])/2;
	}else{
		##Odd
		$mQ3 = ($q3ArrayLength/2)-0.5;
		$q3ArrayMedian = $q3Array[$mQ3];
	}
	
}

$interquartile = $q3ArrayMedian - $q1ArrayMedian;
$innerFenceI = $interquartile*1.5;
$innerFenceStart = $q1ArrayMedian-$innerFenceI;
$innerFenceEnd = $q3ArrayMedian+$innerFenceI;

$outerFenceI = $interquartile*3;
$outerFenceStart = $q1ArrayMedian-$outerFenceI;
$outerFenceEnd = $q3ArrayMedian+$outerFenceI;

"$innerFenceStart,$innerFenceEnd";
"$outerFenceStart,$outerFenceEnd";
