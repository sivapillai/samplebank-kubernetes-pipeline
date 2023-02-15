node {
    environment {
        APP_NAME = "SampleNodeJs"
        STAGING = "Staging"
        PRODUCTION = "Production"
        execution_id = 0
    } 
    
    stage('Checkout') {
        // Checkout our application source code
        git url: 'https://github.com/sivapillai/samplebank-kubernetes-pipeline.git'
    }     
    
    stage('DeployProduction') {
         // first we clean production        
        steps {
                echo 'Build loading'
            }        
    }       
}
