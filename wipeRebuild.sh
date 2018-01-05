set -x
##oc delete all --all breaks something deep down so wipe the whole project
oc delete project movieplex-application
## wait for project to shutdown
while [ -n "`oc projects | grep movieplex-application`" ]
do
	sleep 10
done
# give it a bit more to disappear
sleep 10
oc new-project movieplex-application --display-name="MoviePlex WildFly + Jenkins Application Example" --description="This is an example project to demonstrate OpenShift v3 Origin integrated in an Jenkins Pipeline"
echo $?
oc create -f wildfly-j2ee-application-template.json
oc new-app wildfly-j2ee-application
r=`oc get all | grep movieplex.openshift.beesshop.org | awk '{print $1}'`
oc delete $r
oc expose svc/frontend
oc get all
