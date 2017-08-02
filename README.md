# wwi15seb_se-project
A repository for the software engineering project (4th semester).

## How to use

* Start the container with the following command: **docker run --rm -ti -p 9200:9200 -p 5601:5601 -p 9500:9500 -p 9600:9600 -p 1880:1880 --name container mariusspielberger/se-project** 
The startup can take up to three minutes, afterwards it should look somewhat like this:

![Console after startup](https://raw.githubusercontent.com/mariusspielberger/wwi15seb_se-project/d95a0b555490b150d2f60284e6fcd0b070d97616/images/startup.jpg)
* Now you’ll need to set up Node-RED on [localhost:1880](http://localhost:1880/) or [http://192.168.99.100:1880/](http://192.168.99.100:1880/) to be able to receive the desired tweets. Look at the flow: one of the nodes says _“Twitter”_. 

![Twitter node](https://raw.githubusercontent.com/mariusspielberger/wwi15seb_se-project/d95a0b555490b150d2f60284e6fcd0b070d97616/images/nodered.jpg)

Double-click on it to open the menu, select the _“add new credentials”_-option and click on the pencil-button right next to it. 

![This one](https://raw.githubusercontent.com/mariusspielberger/wwi15seb_se-project/d95a0b555490b150d2f60284e6fcd0b070d97616/images/addtwitter.jpg)

* Now you’ll need to authenticate with twitter. If you don’t have an account, you _must_ set up one before performing this step. If the authentication has been successful, go back to Node-RED, where you’ll see your Twitter ID. Now press the “_add_”-button. 
* To finish the Node-RED setup, click on “_deploy_” in the top right corner. 
* Now, go to Kibana on [localhost:5601](http://localhost:5601//) or [http://192.168.99.100:5601/](http://192.168.99.100:5601/). In the “discover”-Tab you should be able to see the raw data of the first tweets imported.
* Click on *Dashboards* in the panel on the left side. Here you can find pre-configured dashboards visualizing the data. 
* Have fun! 

### Here-API

In order to provide a heatmap of where tweets have been posted, Kibana needs geohashes. Unfortunately, tweets do not provide this information. This is why we use a free trial of the HERE-API, which provides the geohashes based on location names. In case the 90-day trial runs out we’ll need to configure a new account on https://developer.here.com/?create=Evaluation&keepState=true&step=account and replace the outrun one in Node-RED with it. Take the AppID and the AppCode you receive and enter it into the following node:

![Node representing the Here-API](https://raw.githubusercontent.com/mariusspielberger/wwi15seb_se-project/95f8ece641ae6235c6dfbda9fb12359f47e3e51c/images/HereAPI.jpg)

### Additional Information 
#### Using the snapshot
When you hit **deploy** in Node-RED, the container starts logging the tweets coming from the twitter API. Unfortunately we're only able to receive the newest tweets (the ones posted after you hit deploy). To provide you a useful dashboard there needs to be a big collection of tweets, so we already included a snapshot with a big collection of tweets in Kibana.
To refer to that Snapshot, navigate into a Dashboard as described in _How to use_. Click on timestamp in the top right corner and change to  _absolute_ time range. 

![Timerange](https://raw.githubusercontent.com/mariusspielberger/wwi15seb_se-project/3f4636afce424153b894a37df4cc2240e20595b2/images/kibana.png)

Set the parameters like this:
From: 2017-07-11 11:00:00.000
To: 2017-07-11 14:00:00.000
And press Go. 

#### Changing the #-Subject
The Tweets you’ll import all refer to the Hashtag “Trump”. In the twitter-node menu (as mentioned in step 3) you have the option to modify the list of Hashtags, for example if you’d rather analyze what people tweet about Putin or puppies.

#### Other Visualizations
It's also possible to create your own visualizations in Kibana. To do so, navigate into the *Visualize*-Tab. Click on the **+** next to the search bar and start creating. 
