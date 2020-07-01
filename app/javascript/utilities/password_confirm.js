document.addEventListener('turbolinks:load', function() {
	control = document.querySelector('.confirmation')
	if(control) {control.addEventListener('input', confirmPassword)}
})

function confirmPassword(){
	password_field = document.querySelector('.password').value
	confirmation_field = this.value
	confirm = this.parentNode.querySelector('.octicon-check')
	not_confirm = this.parentNode.querySelector('.octicon-x')
	 if(password_field == confirmation_field){
	 	confirm.classList.remove('hide')
	 	not_confirm.classList.add('hide')
	 }else{
	 	confirm.classList.add('hide')
	 	not_confirm.classList.remove('hide')
	 }

	 if(confirmation_field == ''){
	 	confirm.classList.add('hide')
	 	not_confirm.classList.add('hide')
	 }

}