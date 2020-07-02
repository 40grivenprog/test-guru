document.addEventListener('turbolinks:load', function() {
	var controls = document.querySelectorAll('.form-inline-link')
	if(controls.length){
		for(var i = 0; i < controls.length; i++){
			controls[i].addEventListener('click', formLineLinkHandler)
		}
	}
	var errors  = document.querySelector('.resource-errors')
	if (errors){
		var resourceId = errors.dataset.resourceId
		formInlineHandler(resourceId)
	}
})

function formLineLinkHandler(event){
	event.preventDefault()
	var testId = this.dataset.testId
	formInlineHandler(testId)
}

function formInlineHandler(testId){
	var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
	var title = document.querySelector('.test-title[data-test-id="' + testId + '"]')
	var inlineForm = document.querySelector('.form-inline[data-test-id="' + testId + '"]')
	if (inlineForm.classList.contains('hide')){
		title.classList.add('hide')
		inlineForm.classList.remove('hide')
		link.textContent = 'Cancel'
	}	else{
		title.classList.remove('hide')
		inlineForm.classList.add('hide')
		link.textContent = 'Edit'
	}

}