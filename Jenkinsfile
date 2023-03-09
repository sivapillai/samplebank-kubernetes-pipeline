node {	
      stage('DeployProduction') {
         // first we clean production        
         echo 'Build loading'
         dir ('deployment-files')
	    {
		withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'microk8s-cluster', contextName: '', credentialsId: 'TestKubernetes', namespace: 'kube-system', serverUrl: 'https://172.31.37.52:16443']]) {
                sh kubectl get all -n jenkins
             }		   
		   println "execution complete"
         }
    }        
}
