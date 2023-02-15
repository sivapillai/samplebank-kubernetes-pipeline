node {
    USER root
    RUN apt install -y kubectl 
    stage('DeployProduction') {
         // first we clean production        
         echo 'Build loading'
         dir ('deployment-files'){ 
		   sh 'kubectl apply -f sample.yaml'
		   echo 'build completed'
         }
    }        
}
