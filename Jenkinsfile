node {	
      stage('DeployProduction') {
         // first we clean production        
         echo 'Build loading'
         dir ('deployment-files')
	    {
		    RUN 'apt-get update'
		    RUN 'apt install -y kubectl'
		    kubeconfig(credentialsId: 'kube-config', serverUrl: '') {
				 sh 'kubectl get all --all-namespaces'
			 }		   
		   echo 'build completed'
         }
    }        
}
