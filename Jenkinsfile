pipeline
{
  agent any
  stages
	{
      	stage('DeployProduction') 
	  {
		steps
		{
			dir('deployment-files')
			{
	       			 withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'microk8s-cluster', contextName: '', credentialsId: 'TestKubernetes', namespace: 'kube-system', serverUrl: 'https://172.31.37.52:16443']]) 
				{
              			 sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
             		         sh 'chmod u+x ./kubectl'  
				 sh './kubectl create namespace bank-app'
			         sh './kubectl create configmap cluster-id -n bank-app --from-literal=DT_CLUSTER_ID=SampleOnlineBankProduction'
				 sh './kubectl create configmap dt-tags -n bank-app --from-literal=DT_TAGS=Production'
				 sh './kubectl create configmap job-name -n bank-app --from-literal=DT_CUSTOM_PROP=JOB_NAME=${JOB_NAME}'
				 sh './kubectl create configmap build-tag -n bank-app --from-literal=DT_CUSTOM_PROP=BUILD_TAG=${BUILD_TAG}'
				 sh './kubectl create configmap build-number -n bank-app --from-literal=DT_CUSTOM_PROP=BUILD_NUMBER=${BUILD_NUMBER}'
		    		 sh './kubectl apply -n bank-app -f app-deployment.yaml'
		    		 sh './kubectl apply -n bank-app -f app-service.yaml'
		    		 sh './kubectl apply -n bank-app -f mongo-deployment.yaml'
		    		 sh './kubectl apply -n bank-app -f mongo-service.yaml'
				}
			}
		}
        }
  }
}
