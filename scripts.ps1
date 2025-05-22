docker build -t blog-iury-app:latest .
 
docker run -d -p 80:80 blog-iury-app:latest

az login
 
# Create a resource group
az group create --name containerappslab03 --location eastus
 
# Create Container Registry
az acr create --resource-group containerappslab03 --name blogiury --sku Basic
# Login to ACR
az acr login --name blogheblogiuryacr

# Tag the image
docker tag blog-iury-app:latest blogiuryacr.azurecr.io/blog-iury-app:latest

# Push the image
docker push blogiuryacr.azurecr.io/blog-iury-app:latest

#containerID = blogiuryacr.azurecr.io/blog-iury-app:latest
#user = blogiuryacr
#password = duzVmne8ARNgFRMndpcI7910kqjO3fczyj7zUDyAxQ4ARCFXf2B #Essa senha é obtida no conteiner registry acess key.

# Create Environment container app
az containerapp env create --name blog-iury-env --resource-group containerapps001 --location eastus

az containerapp create \
  --name blog-iury-app \
  --resource-group containerapps001 \
  --location eastus \
  --image blogiuryusr.azurecr.io/blog-iury-app:latest \
  --environment blog-iury-env \
  --target-port 80 \
  --ingress external \
  --registry-username blogiuryusr \
  --registry-password xhN0nfwmgPrRmdexZBlokagQ9YT4jvFDybqA4CRFqfxB \
  --registry-server blogiuryusr.azurecr.io
