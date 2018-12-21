# kickstart project
## basic crowd-funding dApp using Ethereum
Same as crowd funding in real world, you can create campaigns requiring minimum contribution.
The creator can propose how to use money and how much money is needed as a 'Request'. 
He cannot use money without 50% approvers in voting.

## How to start
`npm install` to install dependency modules.

`npm run dev`to start on localhost:3000
 
 You need some fake ETH on Rinkeby. Please get MetaMask!

on public server:
https://kickstart2018.herokuapp.com/ 

# =====Heroku deployment steps=======
I used via Github deployment method to deploy. Below is my steps on heroku:

0. Creating .gitignore

node_modules/  
.next/  
*.log  
ethereum/compile.js  
ethereum/deploy.js  
/test  
ADDRESS  


1.  Configuration on package.json
```
    "scripts": {
    　　"dev": "node server.js",
    　　"build": "next build",
    　　"start": "NODE_ENV=production node server.js",
    　　"heroku-postbuild": "next build"
 　　 },
```
2. Creating Procfile

　web: npm start --port $PORT



3. Making github repo & push

add ., commit, remote add, push



4. From my terminal

heroku create <my-app-name>



5. From my terminal

heroku config:set NPM_CONFIG_PRODUCTION=false



6. Deploying to heroku...

I. Open your browser and sign into Heroku  
II. Navigate to the “Dashboard”  
III. Select your newly created app  
IV. Click “Deploy”  
V. Under “Deployment Method” select “Github”  
VI. Add repository name ({username}/{repositoryname})  
VII. Click “Search”  
VIII. Click “Connect”  
IX. Select Branch  
X. Click “Deploy Branch”  
XI. Click “View”   

It works on heroku server now :P


 
 
