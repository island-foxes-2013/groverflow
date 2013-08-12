var Votes = {
	init: function() {
		$('.u-create').on('ajax:success', this.upvoteView);
		$('.u-update').on('ajax:success', this.upvoteView);
		$('.u-delete').on('ajax:success', this.emptyView);
		$('.d-create').on('ajax:success', this.downvoteView);
		$('.d-update').on('ajax:success', this.downvoteView);
		$('.d-delete').on('ajax:success', this.emptyView);
	},

	// render: function(values) {
	//  TODO-JW: THIS IS INCOMPLETE, but gets at the idea ...
	// 	var $parent = $(this).parent();
	// 	// iterate over the hash keys (which are selectors) and call show() if true, hide() if false
	// },

	// defaults: function() {
	//  TODO-JW: THIS IS INCOMPLETE, but gets at the idea ...
	// 	return {
	// 		'.answer_votes': false,
	// 		'.answer_votes': false,
	// 		'.answer_votes': true,
	// 		'.answer_votes': false,
	// 		'.answer_votes': false
	// 	}
	// },

	upvoteView: function(event, response, status, xhr) {
		// TODO-JW: THIS IS INCOMPLETE, but gets at the idea ...
		// var showHide = defaults();
		// showHide['.empty-state'] = true;
		// this.render(showHide);
		console.log(response.vote_count);
		console.log("in upvoteView");
		var parent = $(this).parent()
		parent.children().hide();
		parent.find('.upvote-state').show();
		parent.find(".vote_count").text(response.vote_count).show();
	},

	emptyView: function(event, response, status, xhr) {
		console.log(response.vote_count);
		console.log("in deleteView");
		var parent = $(this).parent()
		parent.children().hide();
		parent.find('.empty-state').show();
		parent.find(".vote_count").text(response.vote_count).show();
	},

	downvoteView: function(event, response, status, xhr) {
		console.log(response.vote_count);
		console.log("in downvoteView");
		var parent = $(this).parent()
		parent.children().hide();
		parent.find('.downvote-state').show();
		parent.find(".vote_count").text(response.vote_count).show();
	},

	newView: function() {
		$('.answer_votes').children().hide();
		$('#question_votes').children().hide();
		$('#question_votes').find(".vote_count").show();
		$('.answer_votes').find(".vote_count").show();
		// $('#question_votes').find('.empty-state').show();
		$('.downvoted').find(".downvote-state").show();
		$('.upvoted').find(".upvote-state").show();
		$('.notvoted').find(".empty-state").show();
	}

};



$(document).ready(function(){
	Votes.init();
	Votes.newView();
})
