# PowerShell_Analytics_Find_Outliers
PowerShell script for analyzing a set of numbers and finding if the input value is an outlier using interquartile range.

Example of Comparing the input value to the inner fence:
.\DetectOutliers.ps1 -inputArray $array -inputValue '100'

Example of Comparing the input value to the outer fence:
.\DetectOutliers.ps1 -inputArray $array -inputValue '100' -useOuterFence $True
