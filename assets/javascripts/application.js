Microblog = {
	
	frequency: function(id, url, params){
		frequency = $.get(url, params, function(data){
			$('#'+id).prepend(data);
		});
	},
	
	update: function(id, url, params){
		frequency = $.get(url, params, function(data){
			$('#'+id).append(data);
		});
	},

	no_more: function(){
		$('#link_more').remove();
	}
}