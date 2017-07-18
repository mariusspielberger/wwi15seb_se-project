module.exports = function(RED) {
	function mapAuthNode(config) { //node cunstructor
		RED.nodes.createNode(this, config);
		this.appId = config.appId;
		this.appCode = config.appCode; 
		var node = this;
		node.on('input', function(msg) { //register a listener on the input event
			var location = encodeURI(msg.payload.location.place);

			var url = "https://geocoder.cit.api.here.com/6.2/geocode.json";
			//var appId = "kKSI4QSzvHq4gDpN185v";
			//var appCode = "WJKIQZmBF-rTLvzQptUBTg";

			//var msg = {};
			msg = {};
			msg.method = "GET";
			msg.payload = url + "?app_id=" + node.appId + "&app_code=" + node.appCode + "&gen=9&searchtext=" + location;
			msg.url = msg.payload;

			node.send(msg);
		});
	}
	RED.nodes.registerType("map-auth",mapAuthNode);
};
