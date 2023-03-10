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
			         sh './kubectl create configmap job-name -n bank-app --from-literal=JOB_NAME=${JOB_NAME}'
				 sh './kubectl create configmap build-tag -n bank-app --from-literal=BUILD_TAG=${BUILD_TAG}'
		 		 sh './kubectl create configmap build-number -n bank-app --from-literal=BUILD_NUMBER=${BUIlD_NUMBER}'
                 	         sh './kubectl apply -f deployment.yaml'
				}
			}
		}
        }
 }
}
