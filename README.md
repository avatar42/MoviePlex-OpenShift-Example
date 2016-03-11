Movieplex on Openshift + Jenkins
================================

This is the Movieplex7 example applications, prepared to be deployed on OpenShift origin with the application template `wildfly-j2ee-application-template.json`.

The included `Jenkinsfile` will allow Jenkins to deploy the application to OpenShift in a Pipeline by using the image to source (I2S) OpenShift functionality.

# Running the example app

For information on how to prepare an OpenShift 3 Origin environment, refer to: https://github.com/openshift/origin/blob/master/examples/sample-app/README.md
If you already have a working OpenShift environment just follow these steps. You will need to have the OpenShift CLI tools installed:

1. Login to OpenShift
```
    $ oc login --server=<server_url>
```
2. Create a new project
```
    $ oc new-project movieplex-application --display-name="MoviePlex WildFly + Jenkins Application Example" --description="This is an example project to demonstrate OpenShift v3 Origin integrated in an Jekins Pipeline"
```
3. Upload the application template. You need to be in the root of this repository
```
    $ oc create -f wildfly-j2ee-application-template.json
```
4. Create the applications with the uploaded template. 
```
    $ oc new-app wildfly-j2ee-application
```
**NOTE** This can also be done from the web interface by clicking "Add to Project" and selecting the template. It will allow you to change the parameters. 
	
**NOTE** You can also specify your parameters in the command-line by using --param=PUBLIC_URL=test.domain.org, you should at least specify an PUBLIC_URL parameter matching your environment

5. If everything went correctly the applications will automatically build and deployed. It will be accessible on the specified PUBLIC_URL

