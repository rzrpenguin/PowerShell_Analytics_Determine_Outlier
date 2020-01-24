# PowerShell_Analytics_Determine_Outlier
PowerShell script for analyzing a set of numbers and finding if the input value is an outlier using interquartile range.
</br>
</br>
**Example of comparing the input value to the inner fence:**
</br>
`$array = 10,23,21,13,16,72,25,10,23,21,13,16,85,73,19,109;
`</br>`
.\DetermineOutlier.ps1 -inputArray $array -inputValue '100'
`</br>`
Inner Fence Start: -39.5
`</br>`
Inner Fence End: 104.5
`</br>`
100 is inside Inner Fence`
</br>
</br>
**Example of comparing the input value to the outer fence:**
</br>
.\DetermineOutlier.ps1 -inputArray $array -inputValue '100' -useOuterFence $True
