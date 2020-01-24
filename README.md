# PowerShell_Analytics_Determine_Outlier
PowerShell script for analyzing a set of numbers and finding if the input value is an outlier using interquartile range.
</br>
</br>
**Example of comparing the input value to the inner fence:**
</br>
```PowerShell
$array = 10,23,21,13,16,72,25,10,23,21,13,16,85,73,19,109
.\DetermineOutlier.ps1 -inputArray $array -inputValue '100'
```

```
Inner Fence Start: -39.5
Inner Fence End: 104.5
100 is inside Inner Fence
```

</br>
</br>

**Example of comparing the input value to the outer fence:**

</br>

```PowerShell
$array = 10,23,21,13,16,72,25,10,23,21,13,16,85,73,19,109
.\DetermineOutlier.ps1 -inputArray $array -inputValue '175' -useOuterFence $True
```

```
Inner Fence Start: -39.5
Inner Fence End: 104.5
175 is outside Outer Fence
```
