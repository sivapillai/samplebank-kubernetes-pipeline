node {	
      stage('DeployProduction') {
         // first we clean production        
         echo 'Build loading'
         dir ('deployment-files')
	    {
		sh 'kubectl get all --all-namespaces'		   
		echo 'build completed'
         }
    }        
}
