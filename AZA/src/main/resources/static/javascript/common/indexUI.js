
function changeIframeUrl(url)
{
    $("#mainFrame").src = url;
}
// Parent
$(function() {
	// 자녀관리
	$('.left_nav').on('click', function(e) {
		var url = "http://localhost:8080"+e.target.dataset.url;
		console.log(url);
		$("#mainFrame").attr('src',url)
	})
	
	
	
	
})