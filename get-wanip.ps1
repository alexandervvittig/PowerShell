function get-wanip {
<#
.Synopsis
   Get current WAN IP
.DESCRIPTION
   Gathers the current WAN IP from IP chicken and parses it
.NOTES
    AUTHOR: 
        Alex Wittig
    HISTORY:
        21-27-2017 - Release
    CONTACT:
        alexanderwittig@gmail.com
        http://vvittig.com
#>
    begin{
        $iptest    = Invoke-WebRequest -Uri "http://ipchicken.com"
    } 
    process{
        $text      = (($iptest.ParsedHtml).getElementsByTagName("td") | Where {$_.width -eq '94%'}).innertext
        $ip        = ($text[0] -replace ("Name Address: ", "")).Split('.')
        $currentip = $ip[0] -replace ("-", ".")
    }
    end{
        return $currentip
    }
}