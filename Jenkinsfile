node {
    stage('DeployProduction') {
         // first we clean production        
         echo 'Build loading'
         dir ('deployment-files')
	    {
		    steps {
			 kubeconfig(credentialsId: 'kube-config', serverUrl: '') {
				 sh 'kubectl apply -f sample.yaml'
			 }		   
		   echo 'build completed'
		 }
         }
    }        
}
