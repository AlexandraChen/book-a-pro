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

var ProfessionalComponent = function(collection){
	this.collection = collection
}

ProfessionalComponent.prototype.template = function(pro){
	var professionals = "professionals/"
	var proTemplate = "<div class='col-sm-4'><a href="+ professionals + pro.id 
	+ "><div class='prof-pic-medium'><div class='prof-pic-title'><p class='pro-name'>"
	+ pro.name + "</p><p class='pro-title'>" + pro.title + "</div>" 
	+ "<img class='pro-img' src=" + pro.image_url + "></a></div><br>"
	return proTemplate

}
ProfessionalComponent.prototype.render = function(){
	if(this.collection.professionals.length === 0){
		return "<p>No results found</p>"
	} else {
		var component = this
		$(".row.all-pros").empty()
		this.collection.professionals.forEach(function(pro){
			$(".row.all-pros").append(component.template(pro))
		})
	}
}

window.Router = function (){ 
	this.listener()
	this.collection = new ProfessionalsCollection()
	this.professionalComponent = new ProfessionalComponent(this.collection)
}

Router.prototype.listener = function (){
	var router = this
	$("#search").on('keyup', function (event){
		var query = $(event.currentTarget).val()
		router.collection.fetch(query, function () {
			router.professionalComponent.render();
		})
	})
}

