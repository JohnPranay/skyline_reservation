#Find the list of artifacts found in the artifactory
curl  http://localhost:5040/artifactory/libs-snapshot-local/devops/capstone/AirlineReservation/0.0.1-SNAPSHOT/ | grep Airline> /home/osgdev/eclipse-workspace/Skyline/artfiles.txt
#Find the last deployed artifact
line=`tail -n 1 /home/osgdev/eclipse-workspace/Skyline/artfiles.txt`
line=`echo $line | cut -d "\"" -f 2`
#Build the URL for downloading
url="http://localhost:5040/artifactory/libs-snapshot-local/devops/capstone/AirlineReservation/0.0.1-SNAPSHOT/$line"
#Download the latest war file from the Artifactory and place it in project folder
wget -O /home/osgdev/eclipse-workspace/Skyline/AirlineReservation.war $url
#Remove the temporary file generated
rm /home/osgdev/eclipse-workspace/Skyline/artfiles.txt
