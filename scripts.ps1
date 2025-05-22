docker build -t blog-iury-app:latest .
2 
3 docker run -d -p 80:80 blog-iury-app:latest
4 
5 az login
6 
7 # Create a resource group
8 az group create --name containerappslab03 --location eastus
9 
10 # Create Container Registry
11 az acr create --resource-group containerappslab03 --name blogiury --sku Basic