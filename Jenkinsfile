node {	
      stage('DeployProduction') {
         // first we clean production        
         echo 'Build loading'
         dir ('deployment-files')
	    {
		    RUN 'apt-get update'
		    RUN 'apt install -y kubectl'
		    kubeconfig(credentialsId: 'kube-config', serverUrl: '') {
				 sh 'ssh http://3.137.158.26/ kubectl get all --all-namespaces'
			 }		   
		   echo 'build completed'
         }
    }        
}
