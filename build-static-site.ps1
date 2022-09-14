
docfx build .\docfx_project\docfx.json
Remove-Item .\publish.zip

# for the credentials, we need to go deployment center and to the ftps credentials tab.
# in user scope, user name should be <appname>\user, password should be whatever is
# required 


Compress-Archive -Path .\docfx_project\_site\* -DestinationPath .\publish.zip -Force
$AuthHeaderRaw = $Env:michaelpontideployid + ":" + $Env:michaelpontideploypw
curl -X POST -H "Content-Type: application/zip" -u $AuthHeaderRaw  --data-binary '@./publish.zip' --verbose https://michaelponti.scm.azurewebsites.net/api/zipdeploy
