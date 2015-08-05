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