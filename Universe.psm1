function get-EVEUniverseAsteroid_BeltsAsteroid_Belt_Id { 
 
        Param( 
            [Parameter(Mandatory=$true)]
            [int32]
            $asteroid_belt_id,
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [string]
            $user_agent,
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/universe/asteroid_belts/{asteroid_belt_id}/

$URI = "https://esi.tech.ccp.is/latest/universe/asteroid_belts/$asteroid_belt_id/"



}


get-EVEUniverseAsteroid_BeltsAsteroid_Belt_Id -asteroid_belt_id 1111


