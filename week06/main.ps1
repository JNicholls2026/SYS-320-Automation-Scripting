.(Join-Path $PSScriptRoot ScrapeClasses.ps1)

clear

$gatherClass = gatherClasses

$FullTable = daysTranslator $gatherClass

# Furkan Paligu

#$FullTable | select "Class Code", Instructor, Location, Days, "Time Start", "Time End" | `
             where {$_.Instructor -ilike "Furkan Paligu"}

# Joyce 310 on Monday

#$FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.Days -ccontains "Monday")} | `
             Sort-Object "Time Start" | `
             Select-Object "Time Start", "Time End", "Class Code"

# ITS Instructors

$ITSInstructors = $FullTable | Where-Object {($_."Class Code" -ilike "SYS*") -or `
                                             ($_."Class Code" -ilike "NET*") -or `
                                             ($_."Class Code" -ilike "SEC*") -or `
                                             ($_."Class Code" -ilike "FOR*") -or `
                                             ($_."Class Code" -ilike "CSI*") -or `
                                             ($_."Class Code" -ilike "DAT*")} `
                                | Sort-Object "Instructor" | Select-Object "Instructor" -Unique

# Number of classes
$FullTable | where{$_.Instructor -in $ITSInstructors.Instructor} `
           | Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending


#$ITSInstructors
#$FullTable