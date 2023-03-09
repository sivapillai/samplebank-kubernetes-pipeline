node {

      	stage('Checkout') {
        // Checkout our application source code
        git url: 'https://github.com/sivapillai/samplebank-kubernetes-pipeline.git'
       }
	
      stage('DeployProduction') {
	       	 withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'microk8s-cluster', contextName: '', credentialsId: 'TestKubernetes', namespace: 'kube-system', serverUrl: 'https://172.31.37.52:16443']]) {
                 sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
                 sh 'chmod u+x ./kubectl'  
                 sh './kubectl apply -n bank-app -f app-deployment.yaml'
	      }
        }       
}
