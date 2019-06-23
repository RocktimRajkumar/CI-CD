pipeline{
	agent any
	
	stages{
		
		stage ('Compile Stage'){
			steps{
				withMaven(maven : 'maven_3.6.0'){
					bat 'mvn clean compile'
				}
			}
		}
		
		stage ('Testing Stage'){
			steps{
				withMaven(maven : 'maven_3.6.0'){
					bat 'mvn test'
				}
			}
		}
		
		stage ('Deployment Stage'){
			steps{
				withMaven(maven : 'maven_3.6.0'){
					bat 'mvn deploy'
				}
			}
		}
		
	}
}