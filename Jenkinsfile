node {
	
    stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
	
    stage('Build') {
        // Lets build our docker image
        dir ('sample-bank-app-service') {
            try {
                env.DOCKERFILE = env.DOCKERFILE
            }
            catch (e) {
            //catch (groovy.lang.MissingPropertyException e ) {
                echo "Received an exception!!!"
                env.DOCKERFILE = "Dockerfile"
            }
            def app = docker.build("sample-bankapp-service", "-f ${env.DOCKERFILE} .")
          }
    }
    stage('DeployProduction') {
         // first we clean production        
         echo 'Build loading'
         dir ('deployment-files')
	    {
		    kubeconfig(credentialsId: 'kube-config', serverUrl: '') {
				 sh 'kubectl get all --all-namespaces'
			 }		   
		   echo 'build completed'
         }
    }        
}
