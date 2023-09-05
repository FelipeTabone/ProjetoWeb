function validator() {
	let date = frmClient.date.value
	let time = frmClient.time.value
	if (date === "") {
		alert('Preencha o campo Data')
		frmClient.date.focus()
		return false
	} else if (time === "") {
		alert('Preencha o campo horário')
		frmClient.time.focus()
		return false
	}
	else {
		document.forms["frmClient"].submit()
	}
}