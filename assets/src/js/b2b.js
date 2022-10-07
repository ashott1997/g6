import axios from "axios";


if(document.querySelector('.b2b-form')){
    const form = document.querySelector('.b2b-form')
    const button = document.querySelector('.b2b-form .btn')
    const link = form.getAttribute('link-to')
    button.addEventListener('click', () => {
        const allForms = form.querySelectorAll('.form-control')
        let checker = true
        allForms.forEach(form => {
            if(form.value == ''){
                checker = false
                form.style.borderColor = 'red'
            }else{
                form.style.borderColor = 'black'
            }
        })
        if(checker == true){
            axios.post(link, {
                name: form.querySelector('#name').value,
                email: form.querySelector('#email').value,
                phone: form.querySelector('#phone').value,
                company: form.querySelector('#company').value,
                nip: form.querySelector('#nip').value,
            })
            .then(function (response) {
                if(response.data === 1){
                    form.querySelector('.alert-success').classList.remove('d-none')
                }
            })
            .catch(function (error) {
                console.log(error);
            });
        }

    })
}

