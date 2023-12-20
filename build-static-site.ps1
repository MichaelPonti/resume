
docfx build .\docfx_project\docfx.json

swa deploy -d $Env:michaelpontideploytoken -a .\docfx_project\_site --env production