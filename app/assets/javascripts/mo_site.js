function moAction(){
	//activate bar
	$("#top-navbar li#active").removeClass("active");
	$("#top-navbar li#" + $("#info").attr("data")).addClass("active");
	//TODO: add style for daily item page
}
$(document).ready(moAction);
$(document).on('page:load', moAction);