window.addEventListener('DOMContentLoaded', event => {
	$.ajax({
		url:"/user/rest/getUser",
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
       	success: function(result) {
			if(result) {
			console.log(result);
			sessionStorage.setItem("role", result.role);
			sessionStorage.setItem("userName", result.userName);
				
			} else {
				console.log("getUser error");
			}
			
			
		} 
		
		
		
	})

});






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