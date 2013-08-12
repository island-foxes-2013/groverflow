var Votes = {
	init: function() {
		$('.u-create').on('ajax:success', this.upvoteView);
		$('.u-update').on('ajax:success', this.upvoteView);
		$('.u-delete').on('ajax:success', this.emptyView);
		$('.d-create').on('ajax:success', this.downvoteView);
		$('.d-update').on('ajax:success', this.downvoteView);
		$('.d-delete').on('ajax:success', this.emptyView);
	},

	upvoteView: function(event, response, status, xhr) {
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











// function Die() {
//   this.value = 0;
// }

// function render_all(collection,dom_element) {
//   dom_element.empty();
//   $.each(collection,function(key,value) {
//       value.add_to(dom_element);
//   });
// }

// Die.prototype.render = render;
// Die.prototype.roll = roll;
// Die.prototype.add_to = add_to;

// function add_to(element) {
//   element.append(this.render());
// }

// function render() {
//   die_value = this.value;
//   return '<div class="die">' + die_value + '</div>'
// }

// function roll() {
//   this.value = Math.floor((Math.random()*6)+1)
// }

// function render_all(collection,dom_element) {
//   dom_element.empty();
//   $.each(collection,function(key,value) {
//       value.add_to(dom_element);
//   });
// }