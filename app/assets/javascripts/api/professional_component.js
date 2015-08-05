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