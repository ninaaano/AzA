
function changeIframeUrl(url)
{
	 $("#mainFrame").src = url;
}

function changeSubframeUrl(url)
{
	 $("#subFrame").src = url;
}

$(function() {
	$('.left_nav').on('click', function(e) {
		var url = e.target.dataset.url;
		console.log(url);
		$("#mainFrame").attr('src',url)
	})
	
	$('.subframe_nav').on('click', function(e) {
		var url = e.target.dataset.url;
		console.log(url);
		$("#subFrame").attr('src',url)
	})
	
})