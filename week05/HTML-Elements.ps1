$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.20/ToBeScraped.html

# Get a count of the links in the page
#$scraped_page.Links.Count

# Display links as HTML Element
#$scraped_page.Links | Select-Object innerHTML, innerText, outerHTML, outerText, href

# Display only URL and its Text
#$scraped_page.Links | Select-Object outerText, href

# Get outer text of every element with the taf h2
#$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select-Object outerText

#$h2s

# Print innerText of every div element that has the class as "div-1"
$divs1 = $scraped_page.ParsedHtml.body.getElementsByTagName("div") | where { `
$_.getAttributeNode("class").value -ilike "div-1"} | select innerText

$divs1