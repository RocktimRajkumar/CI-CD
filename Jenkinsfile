pipeline{
	agent any
	
	stages{
		
		stage ('Compile Stage'){
			steps{
				withMaven(maven : 'maven_3.6.0'){
					ssh 'mvn clean compile'
				}
			}
		}
		
		stage ('Testing Stage'){
			steps{
				withMaven(maven : 'maven_3.6.0'){
					ssh 'mvn test'
				}
			}
		}
		
		stage ('Deployment Stage'){
			steps{
				withMaven(maven : 'maven_3.6.0'){
					echo "Ready to Go !"
				}
			}
		}
		
	}
}
