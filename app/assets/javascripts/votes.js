var Votes = {
	init: function() {
		$('.u-create').on('ajax:success', this.upvoteView);
		$('.u-update').on('ajax:success', this.upvoteView);
		$('.u-delete').on('ajax:success', this.emptyView);
		$('.d-create').on('ajax:success', this.downvoteView);
		$('.d-update').on('ajax:success', this.downvoteView);
		$('.d-delete').on('ajax:success', this.emptyView);
	},

	upvoteView: function() {
		console.log("in upvoteView");
		var parent = $(this).parent()
		parent.children().hide();
		parent.children('.upvote-state').show();
	},

	emptyView: function() {
		console.log("in deleteView");
		var parent = $(this).parent()
		parent.children().hide();
		parent.children('.empty-state').show();
	},

	downvoteView: function() {
		console.log("in downvoteView");
		var parent = $(this).parent()
		parent.children().hide();
		parent.children('.downvote-state').show();
	},

	newView: function() {
		$('#question_votes').children().hide();
		$('#question_votes').children('.empty-state').show();
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