# wwi15seb_se-project
A repository for the software engineering project (4th semester).

## How to use

1. Pull the image via **docker pull mariusspielberger/se-project**
2. Start the container with the following command: **docker run --rm -ti -p 9200:9200 -p 5601:5601 -p 9500:9500 -p 9600:9600 -p 1880:1880 --name container mariusspielberger/se-project**
3. Now you’ll need to set up Node-RED on [localhost:1880](localhost:1880) to be able to receive the desired tweets. Look at the flow: one of the nodes says _“Twitter”_. Double-click on it to open the menu, select the _“add new credentials”_-option and click on the pencil-button right next to it.
4. Now you’ll need to authenticate with twitter. If you don’t have an account, you _must_ set up one before performing this step. If the authentication has been successful, go back to Node-RED, where you’ll see your Twitter ID. Now press the “_add_”-button. To finish the Node-RED setup, click on “_deploy_” in the top right corner. 
5. Now, go to Kibana on [localhost:5601](localhost:5601). You will be greeted with a screen saying you’ll have to configure an index pattern. Leave everything as it is and click on “create”. In the “discover”-Tab you should be able to see the raw data of the first tweets imported.

### Please Notice

The Tweets you’ll import all refer to the Hashtag “Trump”. In the twitter-node menu you have the option to modify the list of Hashtags, for example if you’d rather analyze what people tweet about Putin or puppies.
