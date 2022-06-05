
docfx build .\docfx_project\docfx.json
Remove-Item .\publish.zip

Compress-Archive -Path .\docfx_project\_site\* -DestinationPath .\publish.zip -Force
$AuthHeaderRaw = $Env:michaelpontideployid + ":" + $Env:michaelpontideploypw
curl -X POST -u $AuthHeaderRaw  --data-binary '@./publish.zip' --verbose https://michaelponti.scm.azurewebsites.net/api/zipdeploy
