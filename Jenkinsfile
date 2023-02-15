node {
    stage('DeployProduction') {
         // first we clean production        
         echo 'Build loading'
         dir ('deployment-files')
	    {
		    withKubeConfig(credentialsId: 'kube-config', serverUrl: '') {
				 sh 'kubectl get all --all-namespaces'
			 }		   
		   echo 'build completed'
         }
    }        
}
