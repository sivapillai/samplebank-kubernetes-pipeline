node {	
      stage('DeployProduction') {
         // first we clean production        
         	 withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'microk8s-cluster', contextName: '', credentialsId: 'TestKubernetes', namespace: 'kube-system', serverUrl: 'https://172.31.37.52:16443']]) {
                 sh '/snap/bin/microk8s.kubectl get all -n jenkins'
		}
        }       
}
