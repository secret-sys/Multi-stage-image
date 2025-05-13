npm init -y

npm install express

docker build -t node-multistage-app .

docker run -d -p 3005:3000 --name mynodeapp1 node-multistage-app
