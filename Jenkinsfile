pipeline{
  agent any
}
evnvironment {
  DOCKERHUB_CRED=credentials('docker_token')
    SNYK_TOKEN= credntials('snyk')
}
  stages{
      stage ('clone_Gitscm')
        steps{
          sh git clone https://github.com/edwinchofong86/Demo_project


        }
  }
      stage ('Pull_image')
        steps{
            sh docker pull lightninglabs/bitcoin-core:22-alpine 
        }
      stage ('scan_image')
        steps {
            sh snyk test --docker lightninglabs/bitcoin-core:22-alpine
        }
      stage  ('create_container')
        steps {
          sh docker run -d lightninglabs/bitcoin-core:22-alpine .
        }
      stage ('Deploy2_kubernetes')
        steps{
          sh kubectl apply -f bitcoin_deployment.yaml
          sh kubectl apply -f bitcoin-service.yaml
        }
