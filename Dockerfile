FROM nodered/node-red

# Install node-red-dashboard module with npm
RUN npm install node-red-dashboard
# Otherwise copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED

# Copy all the relevant files
COPY nodered/settings.js /data/settings.js
COPY nodered/flows.json /data/flows.json
COPY nodered/flows_cred.json /data/flows_cred.json

# Copy _your_ Node-RED project files into place
# NOTE: This will only work if you DO NOT later mount /data as an external volume.
#       If you need to use an external volume for persistence then
#       copy your settings and flows files to that volume instead.
# You should add extra nodes via your package.json file but you can also add them here:
#WORKDIR /usr/src/node-red
#RUN npm install node-red-node-smooth
