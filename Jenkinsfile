node {
    environment {
        APP_NAME = "SampleNodeJs"
        STAGING = "Staging"
        PRODUCTION = "Production"
        execution_id = 0
    } 
    
    stage('Checkout') {
        // Checkout our application source code
        git url: 'https://github.com/nikhilgoenkatech/JenkinsBankApp.git'
    }     
    
    stage('DeployProduction') {
         // first we clean production        
        steps {
		   dir("/home/d1prumworkshop/k8s/siva-jenkins-test"){ 
		   sh 'kubectl create configmap cluster-id -n jenkins-test --from-literal=DT_CLUSTER_ID=SampleOnlineBankProduction'
		   sh 'kubectl create configmap job-name -n jenkins-test --from-literal=DT_CUSTOM_PROP=JOB_NAME=${JOB_NAME}'
		   sh 'kubectl create configmap build-tag -n jenkins-test --from-literal=DT_CUSTOM_PROP=BUILD_TAG=${BUILD_TAG}'
		   sh 'kubectl create configmap build-number -n jenkins-test --from-literal=DT_CUSTOM_PROP=BUILD_NUMBER=${BUIlD_NUMBER}'
           sh 'kubectl apply -n jenkins-test -f app-deployment.yaml'
		   sh 'kubectl apply -n jenkins-test -f app-service.yaml'
		   sh 'kubectl apply -n jenkins-test -f mongo-deployment.yaml'
		   sh 'kubectl apply -n jenkins-test -f mongo-service.yaml'
		   }
      }
        
    }       
}
