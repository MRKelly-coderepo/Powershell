function get-mp4 {

    param(
        $url
        )

        $links = ((Invoke-WebRequest -Uri $url -UseBasicParsing).links).href | ForEach-Object{
            $newUrl = $url + "/" + $_
            if($_ -like '*mp4*' -or $_ -like '*m4v*'){
                write-host $newUrl
                Add-Content -Path .\allFiles.txt -Value $newUrl
            }
            else{
                write-Host $newUrl
                get-mp4($newUrl)
            }
            
        }
}

get-mp4("http://10.0.0.27:9090")
