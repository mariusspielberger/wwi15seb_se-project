# wwi15seb_se-project
A repository for the software engineering project (4th semester).

## How to use

1. Pull the image via **docker pull mariusspielberger/se-project**
2. Start the container with the following command: **docker run --rm -ti -p 9200:9200 -p 5601:5601 -p 9500:9500 -p 9600:9600 -p 1880:1880 --name container mariusspielberger/se-project** The startup can take up to three minutes, afterwards it should look somewhat like this:

![Console after startup](https://github.com/mariusspielberger/wwi15seb_se-project/blob/master/images/startup.jpg)

3. Now you’ll need to set up Node-RED on [localhost:1880](http://localhost:1880/) to be able to receive the desired tweets. Look at the flow: one of the nodes says _“Twitter”_. 

![Twitter node](https://github.com/mariusspielberger/wwi15seb_se-project/blob/master/images/nodered.jpg)

Double-click on it to open the menu, select the _“add new credentials”_-option and click on the pencil-button right next to it. 

![This one](https://github.com/mariusspielberger/wwi15seb_se-project/blob/master/images/addtwitter.jpg)

4. Now you’ll need to authenticate with twitter. If you don’t have an account, you _must_ set up one before performing this step. If the authentication has been successful, go back to Node-RED, where you’ll see your Twitter ID. Now press the “_add_”-button. To finish the Node-RED setup, click on “_deploy_” in the top right corner. 
5. Now, go to Kibana on [localhost:5601](http://localhost:5601//). You will be greeted with a screen saying you’ll have to configure an index pattern. Leave everything as it is and click on “create”. (_If the button stays disabled, try refreshing the site [F5 or Ctrl + R]_) In the “discover”-Tab you should be able to see the raw data of the first tweets imported.

###Here-API

In order to provide a heatmap of where tweets have been posted, Kibana needs geohashes. Unfortunately, tweets do not provide this information. This is why we use a free trial of the HERE-API, which provides the geohashes based on location names. In case the 90-day trial runs out we’ll need to configure a new account on https://developer.here.com/?create=Evaluation&keepState=true&step=account and replace the outrun one in Node-RED with it. Take the AppID and the AppCode you receive and enter it into the following node:

![Node representing the Here-API](https://github.com/mariusspielberger/wwi15seb_se-project/blob/master/images/HereAPI.jpg)


### Please Notice

The Tweets you’ll import all refer to the Hashtag “Trump”. In the twitter-node menu (as mentioned in step 3) you have the option to modify the list of Hashtags, for example if you’d rather analyze what people tweet about Putin or puppies.

