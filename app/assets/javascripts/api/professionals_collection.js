var ProfessionalsCollection = function(){
	this.professionals = []
	this.url = "api/professionals/?utf8=%E2%9C%93&search="
}

ProfessionalsCollection.prototype.fetch = function(query, callback){
	var request = $.get(this.url + query)
	//this.professionals = []
	var collection = this
	request.done(function(result){
		collection.professionals = result
		callback();
	})
}
