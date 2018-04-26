function New-EVE-Universe-FullCategorys {
    Param(
    [ValidateSet("Tranquility","singularity")]
    [String]
    $datasource,
    [ValidateSet("en-us","ru","de","fr","ja","zh")]
    [String]
    $language,
    [ValidateSet("PS")]
    [String]
    $outformat
    )

    $language = "en-us"

    $EVECategoryDetails = get-eve-universe-categories -datasource $datasource -outformat PS | % { 
        get-eve-universe-categories-details -datasource $datasource -language $language -category_id $_ -outformat PS
      }

    return $EVECategoryDetails ; 
}

