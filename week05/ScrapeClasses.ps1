function gatherClasses(){

$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.20/Courses2025FA.html

$trs = $page.ParsedHtml.body.getElementsByTagName("tr")

$FullTable = @()

For($i=1; $i -lt $trs.length; $i++){

    # Get every td element of current tr element
    $tds = $trs[$i].getElementsByTagName("td")

    # Want to separate start time and end time frome one time field
    $Times = $tds[5].innerText.split("-")

    $FullTable += [PSCustomObject]@{"Class Code" = $tds[0].innerText; `
                                    "Title"      = $tds[1].innerText; `
                                    "Days"       = $tds[4].innerText; `
                                    "Time Start" = $Times[0]; `
                                    "Time End"   = $Times[1]; `
                                    "Instructor" = $tds[6].innerText; `
                                    "Location"   = $tds[9].innerText; `
                                }
} # loop ends
return $FullTable
}

function daysTranslator($FullTable){

for($i=0; $i -lt $FullTable.length; $i++){

    # Empty array to hold days for every record
    $Days = @()

    # "M" -> Monday
    if($FullTable[$i].Days -ilike "M*"){  $Days += "Monday"  }

    # "T" -> Tuesday
    if($FullTable[$i].Days -ilike "*T[WF]*"){  $Days += "Tuesday"  }
    ElseIf($FullTable[$i].Days -ilike "T"){  $Days += "Tuesday"  }

    # "W" -> Wednesday
    if($FullTable[$i].Days -ilike "*W*"){  $Days += "Wednesday"  }

    # "TH" -> Thursday
    if($FullTable[$i].Days -ilike "*TH*"){  $Days += "Thursday"  }

    # "F" -> Friday
    if($FullTable[$i].Days -ilike "*F")  {$Days += "Friday"  }

    # Make switch
    $FullTable[$i].Days = $Days

}

return $FullTable
}