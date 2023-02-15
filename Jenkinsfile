node {
    stage('DeployProduction') {
         // first we clean production        
         echo 'Build loading'
         dir("/home/d1prumworkshop/k8s/siva-jenkins-test"){ 
		   sh 'kubectl create namespace test-pipe'
         }
    }        
}
