Microblog = {
	
	frequency: function(id, url, params){
		frequency = new Ajax.Updater(id, url, {
			asynchronous:true,
			evalScripts:true,
			insertion: Insertion.Top,
			method: 'get',
			parameters : params,
		});
	},
	
	update: function(id, url, params){
		updater = new Ajax.Updater(id, url, {
			asynchronous:true,
			evalScripts:true,
			insertion: Insertion.Bottom,
			method: 'get',
			parameters : params
		});
	},

	no_more: function(){
		Element.remove($('link_more'));
	}
}