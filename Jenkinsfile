pipeline 
{
	    
	    agent any
		
		tools
	    {
	       maven "Maven"
	    }
	 
	 	stages 
	 	{
		        stage('checkout') 
		        {
		           steps 
		           {
						sh "echo This is a test jenkins pipeline"		             
		                git branch: 'master', url: 'https://github.com/harshgupta1990/spring-boot-docker.git'
		           }
		        }
			 
				stage('Execute Maven') 
				{
			           steps 
			           {
			             
			                sh 'mvn package'             
			           }
			    }
	        
	
			    stage('Docker Build and Tag') 
			    {
			           steps 
			           {
			                sh 'docker build -t spring-boot-docker:latest .' 
			                sh 'docker tag spring-boot-docker harshgupta1990/spring-boot-docker:latest'
			                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
			           }
			    }
	     
			  stage('Publish image to Docker Hub') 
			  {
			          
			            steps 
			            {
					        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) 
					        {
					          sh  'docker push harshgupta1990/spring-boot-docker:latest'
					        //  sh  'docker push harshgupta1990/spring-boot-docker:$BUILD_NUMBER' 
			                }
			            }
			  }
	     
			  stage('Run Docker container on Jenkins Agent') 
			  {
			             
			            steps 
						{
			                sh "docker run -d -p 7071:8080 harshgupta1990/spring-boot-docker"
			 
			            }
			  }
	    
	   }
	}
    