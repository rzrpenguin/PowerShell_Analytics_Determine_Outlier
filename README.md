# PowerShell_Analytics_Find_Outliers
PowerShell script for analyzing a set of numbers and finding if the input value is an outlier using interquartile range.
</br>
</br>
**Example of comparing the input value to the inner fence:**
</br>
.\FindOutliers.ps1 -inputArray $array -inputValue '100'
</br>
</br>
**Example of comparing the input value to the outer fence:**
</br>
.\FindOutliers.ps1 -inputArray $array -inputValue '100' -useOuterFence $True
