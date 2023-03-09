pipeline {
  agent any
  stages {
      	stage('DeployProduction') {
		steps{
	       	 withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'microk8s-cluster', contextName: '', credentialsId: 'TestKubernetes', namespace: 'kube-system', serverUrl: 'https://172.31.37.52:16443']]) {
                 sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
                 sh 'chmod u+x ./kubectl'  
                 sh './kubectl apply -f deployment.yaml'
	      }
		}
        }
  }
}
