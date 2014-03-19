function moAction(){
	//google analytics
	if window._gaq?
		_gaq.push ['_trackPageview']
	else if window.pageTracker?
		pageTracker._trackPageview()
	//activate bar
	$("#top-navbar li#active").removeClass("active");
	$("#top-navbar li#" + $("#info").attr("data")).addClass("active");
	//TODO: add style for daily item page
}
$(document).ready(moAction);
$(document).on('page:load', moAction);