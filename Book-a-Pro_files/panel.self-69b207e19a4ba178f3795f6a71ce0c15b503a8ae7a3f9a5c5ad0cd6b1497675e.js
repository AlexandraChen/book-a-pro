$(document).ready(function() {
	var currentBackground = 0;
	var backgrounds = [
		'/assets/sites/boxing.jpg',
		'/assets/sites/tutoring.jpg',
		'/assets/sites/dentist.jpg',
		'/assets/sites/chef.jpg',
		'/assets/sites/tutoring_kids.jpg',
		'/assets/sites/boxing.jpg'
	]

	function changeBackground() {
	  currentBackground++;
	  if(currentBackground > backgrounds.length-1) currentBackground = 0;
		$('.main-panel').css({
	      'background-image' : "url('" + backgrounds[currentBackground] + "')"
	  });
	  setTimeout(changeBackground, 3000);
	}
	  setTimeout(changeBackground, 3000);     
});



	
