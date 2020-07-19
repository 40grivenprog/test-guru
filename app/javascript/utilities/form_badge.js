document.addEventListener('turbolinks:load', function() {
	var badge_type = document.querySelector('.badge_select');
	if(badge_type){badge_type.addEventListener('change', checkBadge);}
})

function checkBadge(){
	var selected_value = this.options[this.selectedIndex].value
	var add_cat = document.querySelector('.additional_category');
	var add_test = document.querySelector('.additional_test');
	var add_level = document.querySelector('.additional_level');
	if (selected_value == "Success Passing"){
    add_test.classList.remove('hide')
	 	add_cat.classList.add('hide')
	 	add_level.classList.add('hide')
	}else if(selected_value == "Success Passing Category"){
    add_test.classList.add('hide')
	 	add_cat.classList.remove('hide')
	 	add_level.classList.add('hide')
	}else if(selected_value== "Success Passing by Level"){
    add_test.classList.add('hide')
	 	add_cat.classList.add('hide')
	 	add_level.classList.remove('hide')
	}
}