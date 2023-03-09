node {	
      stage('DeployProduction') {
         // first we clean production
	      dir ('deployment-files'){
         	 withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'microk8s-cluster', contextName: '', credentialsId: 'TestKubernetes', namespace: 'kube-system', serverUrl: 'https://172.31.37.52:16443']]) {
                 sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
                 sh 'chmod u+x ./kubectl'  
                 sh './kubectl create configmap cluster-id -n jenkins --from-literal=DT_CLUSTER_ID=SampleOnlineBankProduction'
		 sh './kubectl create configmap job-name -n jenkins --from-literal=DT_CUSTOM_PROP=JOB_NAME=${JOB_NAME}'
		 sh './kubectl create configmap build-tag -n jenkins --from-literal=DT_CUSTOM_PROP=BUILD_TAG=${BUILD_TAG}'
		 sh './kubectl create configmap build-number -n jenkins --from-literal=DT_CUSTOM_PROP=BUILD_NUMBER=${BUIlD_NUMBER}'
                 sh './kubectl apply -n bank-app -f app-deployment.yaml'
		}
	      }
        }       
}
